def TopoInfo(self):

    #Gather node info for all nodes in the network
    for item , value in self.net.items():
        if value.__class__.__name__ in CONTROLLERS_TYPES:
            self.Nodes.append({'name': item, 'widget':None, 'type':value.__class__.__name__, 'ip':value.ip, 'port':value.port, 'color':self.Controller_Color})
        elif value.__class__.__name__ in SWITCHES_TYPES:
            self.Nodes.append({'name': item, 'widget': None, 'type': value.__class__.__name__, 'dpid':value.dpid, 'color': None, 'controllers':[]})
        elif value.__class__.__name__ in HOSTS_TYPES:
            if  self.appPrefs['displayHosts'] == 1:
                self.Nodes.append({'name': item, 'widget': None, 'type': value.__class__.__name__, 'ip':value.IP(), 'color': None})
            else:
                continue
        else:
            self.Nodes.append(
                {'name': item, 'widget': None, 'type': value.__class__.__name__, 'color': None})

        #Gather interface info for all interfaces of a node
        for intf in value.intfList():
            intf2 = str(intf.link).replace(intf.name,'').replace('<->','')
            if intf2 != 'None':
                self.intfData.append({'node': item, 'type': value.__class__.__name__, 'interface': intf.name, 'mac': intf.mac, 'ip':intf.ip,
                              'link': intf2, 'TXP': 0, 'RXP': 0, 'TXB': 0, 'RXB': 0})

    #To find and save the controller that each switch is connected to. Needed because there can be more than one controller.
    for switch in self.Nodes:
        if switch['type'] in SWITCHES_TYPES:
            try:
                switch_info = check_output(["ovs-vsctl", "get-controller", switch['name']])
            except:
                switch_info = '-1'
            first_controller = None
            for controller in self.Nodes:
                if controller['type'] in CONTROLLERS_TYPES:
                    controller_info = str(controller['ip']) + ':' + str(controller['port'])
                    if controller_info in switch_info:
                        switch['controllers'].append(controller['name'])
                    if first_controller == None:
                        first_controller = controller['name']
            # TODO: Assign user switch properly to the correct controller
            # Currently just assigning the first controller to the switch. Will work if there is only one controller.
            if switch['controllers'] == []:
                switch['controllers'].append(first_controller)
