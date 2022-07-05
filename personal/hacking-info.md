# hacking-info

> Guide to steps and tools needd to hack.

Include the tools you are comfortable with on your CV (resume).


FOOTPRINTING- all about gathering information on your target.
Network architecture, users, operating systems, applications.

Find sensitive information on websites.
Social Engineer on social media or forums (your a person wanting to more about a company you are considering joining.
Look for a facebook group of the company.
Then look for friends of that company because that is where you will find existing employees and then see if you can backtrack from there.
See if you can Google hack them. 
You can use the GUI 'site digger' OR the google hacking database.
This will find resources that have been crawled by the google search engine. That companies may not know that are being listed there such as printers or cameras which could provide you an insight of IP addresses that are exposed or what machines they have.
You could start up a conversation with an employee over facebook (social media) and say "hi, it looks like you have an excellent company and i ahve been thinking about joining the IT team. What kind of devices do you use in there."

Footprint the website using: black widow OR website copier. These will download any website you visit. This will help you to identify if they are making quieries from the front end to the back end.

Email footprinting: nslookup to find out the dns names and ip addresses of their servers. From e-mail you can see what encryption they are using and other services that can be used along with their e-mail environment(s).

Find out how they are hosting the e-mail servers OR what hosting providers they use.

Next you can use some competitive intelligence, which is they way most business are using to find out about their competitors. Allows you to see what projects the company is working on and maybe even who is working on which projects.

Next do a whois to find out who owns their ip address range or their domain. You can use the tools: domain dosie OR SmartWhois. Some times these tools will do some necessary dns enumeration, which is your next step. You can use tools such as SamSpade OR the nslookup command which is very powerful.
This will (hopefully) shed some light on key hosts in the network which you can then use to perform a social engineering attack OR a dns poisoning attack. 

Next, do a network reconissance, Use: path analyzer pro which will show you the path that a packet takes OR use a network pinger or visual route tool, which will help you draw a better diagram of the network.

Try shoulder surfing, dumpster diving, or eaves dropping in order to find out what security products the organization is using, operating systems, software systems, network layout, ip address, or the names of their servers. 

Document everything you find. 
With it you can analyze the security posture of your target. 


HOST DISCOVERY WITH PORT SCANNING

Find out which systems are alive on the network and how often are they alive on the network. Are the sites only up during certain times.
Discover the ports that are currently open on these nodes and the services they are running.
Look for any banners that you can grab. Banners can be hid. 

netscan tools pro OR nmap (gui based version called zenmap).
Gather a list of nodes that are active on the network.
Then to a port scan.

Perform a banner grab / operating system finger print.
- You can send certain commands to a system and each operating system will respond in it's own ceratin way. -
The tools for banner grabbing: Telnet OR SSH.

Next Scan for vulnerabilities. Some tools: Core impact professional OR retina OR MBSA microsft baseline security analyzer OR GFI LAN guard.

Draw out the Network. Use: Solarwinds OR Network Topology Manager.
You can send out commands to multiple devices at a time and even schedule command deployment. Solarwinds can be used for IP management purposes and for alerting about network outages, and interface downtimes. It's not a free product.

Next fire up your proxies. Proxies help hide where the attack is coming from. Proxies can be setup both internally and externally. Tools: Proxy Work Bench (has GUI version using the TOR network) (or for MacOS: Proxifier). 
Create a proxy chain.

Document EVERYTHING including which proxies you decide to use.
It helps you preserve all of the outcomes of the test that you have conducted and it will help you find potential vulnerabilities on the network so you can suggest counter measures.
And it is the best way of legitimizing what you did and what an attacker can do to them.

Once you have found your targets the next step is enumeration.
ENUMERATION
Get: identity groups, user accounts and service accounts, because nobody looks at those things.
Determine network resources and your network shares or other things that are shared from that machine.
You should try enumerate the applications that are installed on those devices. 
Builds on the data from the recon phase.
Also enumerate network devices such as: routers, switches, IDSs, IPSs, firewalls, identity services engines, wireless lan controllers, and so on.
As a pentester, You'll need to do numerous types of enumeration methods to be sure you get all of the information that you can on each machine of a network. You'll need to find all of the weakness in the company.

You can start the enumeration steps by finding the network name of the company or the targets and you can do that with the command 'whois' to look at devices to see what ranges they have been given on the public side. This is where you usually find the most important servers because it is the face of the company.

You can start the enumeration steps by finding the network range of the compnay or the targets by using the whois command to see what ranges they have been assigned on the public side. 
Once you have the ip range you want to calculate the subnet mask. This will help you to narrow down your ping sweeps and port scanning.

Then Discover the hosts that are publicly avalible from the internet. Angry IP Scanner is very easy to detect. Nmap is much more subtle.
Scan only once a minute so it doesn't look like a ping sweep.
Once you've disovered the host you go after the ports.
Look to see which are open, which are closed, and which are only allowing specific traffic through.
This gives you a better layout of the security policy on those machines.
Another tool: Netbios enumeration.
Netbios enumeration gets you a list of network devices, and computers that maybe on the domain.

