#nmap

> port scanner and network mapper user manual.


- Nmap help flag is VERY helpful. Refer to that first.

`nmap --help`

- A normal host discovery scan

`nmap -sn --max-retries 0 192.168.0.0/24
`-sn is disable port scan and do ICMP only`
`--max-retries 0 keeps nmap from taking forever on every host`
`--host-timeout 100ms (miliseconds) or s=seconds, m=minutes, h=hours.`
`-T5 makes the scan go faster (options are T0 through T5).


- scan via specific network interface/card

`nmap -e eth0 192.169.0.1

- Simply list targets to scan inline

`-sL`

- Input targets from a list of hosts/networks
`-iL <inputfilename>

- Only show open ports or possibly open ports

`--open`

- Print hosst interfaces and routes (for debugging)

`--iflist`

- enable OS detection

`-O`

- port range(s)

`-p 1-200`
`OR`
`-p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9`

- Scan Techniques

`-sS/sT/sA/sW/sM/sU/sO: TCP SYN/Connect()/ACK/Window/Maimon/UDP/TCP Null/FIN/Xmas/sN/sF/sX/IP protocol scan scans`

- Scan ports consecutively

`-r`

- Fast mode - scan fewer ports than the default scan

`-F`







 - Check if an IP address is up, and guess the remote host's operating system:
   nmap -O {{ip_or_hostname}}

 - Try to determine whether the specified hosts are up and what are their names:
   nmap -sn {{ip_or_hostname}} {{optional_another_address}}

 - Like above, but also run a default 1000-port TCP scan if host seems up:
   nmap {{ip_or_hostname}} {{optional_another_address}}

 - Also enable scripts, service detection, OS fingerprinting and traceroute:
   nmap -A {{address_or_addresses}}

 - Assume good network connection and speed up execution:
   nmap -T4 {{address_or_addresses}}

 - Scan a specific list of ports (use -p- for all ports 1-65535):
   nmap -p {{port1,port2,…,portN}} {{address_or_addresses}}

 - Perform TCP and UDP scanning (use -sU for UDP only, -sZ for SCTP, -sO for IP):
   nmap -sSU {{address_or_addresses}}

 - Perform full port, service, version detection scan with all default NSE scripts active against a host to determine weaknesses and info:
   nmap -sC -sV {{address_or_addresses}}
