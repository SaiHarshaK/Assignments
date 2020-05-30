Instructions
  The variables which need to be modified for change in environment:
	firewall_monitor.py:24:: sys.path.insert(1, '/home/harsha') # for importing checkSim.py.

  The variables which need to be modified for changing functionality:
	checkSum.py:120:: filterword # filters used to block
	firewall_monitor.py:28:: dns_servers # list of dns servers
	firewall_monitor.py:30:: allow_subnet # subnets to allow
	firewall_monitor.py:32:: reject_regex # subnets to reject

  To simulation of the network topology:
	$ sudo mn --topo=tree,1,3 --mac --controller=remote --switch ovsk,protocols=OpenFlow13 --nat

  To run the firewall_monitor.py from ryu:
	$ ryu-manager --verbose firewall_monitor.py

  To view documentation check class list in index.html in html folder.
