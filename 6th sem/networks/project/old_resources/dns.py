from scapy.all import *
def get_hostname_from_pcap(filename):
    '''
    Gets hostname from pcap file using the first packet.
    First packet can be either query or reply.
    '''
    trace = rdpcap(filename)
    first_packet = trace[0]
    if(len(first_packet.layers()) < 4 or type(first_packet[3]) != scapy.layers.dns.DNS):
        # Not a DNS packet
        return ""
    else:
        # DNS packet
        return first_packet[3][1].getfieldval('qname').decode('ascii')
print(get_hostname_from_pcap('mypcap.pcap0.9889645821775284'))
print(get_hostname_from_pcap('mypcap.pcap0.45427740094126323'))
