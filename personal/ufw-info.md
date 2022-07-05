# ufw-info

> All things ufw (Uncomplicated Firewall)


#-------------------------------------------------------------------------------------------
#-----------------  |UNDERSTANDING THE FIREWALL AND IT's LIMITED PURPOSE|  -----------------
#-------------------------------------------------------------------------------------------

# UFW is just a front end for iptables.
`.`
# The Linux kernel has builtin firewall called netfilter which is accessed through the nftables userspace utility and the nft command line program. It does not provide the functionality of UFW.
`.`
# Nothing can access your computer without a program opening a port (listening? and established?) and responding for connection requests or reaching out and asking to connect to an outside device. Therefore, so long as nothing is opening ports nothing can access your computervia the network because it's being blocked by the OS.
`.`
`.`
# A static firewall such as this then is only useful to:
`.`
# 1. Restrict all programs on your computer from opening any port they desire at any time they desire. This does not make your computer more secure from intrusion, it simply narrows the avenues of attack doesn to a few so there is less that needs to be monitored. 
# 	(Considering attacks come in stages and escalation needs to take place and establishing a connection over one of the only open ports in one of the only accepted protocols to one of the only accepted IP addresses would be much harder then, yeah, perhaps it makes your comptuer it harder to hack or seriously infect.)
# 2. Restrict certain ports to be used by specific program(s).
# 3. Restrict a specific port to be used by a specific protocol(s).
# 4. Allow, or Deny, all communication on a SPECIFIC PORT except from the specificied IP address(es).
# 5. Allow communicatoin attempts from specified subnet ranges. ex: 34.43.21.1 to 343.43.21.254. 
`.`
# Some ports must be left open for internet and LAN communication. You will be potentially vulnerable on these ports. They most be monitored zealously. It is often easier to see signs of an intruder on the machine than it is to see an intrusion happening in the logs because intrusions are often complicated but the things the intruder must do on the computer leaves tracks of a more noticable nature. Therefore other security measures are needed. Automated systems like an IDS are valuable but often resource heavy. Creating mini honey pots that will e-mail you or leave logs in the log files is a good way to know you've been compromised. These logs may be erased and the e-mail blocked so you will want to check and see if anything has been tampered with. A script that can check all of those things and is hidden would be useful, and possibly keeping it on an unattached usb would make it even more discreet/tamper proof. Now, let us continue.


#-------------------------------------------------------------------------------------------
#---------------------------  |CHECKING AND CHANGING STATUS|  ------------------------------
#-------------------------------------------------------------------------------------------

- All the default policies of UFW are located at /etc/default/ufw and can be changed using the following command:

`sudo ufw default <policy> <chain>`

- When installed, UFW is inactive by default. We need to enable it.

`sudo ufw enable`

- check UFW status (is it active?).

`sudo ufw status`

- disable ufw

`sudo ufw disable`

- reset all firewall rules in UFW

`sudo ufw reset`



#-------------------------------------------------------------------------------------------
#-------------------------------  |APPLICATION PROFILES|  ----------------------------------
#-------------------------------------------------------------------------------------------

- Whenever you install a package using apt command, it will create an application profile in ufw, that consists of service description and firewall rules for that application. All application profiles are store at /etc/ufw/applications.d and can be listed using the following command.

`sudo ufw app list`

- get specific information about an application (e.g. NGINX)

`sudo ufw app info 'Nginx'`


#-------------------------------------------------------------------------------------------
#---------------------------------------  |RULES|  -----------------------------------------
#-------------------------------------------------------------------------------------------

Whenever you mention port number or port range, you must specify the protocol to be used – TCP or UDP.

- Allow port 80 using UFW

`sudo ufw allow http`
`OR`
`sudo ufw allow 80/tcp`

- Allow SSH port 22 using UFW

`sudo ufw allow ssh`
`OR`
`sudo ufw allow 22/tcp`

- Allow https port 443 using UFW

`sudo ufw allow https`
`OR`
`sudo ufw allow 443/tcp`

- Allow custom port 3939 using UFW

`sudo ufw allow 3939/tcp`

- Allow port range 21-22 for FTP server. You add a colon (:) between start and end port numbers of the range.

`sudo ufw allow 21:22/tcp`

- Allow access from specific IP address 34.43.21.12, using 'allow' from keyword

`sudo ufw allow from 34.43.21.12`

- Allow access from specific IP but only to specific port (e.g. 22) then you need to use to 'any' port keyword and mention port number.

`sudo ufw allow from 34.43.21.12 to any port 22`

- Specify subnets to mean ip range. Here is the command to allow access from 34.43.21.1 to 34.43.21.254

`sudo ufw allow from 34.43.21.0/24`

- Block access to a specific port or from a specific IP by using deny keyword instead of allow keyword

`sudo ufw deny http # block http port 80`
`sudo ufw deny https # block https port 443`
`sudo ufw deny ssh # block ssh port 22`
`sudo ufw deny 3939/tcp # block custom port 3939`
`sudo ufw deny from 34.43.21.12 # block access from 34.43.21.12`
`sudo ufw deny from 34.43.21.0/24 # block access from 34.43.21.1-34.43.21.254`

- Delete any of the existing rules from UFW firewall, you can do so by either mentioning the rule number or by specifying the entire rule.

`sudo ufw delete 5 # deletes rule number 5`

- Get the list of rules along with number

`sudo ufw status numbered`

- Delete a rule by actually specifying it

`sudo ufw delete allow 80/tcp`


#-------------------------------------------------------------------------------------------
#------------------------------------  |LOGGING|  ------------------------------------------
#-------------------------------------------------------------------------------------------

UFW is just a front end for iptables, and so UFW log entries are actually from iptables.
`.`
UFW LOGGING COMMANDS:

- rsyslog must be running for UFW logging to work. 

`To check rsyslog status.`
`sudo service rsyslog status`

`sudo ufw status verbose`
`sudo ufw logging on`
`sudo ufw logging (off, low, medium, high, full)`
`less /var/log/ufw.log`


UNDERSTANDING THE LOGS:

`LEN = Packet's length.`
`TOS = (Type of Service) Packet classifcation, it is deprecated.`
`PREC = Precedence Type of Service.`
`TTL = Time to Live`
`ID = Unique ID for the IP datagram, shared by fragments of the same packat.`
`PROTO = Used protocol.`
`SPT = Source port.`
`DPT = Destination port.`
`MAC = Device's MAC address.`
`IN = Device for incoming traffic.`
`OUT = Device for outgoing traffic.`
`SRC = Connection source IP address.`
`DST = Destination IP address of connection.`



LINES BY LINE DESCRIPTION:

- Line 1: Feb  6 16:27:08 jonasgroenbek kernel: [71910.873115]

`date and time, your computer name, and kernel time since boot.`


- Line 2: [UFW BLOCK] IN=eth0 OUT=

`whenever iptables does a log entry there is an optional --log-prefix, in this case [UFW BLOCK]. The seriously annoying thing about UFW is that it uses the same prefix for every type of log entry, making it difficult to correlate back to the iptables rule set. The IN is the network interface name that the packet arrived on. The OUT is blank because the packet is not been re-transmitted, which might be the case if this was a router application.`


- Line 3: MAC=a6:8d:e2:51:62:4c:f0:4b:3a:4f:80:30:08:00

`These are the Machine Address Codes for the local area destination (a6:8d:e2:51:62:4c (eth0)) and source (f0:4b:3a:4f:80:30) network interface cards. In your case the source is probably the MAC of your ISP gateway NIC. 6 bytes each. The extra 2 bytes (08:00) at the end are the frame type, in this case it means "ethernet frame carried an IPv4 datagram".`


- Line 4: SRC=77.72.85.26 DST=157.230.26.180

`Those are the IP addresses for where the packet came from, SRC, and where is it supposed to going, DST and should be your IP address.`


- Line 5: LEN=40 TOS=0x00 PREC=0x00 TTL=251 ID=62215 PROTO=TCP

`Length of the payload portion of the raw packet; Type of service, Presedence, Time to live (how many hops left before the packet will die from too many hops); Identification; Protocol (in this case TCP).`


- Line 6: SPT=42772 DPT=3194 WINDOW=1024

`Source port; Detestation port; TCP window size`


- Line 7: RES=0x00 SYN URGP=0

`TCP flags, the important one here is "SYN" meaning it it attempting to make a NEW connection. This log entry means the attempt has been blocked.`


