#route user guide/manual

> view default gateways for specific networks and add and remove networks/gateways.

- add a default gateway to a network on your routing table (specify which networking device. ex wlan0 or eth0)

`route add -net 192.168.0.0/24 gw 192.168.0.1 eth0`
`OR`
`route add -net 192.168.0.0 netmask 255.255.255.0 gw 192.168.0.1 eth0`



