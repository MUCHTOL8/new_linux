# config-suites-list

> List of utilities used to assist in configuring software and the system.

program name - what it configures
=================================
setserial - serial drivers at runtime for any nonstandard or unusual serial hardware.
stty - (set tty) display a terminal's configuration for a tty device. Enables hardware handshaking.
ethtool - displaying and modifying the parameters of network interface controllers (NICs) and their associated device driver software from application programs running in userspace.
iproute2 - controlling and monitoring various aspects of networking in the Linux kernel, including routing, network interfaces, tunnels, traffic control, and network-related device drivers. Contains the following command-line utilities: arpd, bridge, ctstat, dcb, devlink, ip, lnstat, nstat, rdma, routef, routel, rtacct, rtmon, rtstat, ss, tc and tipc.
linuxconf - configurator for the Linux operating system. deprecated.
make menuconfig - one of five similar tools that can configure Linux source, a necessary early step needed to compile the source code. 'make menuconfig', with a menu-driven user interface, allows the user to choose the features of Linux (and other options) that will be compiled.
make config - the predecessor of menuconfig.
make oldconfig - the predecessor of menuconfig.
make xconfig - another option for linux configuration like menuconfig, and requires Qt.
make gconfig - another option for linux configuration like menuconnfig, and uses GTK+.
make nconfig - another option for linux configuratoin like menuconfig.
openLMI - (Open Linux Management Infrastructure)  Available operations include configuration of various operating system parameters and services, hardware components configuration, and monitoring of system resources.
iw - called 'wiresless tools for linux'. collection of user-space utilities written for Linux kernel-based operating systems to support and facilitate the configuration of device drivers of wireless network interface controllers and some related aspects of networking using the Linux Wireless Extension. Check the man page for a list of the tools.
ultamatix - automate the addition of applications, codecs, fonts and libraries not provided directly by the software repositories of Debian-based distributions like Ubuntuxi, including programs such as the Adobe Flash Player plugin, Adobe Reader, multimedia codecs (including MP3, Windows Media Audio and video-DVD support), fonts, programming software (compilers) and games. Based on autmatix.
ifconfig - set ip addresses, netmasks, bring up or down networking devices, check current configuration settings.
arp - manipulate the address mapping cache by adding and removing entries to the arp table.
iptables - configure the firewall's packet filtering capabilities.
route - make changes to the routing table.
nmcli - 
udev - kernel device manager that provides consistent and persistent device naming for all devices, including network devices and removable mass storage devices. It is also used to match network device names, i.e., eth0 or eno1, for example, to the MAC address on the network interface.
grub-customizer - a gui for grub configuration. Dope
qgrubeditor - grub editor for machines with KDE and Qt 4.
grub-mkconfig - runs other scripts and programs such as grub-mkdevice.map and grub-probe and then generates a new grub.cfg file. It also reads files in /etc/default/grub and the /etc/grub.d/debian theme file to tell it what to do. Those are the files we can edit or create for ourselves to change our GRUB settings. 
lilo - used to configure the LimuxLoader bootloader.
update-alternatives - creates, removes, maintains and displays information about the symbolic links comprising the Debian alternatives system. It is possible for several programs fulfilling the same or similar functions to be installed on a single system at the same time. For example, many systems have several text editors installed at once. This gives choice to the users of a system, allowing each to use a different editor, if desired, but makes it difficult for a program to make a good choice for an editor to invoke if the user has not specified a particular preference. Debian's alternatives system aims to solve this problem. 'update-alternatives --get-selections' gets you a list of all the possible program types with multiple selectible options. 'update alternatives --config x-terminal-emulator' shows a list of every installed terminal emulator and allows you choose as the default.
printenv - show list of environment variables and request the values of specific variables.
env - show list of environment variables and change the current shell's environment variables.
set - Shows a list of the shell variables, environment variables, local variables, and shell functions AND allows you to change them. We can clean up the output by specifying that set should operate in POSIX mode, which won’t print the shell functions. We can execute this in a sub-shell so that it does not change our current environment: '(set -o posix; set)'. 
--common environmental variables--
    SHELL: This describes the shell that will be interpreting any commands you type in. In most cases, this will be bash by default, but other values can be set if you prefer other options.
    TERM: This specifies the type of terminal to emulate when running the shell. Different hardware terminals can be emulated for different operating requirements. You usually won’t need to worry about this though.
    USER: The current logged in user.
    PWD: The current working directory.
    OLDPWD: The previous working directory. This is kept by the shell in order to switch back to your previous directory by running cd -.
    LS_COLORS: This defines color codes that are used to optionally add colored output to the ls command. This is used to distinguish different file types and provide more info to the user at a glance.
    MAIL: The path to the current user’s mailbox.
    PATH: A list of directories that the system will check when looking for commands. When a user types in a command, the system will check directories in this order for the executable.
    LANG: The current language and localization settings, including character encoding.
    HOME: The current user’s home directory.
    _: The most recent previously executed command.
--common shell variables--

    BASHOPTS: The list of options that were used when bash was executed. This can be useful for finding out if the shell environment will operate in the way you want it to.
    BASH_VERSION: The version of bash being executed, in human-readable form.
    BASH_VERSINFO: The version of bash, in machine-readable output.
    COLUMNS: The number of columns wide that are being used to draw output on the screen.
    DIRSTACK: The stack of directories that are available with the pushd and popd commands.
    HISTFILESIZE: Number of lines of command history stored to a file.
    HISTSIZE: Number of lines of command history allowed in memory.
    HOSTNAME: The hostname of the computer at this time.
    IFS: The internal field separator to separate input on the command line. By default, this is a space.
    PS1: The primary command prompt definition. This is used to define what your prompt looks like when you start a shell session. The PS2 is used to declare secondary prompts for when a command spans multiple lines.
    SHELLOPTS: Shell options that can be set with the set option.
    UID: The UID of the current user.
source - updates system-wide environment variables with what is in the specified file.
export - creates a new environment variable according to your key/value pair that you define.
gnome-tweaks
