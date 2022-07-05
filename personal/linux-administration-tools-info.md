# dv1

> Popular CLI Tools


`.`
NETWORK

    aria2 – downloading just about everything. Torrents included.
    arpwatch – Ethernet Activity Monitor.
    auditctl - Network activity by processes.
    bmon – bandwidth monitor and rate estimator.
    bwm-ng – live network bandwidth monitor.
    conntrack - Shows the current active network connections.
    curl – transferring data with URLs. (or try httpie)
    darkstat – captures network traffic, usage statistics.
    dhclient – Dynamic Host Configuration Protocol Client
    dig – query DNS servers for information.
    dstat – replacement for vmstat, iostat, mpstat, netstat and ifstat.
    ethtool – utility for controlling network drivers and hardware.
    gated – gateway routing daemon.
    host – DNS lookup utility.
    hping – TCP/IP packet assembler/analyzer.
    ibmonitor – shows bandwidth and total data transferred.
    ifconfig - used to configure kernel-resident network interfaces. Activates at boot-time. And useful for debugging & when system tuning is needed.
    ifdown - disables a network interface/network connection.
    ifstat –  report network interfaces bandwidth.
    iftop – display bandwidth usage.
    ifup - enables a network interface/network connection.
    ip (PDF file) – a command with more features that ifconfig (net-tools).
    iperf3 – network bandwidth measurement tool. (above screenshot Stacklinux VPS)
    iproute2 – collection of utilities for controlling TCP/IP.
    iptables – make rules to allow or disallow network requests.
    IPTraf – An IP Network Monitor.
    iputils – set of small useful utilities for Linux networking.
    iw – a new nl80211 based CLI configuration utility for wireless devices.
    jwhois (whois) – client for the whois service.
    lft - like traceroute but gives a lot more information for debugging connections and finding where a box/system is. Displays route packets and file types.
    “lsof -i” – reveal information about your network sockets.
    mtr – ping, traceroute combo.
    neat - GNOME GUI admin tool that specifies needed information to set up a network card among other features.
    net-tools – utilities include: arp, hostname, ifconfig, netstat, rarp, route, plipconfig, slattach, mii-tool, iptunnel and ipmaddr.
    ncat – improved re-implementation of the venerable netcat.
    netcat – networking utility for reading/writing network connections.
    netconfig - configures a network, and enables network products.
    nethogs – a small ‘net top’ tool.
    Netperf – Network bandwidth Testing.
    netplan – Netplan is a utility for easily configuring networking on a linux system.
    netsniff-ng – Swiss army knife for daily Linux network plumbing.
    netstat - find network connections, routing tables, Ethernet card statistics and masquerade connections.
    netwatch – monitoring Network Connections.
    ngrep – grep applied to the network layer.
    nload – display network usage.
    nmap – network discovery and security auditing.
    nmcli – a command-line tool for controlling NetworkManager and reporting network status.
    nmtui – provides a text interface to configure networking by controlling NetworkManager.
    nslookup – query Internet name servers interactively.
    ping – send icmp echo_request to network hosts.
    route – show / manipulate the IP routing table.
    slurm – network load monitor.
    snort – Network Intrusion Detection and Prevention System.
    smokeping –  keeps track of your network latency.
    socat – establishes two bidirectional byte streams and transfers data between them.
    speedometer – Measure and display the rate of data across a network.
    speedtest-cli – test internet bandwidth using speedtest.net
    ss – utility to investigate sockets.
    ssh –  secure system administration and file transfers over insecure networks.
    tcpdump - monitor all TCP/IP packets transferred over a network.
    tcptrack – Displays information about tcp connections on a network interface.
    telnet – user interface to the TELNET protocol.
    tracepath – very similar function to traceroute.
    traceroute – print the route packets trace to network host.
    vnStat – network traffic monitor.
    websocat – Connection forwarder from/to web sockets to/from usual sockets, in style of socat.
    wget –  retrieving files using HTTP, HTTPS, FTP and FTPS protocols
    Wireless Tools for Linux – includes iwconfig, iwlist, iwspy, iwpriv and ifrename.
    wireshark – network protocol analyzer.


SYSTEM MONITORING

    auditctl - Create rule to capture any kind of action  on the system to a log file.
    htop - a better, sleeker top.
    glances - monitor linux system. can collect system statistics apart from the monitoring.
    goaccess - real time log viewer and analyzer. view real time logs for all web servers (Nginx , Apache, Amazon S3 and CloudFront etc).
    iftop - view both the source and destination bandwidth usage on the Ethernet cards of your Linux system. 
    iostat - provides detailed statistics about the systems input/output for both devices and partitions. monitor the performance of both local and remote disks (NFS) as well.
    iotop - monitor disk I/O usage details. Similar to top but with an added feature of providing a detail for a specific thread or a process in the system. Hence, system administrators can easily identify the process that is causing a lot of I/O rewrites to the server.
    lsof - lists open files and the corresponding processes. One of the major advantages of this command is that it helps administrators to see the files currently in use when a disk cannot be unmounted.
    top - provides details about all running processes in an ordered list. The list also keeps updating in real time. Not only the process names, it also displays the memory usage and CPU usage etc.
    vmstat - Its main task is used to display virtual memory statistics. It also helps you to display various information including all system processes, CPU activity, paging, block IO, kernel threads and disks etc. vmstat is the part of default installation.
dbus-monitor - 
    clamav - linux antivirus (clamtk is the gui front-end).
    stacer - GUI to manage processes, clean system, start-up applications, package management and much more. It's dope.
    bleachbit - (GUI app) an easy way to clean up your system. Free cache, delete cookies, clear internet history, shred temp files, delete logs, and tons of other stuff.


MEMORY

    ps_mem - list of all running processes and their individual memory consumption.
    cat /proc/meminfo - a virtual file that reports the amount of available and used memory. It contains real-time information and the buffers and shared memory used by the kernel. 
    free - Display the Amount of Physical and Swap Memory.
    vmstat - Reports virtual memory statistics. Provides general information about processes, memory, paging, block IO, traps, and CPU activity.
    top - check memory and CPU usage per process.
    htop - It's top with user-friendly environment and improved controls.
    For info ont the above 5 commands - https://phoenixnap.com/kb/linux-commands-check-memory-usage


HARD DRIVE  & FILE SYSTEM
    df - (disk free) shows amount of space taken up by different drives. Shows full file systems, can't show part of a filesystem.
    du - (disk usage) - can display disk usage for individual directories in Linux, giving you a finer-grained view of your disk usage. By default shows how much space the current directory uses.
    fsck - file system check for preventative maintenance or to fix issues.
    lsblk - shows block devices.
    mount - mount SD cards , USBs, etc.
    ncdu - disk usage analyzer with ncurses interface.
    dd - copy data from one media or location to another byte for byte


FINDING INFORMATION

    fzf - for finding any kind of file (fuzzy file finder).
    whatis - Gives the man page description of the command.
    tldr - Gives description of command and popular usage examples.
    locate - search for files based on file pemissions, ownership, modification, date, size
    find - search for files based on file permissions, ownership, modification date, size, etc.
    which - searches for a binary in the $PATH.
    uname - provides some system information
    w - lists currently logged in users.
    finger - provides short dump of info about a user such as timer of last login, their home dir, and user account's full name.
    history - use -200 or some number to display that many used commands.
    dmesg - write kernel messages to standard output.
    cheat - similar to tldr. Provides a command usage cheat sheet.
    multitail - follow multiple log files in real time in a terminal window.
    lsb_release - shows the distribution (needs flags).
    cat /etc/*-release - shows the distribution information.
    cat /etc/issue - shows the distribution information.
    lshw - show all the hardware information.
    id - display a user's UID and GID and the groups to which they belong.
    cat /etc/group - show a list of existing groups and their members.
    grep {user_name} /etc/passwd - prints your default shell (among other important things).
    type - displays all locations containing the specified executable.
    type -p - display the name of the disk file taht would be executed
    gnome-logs - for checking system logs alogether easily.

    

FILE CONVERSION, ENCRYPTION, COMPRESSION, ENCODING, TRANSLATION

    gzip - GNU's open source project for file compression. Used for web pages on servers and decompression in broswers. Popular for streaming media compression, and can concatenate and compress several streams simultaneously.
    export - converts files into another format. Often used to export data from a database.
    bzip2 - compress and decompress files at high rates.
    cpio - copies files into or out of a cpio or tar archive. Cpio has 3 operating modes and is more efficient than tar.
    od - dump binary files to standard output.
    pandoc - Convert documents between different formats. 
    soffice --headless - Convert documents to different file formats.
    libreoffice --headless - (an alias for soffice).
    groff - formats text to be in a printable format (such as pdf). Also works with documents containing pictures, tables and macros.




SYSTEM & SERVICE & USER CONFIGURATION

    date - set a system's date and time OR output current information.
    enbale - start or stop printers or classes.
    env - displays the current environment and it's variables OR runs a program in a modified environment.
    declare - declares variables, give them attributes, or modifies properties of variables.
    chown - change file or group ownership (even all in a dir tree) and view info on objects processed.
    chmod - change access mode (permissions) of one or many files.
    usermod - add user to a group(s) or change user's name, or create a new home directory for user & move their files.
    timeshift - system restore utility.
    su root - makes you root.
    sudo su - makes you root (actually works on ubuntu systems). 
    sudo -i - makes you root.
    chsh -s - change the default shell.
    source ~/.bash_aliases - updates the environment variables to include whatever is in .bash_aliases.
    .~/.bash_aliases - updates teh environment variables to include whatever is in .bash_aliases.
    dconf-editor - 
    service - manage services.
    systemctl - 
    tilda - a terminal emulator that behaves like a plugin instead of a window. It's essentially part of your desktop environment, and you can move it around and resize it. (guake might be the same but better).
    terminator - A terminal emulator with builtin tmux capabilities but better and more.
    rxvt - the lightest (usable) terminal emulators.
    chsh - change the system shell interpreter.
    zsh - best shell interpreter if you want to keep things bash like. The most fully featured shell interpreter. Always use this for writing scripts for personal use.
    fish - shell interpreter focused on ease of use. Advanced auto completion of commands and list navigation abilities set it apart.
    nushell - shell interpreter written in rust. Can present output and other text in tabular form, making them more readable. Can run commands on tabular data, and sort and filter it's content like a spreadsheet software. Much more intuitive piping. And much more.
    xonsh - python based shell interpreter. All the power of python directly in your terminal.

TEXT & STREAM & PROGRAMMING

    awk - manipulates text; a programming language tool.
    gawk - GNU's projet version of AWK programming langauge.
    sed - Stream editor used to filter text in a pipeline. Typically used for extracting part of a file using pattern matching or substituting multiple occurences of a string withing file.
    bat - a cat clone with syntax highlighting and Git integration.
    neovim - 


IMAGE & VIDEO & AUDIO

    feh - open pictures in your terminal (needs a running window server).
    ffmpeg - video and audio conversion tool.
    ardour - a Digital Audio Workstation (DAW) for recording, editing, and mixing audio. If you want to do professional level recording. Is great for instruments.
    audacity - open-source multi-track audio editor and recorder.
    blender - complete 3D creation suite. Supports rigging, modeling, video editing, animation, simulation, motion tracking, rendering, compositing, and 2D animation pipeline.
    gimp - most popular photoshop alternative. Utilize 3rd-party plugins and customization options.
    krita - painting app that can serve as an image manipulation tool.
    lightworks - powerful, flexible and beautiful tool for editing videos professionally.
    natron - video composition like you would with Adobe After Efffects. 
    openshot - video editor known for its excellent performance and powerful capabilities.
    pitiv - a nice, easy to use video editor with a ncie code base and hassle-free collaboration.
    rhythmbox - music player.
    lollypop - music player with online radio, scrubbing support, and party mode.
    amarok - music player with "tons of advanced features". Allows users to discover new music based on their genre preferences.
    clementine - an amarok-inspired music player.
    cmus - most efficient CLI music player. Make use of it's extensions.

PACKAGE MANAGEMENT & INSTALLATION

    apt-file - identify which package contains a specific file.
    dpkg -s - identify the package that owns the given file.
    ldd - check for necessary dependencies of a binary.
    devtools - automatically download dependencies when installing from source.
    apt-cache search - search for a package in the repos.



DAILY & FEQUENT

    free - Display the Amount of Physical and Swap Memory.
    df - (disk free) shows amount of space taken up by different drives.
    rm -rf ~/.local/share/Trash/files/* - this empties your recycle bin.
    dd if=/dev/sd(?) of=/dev/sd(?) bs=64M conv=sync,noerror status=progress
    systemctl list-unit-files --types=service - list all daemons from systemd. Enables means it starts at boot-time.
    systemctl is-enabled {service-name} - Check if a specific service is enabled to run at boot-time.
    systemctl disable --now {service-name} - disable a service from running at boot-time.
    chkconfig --list - lists the status of every service at each run level. "on" means it starts at boot-time. Use if you use init instead of systemd.
    service --status-all - list all daemons from init system (non-systemd). The +s are running services (daemons). 
    man -k {fuzzy search} - search the manual database for a specific word.

HOT TIPS & HOTKEY COMBOS

    ctrl + d - sends End of File read descriptor to the stdin to signal that you are done entering input.
    crtz + z - inside vim this will drop you back to a terminal, then type "fg" to return to vim.
