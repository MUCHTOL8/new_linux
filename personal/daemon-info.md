# Daemon List

## https://admin.com/samples/Daemons.pdf

Use the above URL to continue your daemon pages.

> List of all common linux daemons and what they do.

Daemons are managed by systemd. The systemctl command is the user interface used to manage them. It reads name.service files that contain information about how and when to start the associated daemon. Service files are stored in /{etc,usr/lib,run}/systemd/system. 


 Determine which daemons are available to run through inetd.conf or 
xinetd.conf.
 Use a tool such as netstat to determine what ports are in a “listening” state on your machine. 
 How can you reconcile the netstat information with what is found in inetd.conf or xinetd.conf? If there is a discrepancy, what is going on?
 What (if any) additional information did you learn from nmap that wasn’t obvious from netstat?

 inetd or inetd is a super daemon that maanges the other daemons.

   - anacron: It runs delayed cron actions at the start-up time-

`executes jobs at time intervals rather than at specific times. anacron is particularly useful on systems that are not always turned on, such as laptops.`

   - amd: Auto Mount Daemon, mount filesystems on demand - 

`NFS automounters, daemons that wait until a process attempts to use a filesystem before they actually mount it. The automounters later unmount the filesystems if they have not been accessed in a specified period of time.`
`The use of automounters is very helpful in large environments where dozens or hundreds of filesystems are shared on the network. Automounters increase the stability of the network and reduce configuration complexity since all systems on the network can share the same amd or automountd configuration.`

  -  atd: Executes jobs queued applying the at the tool. 
    
  -  apmd: Advanced Power Management Daemon.
    
  -  automount: mount filesystems on demand -

`NFS automounters, daemons that wait until a process attempts to use a filesystem before they actually mount it. The automounters later unmount the filesystems if they have not been accessed in a specified period of time.`
`The use of automounters is very helpful in large environments where dozens or hundreds of filesystems are shared on the network. Automounters increase the stability of the network and reduce configuration complexity since all systems on the network can share the same amd or automountd configuration.`

  -  crond: A task scheduler daemon-

`responsible for running commands at preset times. It accepts schedule files (“crontabs”) from both users and administrators. cron is frequently employed for administrative purposes, including management of log files and daily cleanup of the filesystem.`
    
  -  autofs: It helps the automounter daemon permitting unmount and mount of devices over demand.
    
  -  dhcpd: Dynamic Host Configuration Protocol. Dynamic address asssignment AND it is an Internet Bootstrap Protocol Server - 

`(DHCP) provides PCs, laptops, and other “mobile” platforms with information about their IP addresses, default gateways, and name servers at boot time. dhcpd is the daemon that implements this service under Linux. A fancier elaboration of DHCP called PXE (Pre-boot eXecution Environment) helps compatible machines boot from the network without the need for a local boot device;`

  -  cupsd: CUPS (Common UNIX Printing System) printer daemon - 

`impliments ver. 1.1 of the IPP (Internet Printing Protocol). It allows remote users to print to their offices (or vice versa) by using a web interface. It is flexible enough to allow for remote authentication.`

  -  ftpd: FTP Server Daemon, file transfer server - 

`ftpd is the daemon that handles requests from ftp, the Internet file transfer program. Many sites disable it, usually because they are worried about security. ftpd can be set up to allow anyone to transfer files to and from your machine. A variety of ftpd implementations are available for Linux systems. If you plan to run a high-traffic server or need advanced features such as load management, it might be wise to investigate the alternatives to your distribution’s default ftpd. WU-FTPD, developed at Washington University, is one of the most popular alternatives to the standard ftpd. See www.wu-ftpd.org for more information.`

  -  hald: hardware abstraction layer (HAL) daemon - 

`hald collects information about the system’s hardware from several sources. It provides a live device list through D-BUS.`

  -  httpd: Web Server Daemon - 

`httpd lets your site become a web server. httpd can send text, pictures, and sound to its clients. `

  -  gated: Maintain complicated routing tables. Routes the daemons that replace egpup and routed and manage more than one routing protocol - 

`gated understands several routing protocols, including RIP, the protocol used by routed. gated translates routing information among various protocols and is very configurable. It can also be much kinder to your network than routed.`

  -  lpd: Line Printer Daemon - 

`responsible for the old-style BSD print spooling system. Accepts jobs from users and forks processes that perfom the actual printing. It's also responsible for transferring print jobs to and from remote systems. `

  -  lwrsd: lightweight resolver library server - 

`lwresd provides a quick method of caching address-to-hostname and hostname-to-address lookups. It’s contacted by a stub resolver that is part of the system’s standard libraries and is called directly by many programs. The library and daemon communicate through a simple UDP protocol.`

  -  imapd: imap server daemon - 

`The imapd daemon implements the Internet Message Access Protocol, IMAP, which is a more festive and featureful alternative to POP. It allows PC-based users (or Linux users with IMAP-enabled mail readers) to access their email from a variety of locations, with mail folders being stored on the Linux server. Check out www.imap.org for more information about IMAP.`

  -  inetd: Internet Superserver Daemon- 

`art up their client daemons when there is work for them to do and allow the clients to die gracefully once their tasks have been completed. most Linux distributions have migrated to Panos Tsirigotis’s xinetd, a souped-up alternative that incorporates security features similar to those formerly achieved through the use of tcpd, the “TCP wrappers” package. Unfortunately, inetd’s  configuration file is not forward-compatible with that of xinetd. Debian and Ubuntu still use the standard inetdi. xinetd and inetd only work with daemons that provide services over the network.`

  -  in.fingerd: look up users - 

`in.fingerd provides information about the users that are logged in to the system. If asked, it can also provide a bit more detail about individual users. in.fingerd does not really do much work itself: it simply accepts lines of input and passes them to the local finger program. 
finger can return quite a bit of information about a user, including the user’s login status, the contents of the user’s GECOS field in /etc/passwd, and the contents of the user’s ~/.plan and ~/.project files.`

`If you are connected to the Internet and are running in.fingerd, anyone in the world can obtain this information. in.fingerd has enabled some really neat services (such as the Internet white pages), but it has also enabled people to run a variety of scams, such as finding people to cold-call and prospecting for spammable addresses. Some sites have responded to this invasion by turning off in.fingerd, while others just restrict the amount of information it returns. Don’t assume that because in.fingerd is simple, it is necessarily secure—a buffer overflow attack against this daemon was exploited by the original Internet worm of 1988.`

  -  in.rlogind: obsolete remote login server - 

`in.rlogind was the long-ago standard for handling remote logins. When invoked by inetd, it tries to automatically authenticate the remote user by examining the local user’s ~/.rhosts file and the system-wide /etc/hosts.equiv. If automatic authentication is successful, the user is logged in directly. Otherwise, in.rlogind executes the login program to prompt the user for a password. Because of its cheap ‘n’ easy authentication, in.rlogind is a major security hazard.`

  -  in.telnetd: yet another remote login server - 

`in.telnetd is similar to in.rlogind, except that it uses the TELNET protocol. This protocol allows the two sides (client and server) to negotiate flow control and duplex settings, making it a better choice than in.rlogind for links that are slow or unreliable. Like rlogin, telnet transmits plaintext passwords across the network. Its use is therefore discouraged in modern networks. However, many non-Linux systems support telnet.`

  -  in.tftpd: trivial file transfer server - 

`in.tftpd implements a file transfer protocol similar to that of ftpd, but much, much simpler. Many diskless systems use TFTP to download their kernels from a server. in.tftpd does not perform authentication, but it is normally restricted to serving the files in a single directory (usually /tftpboot). Since anything placed in the TFTP directory is accessible to the entire network, the directory should contain only boot files and should not be publicly writable.`

  -  in.rshd: remote command execution server - 

`in.rshd handles remote command execution requests from rsh and rcmd. The authentication process enforced by in.rshd is similar to that of in.rlogind, except that if automatic authentication does not work, in.rshd denies the request without allowing the user to supply a password. in.rshd is also the server for rcp (remote copy). Like in.rlogind, in.rshd has become something of a security albatross and is invariably disabled.`

  -  memchached: An in-memory distributed object caching daemon.
    
  -  mysql: A database server daemon.
    
  -  mountd: A mount daemon.
    
  -  nfsd: Network File Sharing Daemon.
    
  -  named: A DNS server daemon -

`named is the most popular server for the Domain Name System. It maps hostnames into network addresses and performs many other feats and tricks, all using a distributed database maintained by nameds everywhere.`

  -  nflock: Used for starting and stopping the locking services of nfs files.
    
  -  ntpd: Network Time Protocol service daemon -

`Debian and Ubuntu don’t seem to include ntpd by default, but it’s readily available through apt-get. ntpd uses the gentler adjtimex system call to smooth the adjustment of the system’s clock and prevent large jumps backward or forward. adjtimex biases the speed of the system’s clock so that it gradually falls into correct alignment. When the system time matches the current objective time, the bias is cancelled and the clock runs normally. `

  -  nmbd: Network Message Block Daemon, NetBIOS name server -

`nmbd is another component of Samba. It replies to NetBIOS name service requests generated by Windows machines. It also implements the browsing protocol that Windows machines use to populate the My Network Places folder and makes disks shared from the local host visible there. nmbd can also be used as a WINS server.`

  -  nscd: name service cache daemon -

`nscd caches the results of calls to the standard C library routines in the getpw*, getgr*, and gethost* families, which look up data that was traditionally stored in the passwd, group, and hosts files. These days, the range of potential sources is larger and includes options such as NIS and DNS. nscd does not actually know where the data comes from; it simply caches results and uses them to short-circuit subsequent library calls. Caching policy is set in the /etc/nscd.conf file.`

  -  popd: basic mailbox server -

`The popd daemon implements the Post Office Protocol (POP). This protocol is commonly used by non-Linux systems to receive electronic mail.`
  
  -  portmap: a port management daemon that manages port assignment for daemons that use RPC.

  -  postgresql: A database server daemon.
    
  -  postfix: A mail transport agent and used as a substitution for Sendmail.
    
  -  rpcbind: Remote Procedure Call Bind Daemon.
    
  -  rpciod: cache NFS blocks -

`caches read and write requests on NFS clients. It performs both read-ahead and write-behind buffering and greatly improves the performance of NFS. This daemon is analogous to the biod and nfsiod daemons found on other systems, although it is structurally somewhat different.`

  -  rpc.bootparamd: advanced diskless life support -

`rpc.bootparamd uses the /etc/bootparams file to tell diskless clients where to find their filesystems. rpc.bootparamd service is often used by machines that get their IP addresses by using RARP and that use NFS to mount their filesystems.`

  -  rpc.lockd: manage NFS locks -

`Although rpc.lockd and rpc.statd are distinct daemons, they always run as a team. rpc.lockd maintains advisory locks (a la flock and lockf ) on NFS files. rpc.statd allows processes to monitor the status of other machines that are running NFS. rpc.lockd uses rpc.statd to decide when to attempt to communicate with a remote machine.`

    rpc.nfsd: serve files -

`runs on file servers and handles requests from NFS clients. In most NFS implementations, nfsd is really just a part of the kernel that has been dressed up as a process for scheduling reasons. Linux actually sports two different implementations, one of which follows this convention and one of which runs in user space. The kernel implementation is more popular and is most distributions’ default. rpc.nfsd accepts a single argument that specifies how many copies of itself to fork. Some voodoo is involved in picking the correct number of copies.`

  -  rpc.mountd: respond to mount requests -

`accepts filesystem mount requests from potential NFS clients. It verifies that each client has permission to mount the requested directories. rpc.mountd
consults the /var/state/nfs/xtab file to determine which applicants are legitimate.`

  -  rpc.statd: manage NFS locks -

`Although rpc.lockd and rpc.statd are distinct daemons, they always run as a team. rpc.lockd maintains advisory locks (a la flock and lockf ) on NFS files. rpc.statd allows processes to monitor the status of other machines that are running NFS. rpc.lockd uses rpc.statd to decide when to attempt to communicate with a remote machine.`

  -  rpc.rquotad: serve remote quotas -

`lets remote users check their quotas on filesystems they have mounted with NFS. The actual implementation of quota restrictions is still performed on the server; rpc.rquotad just makes the quota command work correctly.`

  -  rpc.ypxfrd: transfer NIS databases -

`rpc.ypxfrd efficiently transfers NIS databases to slave servers. A slave initiates a transfer with the ypxfr command. Whenever a database is changed on the master, it should immediately be pushed out to all the slaves so that the NIS servers remain consistent with one another.`

  -  rsyncd: synchronize files among multiple hosts -

`rsyncd is really just a link to the rsync command; the --daemon option turns it into a server process. rsyncd facilitates the synchronization of files among hosts. It’s essentially an efficient and security-aware version of rcp. rsync is a real treasure trove for system administrators, and in this book we’ve described its use in a couple of different contexts. See page 508 for general information and some tips on using rsync to share system files. rsync is also a large part of many sites’ internal installation processes.`

  -  routed: Maintains routing tables -

`routed maintains the routing information used by TCP/IP to send and forward packets on a network. routed deals only with dynamic routing; routes that are statically defined (that is, wired into the system’s routing table with the route command) are never modified by routed. routed is relatively stupid and inefficient, and we recommend its use in only a few specific situations.`

  -  sendmail: A mail transfer agent daemon -

`sendmail’s tasks include accepting messages from users and remote sites, rewriting addresses, expanding aliases, and transferring mail across the Internet. sendmail isan important and very complex daemon. Refer to Chapter 18, Electronic Mail, for the complete scoop.`

  -  smbd: A Samba Daemon, provide file and printing service to Windows clients -

`smbd is the file and printer server in the Samba suite. It provides file and printer sharing service through the Windows protocol known variously as SMB or CIFS.`

  -  smtpd: Simple Mail Transfer Protocol Daemon -

`smtpd listens on port 25 for incoming email messages and forwards them to your back-end transport system for further processing. See pages 540 and 624 for more information about the use of smtpd in the sendmail and Postfix systems.`

  -  snmpd: Simple Network Management Protocol Daemon, provide remote network management service-

`snmpd responds to requests that use the Simple Network Management Protocol (SNMP) protocol. SNMP standardizes some common network management operations.`

  -  squid: A web page caching proxy server daemon.
    
  -  sshd: A Secure Shell Server Daemon - 

`sshd provides services that are similar to in.rlogind, but its sessions are transported (and authenticated) across an encrypted pipeline. A variety of encryption algorithms are available. Because of the harsh environment of the Internet today, you must allow shell access from the Internet only through a daemon such as this—not in.rlogind or in.telnetd.` 

  -  syncd: It can keep various file systems synchronized along with system memory.
    
  -  syslogd: system logging daemon - 

`syslogd acts as a clearing house for status information and error messages produced by system software and daemons. Before syslogd was written, daemons either wrote their error messages directly to the system console or maintained their own private log files. Now they use the syslog library routine to transfer the messages to syslogd, which sorts them according to rules established by the system administrator.`

  -  systemd: manages daemons and coordinates logging.

  -  talkd: network chat service - 

`Connection requests from the talk program are handled by talkd. When it receives a request, talkd negotiates with the other machine to set up a network connection between the two users who have executed talk.`

  -  tcpd: It has a service wrapper that can restrict the authorization to inetd-based services from hosts.deny and hosts.allow.
    
  -  telnetd: A Telnet Server Daemon.
    
  -  udevd: serialize device connection notices - 

`udevd is a minor part of the udev dynamic device-naming system. It allows for the proper serialization of hot-plug events, which the kernel can sometimes communicate out of order to user space.`

  -  vsftpd: Very Secure FTP Daemon.
    
  -  webmin: A web-based administration server daemon.
    
  -  xntd: A Network Time Server Daemon.
    
  -  xinetd: An Enhanced Internet Superserver Daemon.

`
    
  -  ypbind: locate NIS servers - 

`The ypbind daemon runs on all NIS clients and servers. It locates an NIS server to which queries can be directed. ypbind does not actually process requests itself; it just tells client programs which server to use.`

  -  ypserv: NIS server - 

`ypserv runs on all NIS servers. ypserv accepts queries from clients and responds with the requested information.`



For architectural reasons, a few parts of the Linux kernel are managed as if they were user processes. The kernel threads show up in square brackets when show by ps. They usually have a k at the start of their names and have a low PID. 
For the most part, these processes deal with various aspects of I/O, memory man-
agement, and synchronization of the disk cache. They cannot be manipulated by 
the system administrator and should be left alone.
Daemons that include an N parameter in their names (as shown by ps) run separately on each CPU of a multi-CPU system; the N tells you 
which copy goes with which CPU.
If you are familiar with the implementation of the kernel, it is occasionally useful to change these processes’ execution priorities. However, this is not a standard administrative task.
Port numbers are not arbitrary. All machines must agree about which services go with which ports; 
otherwise, requests will constantly be directed to the wrong port. If you are creating a site-specific service, pick a high port number (greater than 1023) that is not already listed in the services file.


 -  klogd: Reads log entries form the kernel's message buffer and forwards them to syslog. It can also process messages itself if configured to do so.
 -  kupdate
 -  kswapd/N: Moves pages to swap
 -  keventd
 -  kapm
 -  ksoftirqd/N: Handles software interrupts when the load is high
 -  kacpid: Deals with the ACPI subsystem
 -  kblockd/N: Blocks subsystem work
 -  aio/N: Retries asynchronous I/Os
 -  ata/N: Does processing for serial ATA support
 -  scsi_eh_N: Performs SCSI error handling
 -  kjournald: Supports journaling filesystems
 -  events/N: Does generic work queue processing
 -  mdrecoveryd: Part of the "multiple devices", implementation, more commonly known as RAID



