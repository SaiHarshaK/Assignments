#! /home/sairamana/test/bin/python3
from scapy.all import *
def get_hostname(__packet):
    '''
    Returns SNI servername information from packet.
    If SNI info exists, returns the servername. Else returns an empty string.
    Please make sure __packet is an instance of scapy.layers.l2.Ether
    '''
    assert type(__packet)==scapy.layers.l2.Ether, "Incorrect input type"
    load_layer('tls')
    if(type(__packet[3])==scapy.packet.Raw):
        a = TLS(__packet[3].load)
    else:
        a = __packet[3]
    return a[2][1].getfieldval('servername').decode('utf-8')

pcap_file = rdpcap('TLS.pcapng')
ans = get_hostname(pcap_file[3])
print(type(ans))
print(ans)
    

