# Copyright (C) 2011 Nippon Telegraph and Telephone Corporation.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from ryu.base import app_manager
from ryu.controller import ofp_event
from ryu.controller.handler import CONFIG_DISPATCHER, MAIN_DISPATCHER
from ryu.controller.handler import set_ev_cls
from ryu.ofproto import ofproto_v1_3
from ryu.lib.packet import packet
from ryu.lib.packet import ethernet
from ryu.lib.packet import ether_types
from ryu.lib.packet import ipv4
from ryu.lib import pcaplib
from random import random
import sys
from scapy.all import *
import ipaddress

import json

sys.path.insert(1, '/home/mininet')
import checkSim

class FirewallMonitor(app_manager.RyuApp):
    OFP_VERSIONS = [ofproto_v1_3.OFP_VERSION]

    def __init__(self, *args, **kwargs):
        super(FirewallMonitor, self).__init__(*args, **kwargs)
        self.mac_to_port = {}

    @set_ev_cls(ofp_event.EventOFPSwitchFeatures, CONFIG_DISPATCHER)
    def switch_features_handler(self, ev):
        datapath = ev.msg.datapath
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser

        # install table-miss flow entry
        #
        # We specify NO BUFFER to max_len of the output action due to
        # OVS bug. At this moment, if we specify a lesser number, e.g.,
        # 128, OVS will send Packet-In with invalid buffer_id and
        # truncated packet data. In that case, we cannot output packets
        # correctly.  The bug has been fixed in OVS v2.1.0.
        match = parser.OFPMatch()
        actions = [parser.OFPActionOutput(ofproto.OFPP_CONTROLLER,
                                          ofproto.OFPCML_NO_BUFFER)]
        self.add_flow(datapath, 0, match, actions)

    def add_flow(self, datapath, priority, match, actions, buffer_id=None, drop=False):
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser

        if drop == True:
            inst = [parser.OFPInstructionActions(ofproto.OFPIT_CLEAR_ACTIONS, [])]
        else:
            inst = [parser.OFPInstructionActions(ofproto.OFPIT_APPLY_ACTIONS, actions)]

        if buffer_id:
            mod = parser.OFPFlowMod(datapath=datapath, buffer_id=buffer_id,
                                    priority=priority, match=match,
                                    instructions=inst)
        else:
            mod = parser.OFPFlowMod(datapath=datapath, priority=priority,
                                    match=match, instructions=inst)
        datapath.send_msg(mod)


    def addressInNetwork(ip,net):
        return ipaddress.ip_address(ip) in ipaddress.ip_network(net)

    '''
    Gets hostname from pcap file using the first packet.
    First packet can be either query or reply.
    '''
    def get_hostname_from_pkt(pkt):
        # print("inside name fetch")
        # print(pkt)
        scapy_pkt = Ether(pkt)
        # print("omz")
        if(len(scapy_pkt.layers()) < 4 or type(scapy_pkt[3]) != scapy.layers.dns.DNS):
            # Not a DNS packet
            return ""
        else:
            # DNS packet
            return scapy_pkt[3][1].getfieldval('qname').decode('ascii')

    def isReliable(self, src, dst, raw_pkt):
        # white list
        allow_subnet = ["10.0.0.0/24"]
        for subnet in allow_subnet:
            if addressInNetwork(dst, subnet) == True:
                return True
        name = get_hostname_from_pkt(raw_pkt)
        # this means that either the packet isn't tls packet or not a dns reply
        if name == "":
            return True
        # we have the name. now try to get similarity
        # print("in rel", name)
        sim = checkSim.similarity_check(name)
        # print("the sim of ", name, " is ", sim)
        return True

    # def get_hostname_from_ip_header(self, data):
    #     hex_str = ' '.join('%02x' % byte for byte in bytearray(data))
    #     dec_str = [int(i, 16) for i in hex_str.split(" ")]
    #     raw_str = [chr(i) for i in dec_str]
    #     raw_str = ''.join(raw_str)
    #     try_str = ""
    #     for char in raw_str:
    #         if char.isdigit() or char.isalpha():
    #             try_str += char
    #         else:
    #             try_str += " "
    #     print(' '.join(try_str.split()))
    #     # start = raw_str.find('www')
    #     # hostname = raw_str[start + 4:]
    #     # stop = hostname.find('0x03')
    #     # print(hostname[:stop])
    #

    @set_ev_cls(ofp_event.EventOFPPacketIn, MAIN_DISPATCHER)
    def _packet_in_handler(self, ev):
        # If you hit this you might want to increase
        # the "miss_send_length" of your switch
        if ev.msg.msg_len < ev.msg.total_len:
            self.logger.debug("packet truncated: only %s of %s bytes",
                              ev.msg.msg_len, ev.msg.total_len)
        msg = ev.msg
        datapath = msg.datapath
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser
        in_port = msg.match['in_port']

        pkt = packet.Packet(msg.data)
        eth = pkt.get_protocols(ethernet.ethernet)[0]

        if eth.ethertype == ether_types.ETH_TYPE_LLDP:
            # ignore lldp packet
            return
        dst = eth.dst
        src = eth.src

        dpid = datapath.id
        self.mac_to_port.setdefault(dpid, {})

        self.logger.info("packet in %s %s %s %s", dpid, src, dst, in_port)

        # learn a mac address to avoid FLOOD next time.
        self.mac_to_port[dpid][src] = in_port

        if dst in self.mac_to_port[dpid]:
            out_port = self.mac_to_port[dpid][dst]
        else:
            out_port = ofproto.OFPP_FLOOD

        actions = [parser.OFPActionOutput(out_port)]

        # install a flow to avoid packet_in next time
        if out_port != ofproto.OFPP_FLOOD and eth.ethertype == ether_types.ETH_TYPE_IP:
            ip = pkt.get_protocol(ipv4.ipv4)
            # print("The packets source is: %s , Dest is: %s", ip, ip.src, ip.dst, msg.data)
            match = parser.OFPMatch(eth_type=ether_types.ETH_TYPE_IP, ipv4_src=ip.src, ipv4_dst=ip.dst)

            drop = False
            # check if the src and dst are good.
            if self.isReliable(ip.src, ip.dst, msg.data) == False:
                # drop these
                drop = True
            # verify if we have a valid buffer_id, if yes avoid to send both
            # flow_mod & packet_out
            if msg.buffer_id != ofproto.OFP_NO_BUFFER:
                self.add_flow(datapath, 1, match, actions, msg.buffer_id, drop)
                return
            else:
                self.add_flow(datapath, 1, match, actions, drop=drop)
            if drop == True:
                return # no need to send packet_out.
        data = None
        if msg.buffer_id == ofproto.OFP_NO_BUFFER:
            data = msg.data

        out = parser.OFPPacketOut(datapath=datapath, buffer_id=msg.buffer_id,
                                  in_port=in_port, actions=actions, data=data)
        datapath.send_msg(out)
