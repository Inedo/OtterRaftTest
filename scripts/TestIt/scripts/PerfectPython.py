#!python
"""SetIP using RESTCONF

This Python script leverages RESTCONF to updates the IP address on the interface.
It's modeled off Cisco's restconf_update_ipaddress example script.

Args:
    interface_name (string): name of the interface to update
    ip_address (string): new IP address
    ip_netmask (string): new IP netmask

Example:
    Set the IP for the two adapters after setting environment variables
    for the username/password

        $ export XEUSER=antprash
        $ export XEPASS=ssp0i0y10
        $ py restconf_setip.py GigabitEthernet1 172.23.4.28 255.255.251.0
        $ py restconf_setip.py GigabitEthernet2 172.23.4.29 255.255.251.0    
    
Note:
    This script relies on `XEHOST`, `XEUSER`, and `XEPASS` environment variables for
    connecting to the IOS-XE script. They can be set using the restconf_setenv.py script.

    `--mock` may be passed as the final argument to the script

AhParameters:
    interface_name (string): name of the interface to update
    ip_address (string): new IP address
    ip_netmask (string): new IP netmask
    mock (switch): indicates whether the RESTCONF calls will be executed
    XEHOST (string,optional): the host + port for the IOS XE management interface
    XEUSER (string,optional): the username for XE management
    XEPASS (string,optional): the password for XE management

AhArgsFormat:
    $interface_name $ip_address $ip_netmask $mock

AhEnvVars:
	XEHOST
	XEUSER
  	XEPASS

"""
import os
import logging
import json
import requests
import sys
from collections import OrderedDict
import urllib3

try:
    XEHOST = os.environ['XEHOST']
    XEUSER = os.environ['XEUSER']
    XEPASS = os.environ['XEPASS']
except KeyError:
    logging.critical('XEHOST, XEUSER, and XEPASS are required environment variables.')
    sys.exit(1)

try:
    _, interface_name, ip_address, ip_netmask = sys.argv
    mock = len(sys.argv) > 3 and sys.argv[4] == '--mock'

except:
    logging.critical('Usage: {s} interface_name ip_address ip_netmask'.format(s=sys.argv[0]))
    sys.exit(1)

logging.debug('Setting {n} to {i} ({m})...'.format(n=interface_name,i=ip_address, m=ip_netmask))

data = OrderedDict([('ietf-interfaces:interface',
      OrderedDict([
                    ('name', interface_name),
                    ('type', 'iana-if-type:ethernetCsmacd'),
                    ('ietf-ip:ipv4',
                        OrderedDict([
                          ('address', [OrderedDict([
                              ('ip', ip_address),
                              ('netmask', ip_netmask)
                          ])]
                          )
                        ])
                    ),
                  ])
                )])

url = "https://{h}/restconf/data/ietf-interfaces:interfaces/interface={i}".format(h=XEHOST, i=interface_name)

logging.debug('Contacting {l} (User: {u})...'.format(l=url,u=XEUSER))
try:
    if mock:
        logging.debug('--mock was set; not invoking.')
    else:
        response = requests.put(url,
                                auth=(XEUSER, XEPASS),
                                headers={'Content-Type': 'application/yang-data+json',
                                         'Accept': 'application/yang-data+json'},
                                verify=False,
                                json=data
                                )

except Exception as e:
    logging.debug(e);
    logging.fatal('An error occured while configuring the IP address.');
    sys.exit(1)
    
logging.info('IP has been configured.')
