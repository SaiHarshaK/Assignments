sudo brctl addbr bri1
sudo brctl addbr bri2
sudo brctl addbr bri3
sudo brctl addbr bri4
sudo brctl addbr bri5
sudo brctl addbr bri6
sudo brctl addbr bria_left
sudo brctl addbr bria_right
sudo brctl addbr brib_left
sudo brctl addbr brib_right
# sudo lsmod | grep dummy
# sudo modprobe dummy
# sudo ip link add eth1 type dummy
# sudo ip link add eth2 type dummy
sudo brctl addbr bri_trunk
# brctl show
# configure
# set interfaces ethernet ethX address 192.168.101.10/24
# set interfaces ethernet ethX address 2013:ABCD:101::10/64
# commit
# save
# delete interfaces ethernet ethX address 2013:ABCD:101::10/64
sudo ip link set bri1 up
sudo ip link set bri2 up
sudo ip link set bri3 up
sudo ip link set bri4 up
sudo ip link set bri5 up
sudo ip link set bri6 up
sudo ip link set bria_left up
sudo ip link set bria_right up
sudo ip link set brib_left up
sudo ip link set brib_right up
sudo ip link set bri_trunk up
# set ip in all vyos
# set protocols static route 192.168.102.0.0/24 next-hop 192.168.100.1
# set protocols static route6 2013:ABCD:102::/64 next-hop 2013:ABCD:100::1
# delete protocols static route 192.168.102.0.0/24
# sudo ifconfig eth2.20 arp

# set interfaces ethernet eth1 vif 100 description 'VLAN 100'
# set interfaces ethernet eth1 vif 100 address '192.168.100.1/24'
# set interfaces bridge 'br100'
# set interfaces ethernet eth1 vif 100 bridge-group bridge br100

# https://docs.vyos.io/en/latest/routing/ospf.html
# set protocols ospf area 0 network 192.168.0.0/24
# set protocols ospf parameters router-id 10.1.1.1
# set protocols ospfv3 area 0.0.0.0 interface eth1
# set protocols ospfv3 area 0.0.0.0 range 2020:abcd::/64
# set protocols ospfv3 parameters router-id 192.168.1.1
# set interfaces ethernet eth0 ip ospf cost <x>
