# pcap-info

> dv3: packet capture analysis guide using mainly wireshark.

Use these pcaps of IPv4 traffic to cover retrieval of four types of data:

    Host information from DHCP traffic
    Host information from NetBIOS Name Service (NBNS) traffic
    Device models and operating systems from HTTP traffic
    Windows user account from Kerberos traffic

Host Information from DHCP Traffic

Any host generating traffic within your network should have three identifiers: a MAC address, an IP address, and a hostname.

In most cases, alerts for suspicious activity are based on IP addresses. If you have access to full packet capture of your network traffic, a pcap retrieved on an internal IP address should reveal an associated MAC address and hostname.

How do we find such host information using Wireshark? We filter on two types of activity: DHCP or NBNS. DHCP traffic can help identify hosts for almost any type of computer connected to your network. NBNS traffic is generated primarily by computers running Microsoft Windows or Apple hosts running MacOS.

The first pcap for this tutorial, host-and-user-ID-pcap-01.pcap, is available here. This pcap is for an internal IP address at 172.16.1[.]207. Open the pcap in Wireshark and filter on bootp as shown in Figure 1. This filter should reveal the DHCP traffic.

Note: With Wireshark 3.0, you must use the search term dhcp instead of bootp.
