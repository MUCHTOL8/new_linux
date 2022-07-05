# etcfiles-description

> A list of all /etc files in Linux Mint with descriptions.


/etc - Contains configuration files which are local  to  the  machine.   Some larger software packages, like X11, can have their own subdirectories below /etc.  Site-wide configuration  files  may be placed here or in /usr/etc.  Nevertheless, programs should always look for these files in  /etc and you may have links for these files to /usr/etc.

/etc/opt - Host-specific  configuration files for add-on applications installed in /opt.

/etc/sgml - This directory contains the configuration files  for  SGML (optional).

/etc/skel - When a new user account is created, files from this directory are usually copied into the user's home directory.

/etc/X11 - Configuration files for the X11 window system (optional).

/etc/xml - This directory contains the configuration  files  for  XML (optional).

acpi - (Advanced Configuration and Power Management Interface) is a power management system that is part of the BIOS. The scripts found in /etc/acpi define how the system reacts on ACPI events. (AC power plug in/out, multimedia keys, etc.). Many packages use ACPI functions.
adduser.conf - In Debian systems, the regex defining acceptable user names is found here. contains  descriptive  information  about the hardware mode clock setting and clock drift factor. The file is read and write by hwclock; and read by programs like rtcwake to get RTC time mode.
adjtime - Contains descriptive information about the hardware mode clock setting and clock drift factor. The file is read and write by hwclock; and read by programs like rtcwake to get RTC time mode.
aliases - You can set up a mail alias called softball, anyone can send to softball@your-machinename and make use of the mail alias. Mail aliases are used for sendmail and by nearly all Mail Transfer Applications. Whenever this file is changed, the newaliases utility must be run to notify sendmail of the changes.
aliases.db - A berkley database using either Btrees or hashes.
alsa - (Advanced Linux Sound Architecture) can be divided into two components: The kernel API (which is part of the kernel) that provides access to your sound card for higher-level sound servers and applications, and a userspace library that provides more general functions (like effects, mixing, routing, etc.) A sound server will sit between ALSA and your applications. These will traditionally be PulseAudio (for easy and automatic audio), JACK (for professional-grade low-latency audio), or PipeWire (for any use-case, but is still experimental). A sound server is not necessary as applications can output sound to ALSA directly, but some applications will make use of a sound server's API and require it to be available in order to produce sound. Most infamously, Firefox does not support ALSA directly and instead uses the PulseAudio API, forcing usage of PulseAudio (or a compatibility layer) as well. PulseAudio will, by default, take control of all ALSA devices and redirect all audio streams to itself.
alternatives - maintain symbolic links determining default commands.
anacrontab - configuration file describes the jobs controlled by anacron(8). It can contain three types of lines: job-description lines, environment assignments, or empty lines.
apache2 - dir holds apache configuration files.
apg.conf - (Automated Password Generator) config file for a program that helps webmasters and server administrators with creating random, secure passwords, through the SSH of server's.
apm - (Advancced Power Management) (this should possibly be /etc/sysconfig/apmd)
apm - (Atom Package Manager) config files. This command uses NPM internally and spawns npm processes to install Atom packages, and requires the Advanced Power Management subsystem.
apparmor - config file for apparmor which is a Mac Access Control (MAC) system. It uses LSM kernel enhancements to restrict programs to certain resources. Most of the configuration is in apparmor.d.
apparmor.d - Profiles are stored in /etc/apparmor.d/. The apparmor-utils package contains command line tools for configuring Apparmor.
apport - System that captures crash reports. You can adust some of it's configuration with the gsettings command Debugging program crashes without any automated tools has been pretty time consuming and hard for both developers and users. Apport itself is running at all times because it collects crash data for whoopsie (see ErrorTracker). However, the crash interception component is still disabled.
appstream.conf - a config file. Appstream is what the new software centres are using to get their data from, rather than directly from Apt. Both Gnome's and KDE's software tools depend on it but the Desktops themselves do not.
apt - config for apt.
apt/sources.list - contains a list of source repositories used by apt. 
apt/sources.list.d - It's mainly for scripts or other packages to put their repositories there automatically - if you manually add repositories you could add them to /etc/apt/sources.list manually. Using the directory you can easily add new repositories without the need to edit the central /etc/apt/sources.list you can just put a file with a unique name and the same format as /etc/apt/sources.list into this folder and it is used by apt. In order to remove this source again you can just remove that specific file without the need for handling side effects, parsing or mangling with /etc/apt/sources.list. 
avahi - see the avahi-daemon.conf(5) man page for configuration instructions. Avahi is a free Zero-configuration networking (zeroconf) implementation, including a system for multicast DNS/DNS-SD service discovery. It allows programs to publish and discover services and hosts running on a local network with no specific configuration. For example you can plug into a network and instantly find printers to print to, files to look at and people to talk to.
bash.bashrc - System-wide .bashrc file for interactive bash shells. To enable the settings / commands in this file for login shells as well, this file has to be sourced in /etc/profile. 
bash_completion - These functions are part of the shell's completion support for git. They are maintained as part of the Git software. Debian's default .bashrc loads /etc/bash_completion, you can edit it out if you don't want any command-specific completion.
bash_completion.d - The functions are located in /etc/bash_completion.d/git, in the same directory as other command completion support for bash. All the files in /etc/bash_completion.d are loaded in /etc/bash_completion as part of setting up bash's programmable completion for git.
bindresvport.blacklist - bindresvport() is used to bind a socket descriptor to a privileged anonymous IP port, that is, a port number arbitrarily selected from the range 512 to 1023. The blacklist it seems would be ports that can't be automatically bound to.
binfmt.d - Configure additional binary formats for executables at boot
bluetooth - configuration for for the bluetooth and the bluetooth daemon.
brlapi.key - BrlAPI is a service provided by the brltty daemon. Its purpose is to allow programmers to write applications that take advantage of a braille terminal or speech synthesizer.
brltty - 
brltty.conf - 
ca-certificates - 
ca-certificates.conf - 
ca-certificates.conf.dpkg-old - 
calendar - 
chatscripts - 
chkrootkit.conf - 
clamav - 
complete.tcsh - 
conky - 
console-setup - 
cracklib - 
cron.d - 
cron.daily - 
cron.hourly - 
cron.monthly - 
crontab - 
cron.weekly - 
csh - 
csh.cshrc - 
csh.login - 
csh.logout - 
cups - 
cupshelpers - 
dbus-1 - 
dconf - 
debconf.conf - 
debian_version - 
default - 
deluser.conf - 
depmod.d - 
dhcp - 
dictd - 
dictionaries-common - 
dpkg - 
e2scrub.conf - 
emacs - 
environment - 
environment.d - 
ethertypes -
exports - Contains a list of filesystems which may be made available to other systems on the network via NFS. 
firebird - 
firefox - 
fish - 
fonts - 
fprintd.conf - 
fstab - The file system table contains the description of what disk devices are available at what mount points.
fuse.conf - 
fwupd - 
gai.conf - 
gamemode.ini - 
gdb - 
gdm3 - 
geoclue - 
ghostscript - 
glvnd - 
gnome - 
groff - 
group - Holds information regarding security group definitions.
group- - 
grub.conf - The grub boot loader configuration file.
grub.d - 
gshadow - 
gshadow- - 
gss - 
gtk-2.0 - 
gtk-3.0 - 
hdparm.conf - 
host.conf - 
hostid - 
hostname - 
hosts - Contains host names and their corresponding IP addresses used for name resolution whenever a DNS server is unavailable.
hosts.allow - Contains a list of hosts allowed to access services on this computer.
hosts.deny - Contains a list of hosts forbidden to access services on this computer.
hp - 
ifplugd - 
ImageMagick-6 - 
init - 
init.d - 
inittab - Describes how the INIT process should set up the system in various runlevels.
initramfs-tools - 
inputrc - 
insserv.conf.d - 
iproute2 - 
issue - Contains the pre-login message, often overwritten by the /etc/rc.d/rc.local script in Red Hat and some other rpm-based Linux distributions.
issue.net - 
iwd - 
.java - 
java-11-openjdk - 
kernel - 
kernel-img.conf - 
kerneloops.conf - 
ldap - 
ld.so.cache - 
ld.so.conf - 
ld.so.conf.d - 
legal - 
libao.conf - 
libaudit.conf - 
libblockdev - 
libnl-3 - 
libpaper.d - 
libreoffice - 
lighttpd - 
lilo.conf - The lilo boot loader configuration file.
lldpd.d - 
locale.alias - 
locale.gen - 
localtime - 
logcheck - 
login.defs - 
logrotate.conf - 
logrotate.d - 
lsb-release - 
ltrace.conf - 
machine-id - 
magic - 
magic.mime - 
mailcap - 
mailcap.order - 
mail.rc - 
manpath.config - 
matplotlibrc - 
mime.types - 
mke2fs.conf - 
mmh - 
modprobe.d - 
modules - Holds options for configurable system modules.
modules-load.d - 
mono - 
motd - This is the ?message of the day? file which is printed upon login. It can be overwritten by /etc/rc.d/rc.local Red Hat on startup. 
mplayer - 
mtab - Status information for currently mounted devices and partitions.
mtools.conf - 
mysql - 
nanorc - 
netplan - 
network - 
networkd-dispatcher - 
NetworkManager - 
networks - 
newt - 
nmh - 
nsswitch.conf - 
oinkmaster.conf - 
openal - 
openvpn - 
opt - 
os-release - 
PackageKit - 
pam.conf - 
pam.d - 
papersize - 
passwd - Contains information regarding registered system users. Passwords are typically kept in a shadow file for better security.
passwd- - 
pcmcia - 
perl - 
pki - 
pm - 
pnm2ppa.conf - 
polkit-1 - 
postfix - 
ppp - 
printcap - Holds printer setup information.
profile - Contains global defaults for the bash shell.
profile.d - 
protocols - 
pulse - 
.pwd.lock - 
python2.7 - 
python3 - 
python3.8 - 
ranger - 
rc0.d - 
rc1.d - 
rc2.d - 
rc3.d - 
rc4.d - 
rc5.d - 
rc6.d - 
rcS.d - 
rearj.cfg - 
resolv.conf - A list of domain name servers (DNS) used by the local machine.
resolvconf - 
rkhunter.conf - 
rmt - 
rpc - 
rsyslog.conf - 
rsyslog.d - 
rygel.conf - 
sane.d - 
securetty - This file contains a list of terminals where root can login.
security - 
selinux - 
sensors3.conf - 
sensors.d - 
services - 
sestatus.conf - 
sgml - 
shadow - 
shadow- - 
shells - 
signon-ui - 
skel - 
smi.conf - 
snmp - 
snort - 
speech-dispatcher - 
ssh - 
ssl - 
subgid - 
subgid- - 
subuid - 
subuid- - 
sudoers - 
sudoers.d - 
sysctl.conf - 
sysctl.d - 
sysstat - 
systemd - 
termcap - An extensive ASCII text file defining the properties of consoles, terminals, and printers.
terminfo - 
thermald - 
timezone - 
tmpfiles.d - 
ubuntu-advantage - 
ucf.conf - 
udev - 
udisks2 - 
ufw - 
update-manager - 
update-motd.d - 
update-notifier - 
UPower - 
usb_modeswitch.conf - 
usb_modeswitch.d - 
vdpau_wrapper.cfg - 
vim - 
vtrgb - 
vulkan - 
w3m - 
wgetrc - 
wireshark - 
wpa_supplicant - 
X11 - 
xattr.conf - 
xdg - 
xml - 
zsh - 
zsh_command_not_found - 

==============================================================
==============================================================



brltty - is a background process (daemon) which provides access to the linux/Unix console for a blind person using a refreshable braille display.
pm - The power management program in charge of saving energy by suspending parts of a computer system when they aren't being used. Currently the only drivers that support it are the hub driver, kaweth, asix, usbip, usblp, usblcd, and usb-skeleton (which doesn't even count).
ifplugd - An Ethernet link detection devices that automatically configures your ethernet device when a cable is plugged in and unconfigures it when the cable is pulled out.
xdg - a set of tools that allows applications to easily integrate with the desktop environment of the user, regardless of the specific desktop environment that the user runs. A system-wide equivelant to ~/.conifg/. In other words, a place to define default configuration files for applications that comply with the freedesktop standards.
apparmor - a Linux kernel security module that allows the system administrator to restrict programs' capabilities with per-program profiles. Profiles can allow network access, raw socket access, and permissions to read, write, or execute files on matching paths. It's similar to SELinux, they both provide Mandatory Access Control (MAC) security.
sensors.d - Used to periodically log sensor readings from hardware health-monitoring chips to syslog or a round-robin database (RRD) and to alert when a sensor alarm is signalled; for example, if a fan fails, a temperature limit is exceeded, etc.
snmp - Simple Network Management Protocol; is mainly used to manage devices remotely by retrieving the operational statistics and setting configurations of servers and infrastructure componenets such as a swtich, router, workstations, cabinet, firewalls,  printer, etc. 
skel - (skeleton) it contains the basic structure of home directory. It contains files and directories that are automatically copied over to a new user's when it is created form user/add coommand. This ensures that all the users gets same initial settings and environment.
pcmcia - (The Personal Computer Memory Card International Assosication)  Card Services for Linux is a complete PCMCIA support package. It includes a set of loadable kernel modules that implement a version of the PCMCIA 2.1 Card Services applications program interface, a set of client drivers for specific cards, and a card manager daemon that can respond to card insertion and removal events, loading and unloading drivers on demand. It supports ``hot swapping'' of PCMCIA cards, so cards can be inserted and ejected at any time. The current package supports many ethernet cards, modems and serial cards, several SCSI adapters, most ATA/IDE devices, and some SRAM and FLASH memory cards. All the common PCMCIA controllers are supported, so it should run on just about all Linux-capable laptops. 
openal - (Open Audio Library) is the audio counterpart of OpenGL for graphics. It defines a standard and portable API to build audio applications on top of it. Was originally developed for the purpose of transplanting Windows commercial games to Linux. openal provides 3D audio effects and is almost soley used for video games.
lvm - (Logical Volume Manager) allows flexible disk management. It is an alternative method of managing storage systems instead of the traitional partition-based one. Instead of creating partitions, you create logical volumes that you can then manage by allocating disks, striping, mirroring and resizing logical volumes. With LVM, a hard drive or set of hard drives is allocated to one or more physical volumes. LVM physical volumes can be placed on other block devices which might span two or more disks. Regular partitions can't be expanded or shrunk and can't have a custom name assigned to the partition or harddisk. There are 3 types of voumes: PV, VG, LV. A Physical Volume is a hard disk attached to the server/machine. A Volume Group is combining/grouping of Physical Volumes. A Logical Volume is the a section of the Volume Group that has been split up/divided up so the space can be allocated to different teams of people or parts of the company or for whatever reason you might want to use the total hard drive space in unique ways (like splitting up 3 ten Gigabyte hard drives then being able to dynamically change the size of the partition/volumes.
xrdb - is the X window server resource database utility. If you are configuring the X windowing system for use on multiple clients xrdb can help maintain multiple resource files in one unified resource database. The resources are stored on the X server, where they are accessible to any clients that connect to that server. It is normally run from your X startup file. Most X clients use the RESOURCE_MANAGER and SCREEN_RESOURCES properties to get user preferences about color, fonts, and so on for applications. Having this information in the server (where it is available to all clients) instead of on disk, solves the problem in previous versions of X that required you to maintain defaults files on every machine that you might use. It also allows for dynamic changing of defaults without editing files.

The RESOURCE_MANAGER property is used for resources that apply to all screens of the display. The SCREEN_RESOURCES property on each screen specifies additional (or overriding) resources to be used for that screen. (When there is only one screen, SCREEN_RESOURCES is normally not used, all resources are just placed in the RESOURCE_MANAGER property.) 
sudoers.d - checks the sudoers file to check if you have the right to use root privilages. By default, a single-user system grants sudo privileges to its user. The visudo command is the recommended way to update the sudoers file content, since it protects against many failure modes.
libnl-3 - the pkgconfig file is named libnl-3.0.pc for historic reasons. The libnl suite is a collection of libraries providing APIs to netlink protocol based Linux kernel interfaces. Netlink is a IPC mechanism primarily between the kernel and user space processes. It was designed to be a more flexible succesor to ioctl.
geoclue - is a D-Bus service that provides location information. The goal is to make creating location-aware applications as simple as possible. The aim of the project is to utilize all possible sources of geolocation to best find user's location. The secondary goal is to ensure that no application can access location information without explicit permission form user. Some people think it's behavior is privacy disrespecting and they recommend using: sudo systemctl disable geoclue.service & sudo systemctl mask geoclue.service.
PackageKit - is a free and open-source suite of software applications designed to provide a consistent and high-level front end for a number of different package management systems. The primary design goal is to unify all the software graphical tools used in different distribtuions, and use some of the latest technology like PolicyKit. It uses the software libraries provided by the D-Bus and Polkit projects to handle inter-process communication and privilege negotiation respectively. Although bug fixes are still released, no major features have been developed since around 2014, and the package's maintainer predicts that it will gradually be replaced by other tools as technologies such as Flatpak and Snap become more popular. A number of different package management systems (known as back-ends) support different abstract methods and signals used by the front-end tools. When PackageKit is running in the background, it blocks any other software management initiated by users (e.g. with apt command). Supported back-ends include: Advanced Packaging Tool (APT), Conary, libdnf & librepo, the libraries upon which DNF, (the successor to yum) builds, Entropy, Opkg, pacman, PiSi, Portage, Smart Package Manager, urpmi, YUM, ZYpp. pkcon is the official front-end of PackageKit, it operates from the command-line. GTK-based systems can also use gnome-packagekit or GNOME software. Qt-based systems can use Apper or Discover. 
rcS.d - Allows you to run additional programs at boot time. Its typical use is to mount additional filesystems (only the root filesystem is mounted at that point) and launch some daemons. Usually rcS is a shell script, which can easily be customized on the fly. Typical distributions make rcS a simple script that executes further scripts in /etc/rcS.d (the exact location is distribution-dependent); this allows each daemon to be package with its own init script. The file /etc/rc.local is also executed by rcS if present; it is intended for commands written by the system administrator. /etc/init.d/rcS generally kicks off the scripts in /etc/rcS.d/. With the traditional SysVinit implementation of init, /etc/init.d/rcS is listed in /etc/inittab (the sysinit setting). With BusyBox, you can also supply an inittab (if the feature is compiled in) but there is a built-in default that makes it read /etc/init.d/rcS (among other things).
rc#.d - (Run Control daemon) the has symbol is replaced by the runlevel. Each run level has it's own list of services to start or stop when switching to that run level. When init enters a runlevel, it calls the rc script with a numeric argument specifying the runlevel to go to. rc then starts and stops services on the system as necessary to bring the system to that runlevel. Though typically run at boot, the rc script can be called by init to change runlevels. For example, # init 3, can be used to change the system to runlevel 3. 
chatscripts - is responsible for initialising the modem and getting the connection to the point where pppd can take over. chat - Automated conversational script with a modem. The chat program defines a conversational exchange between the computer and the modem. Its primary purpose is to establish the connection between the Point-to-Point Protocol Daemon (pppd) and the remote’s pppd process. Seems to be used for dial-up and connections over a phone line such as GSM.
ppp - Point to Point Protocol, or ppp, is used to create your connection over one's analog telephone modem to your ISP and the internet. Your computer will use communication ports, known as "COM" ports to access your modem. Linux will refer to these hardware COM ports as Unix devices as follows: Device:DOS com port number, /dev/ttyS0-COM1, /dev/ttyS1, COM2 (Typically used for external modems), and so on. PPP (the Point to Point Protocol) is a mechanism for creating and running IP (the Internet Protocol) and other
network protocols over a serial link − be that a direct serial connection (using a null−modem cable), over a telnet established link, or a link made using modems and telephone lines (and of course using digital lines such as ISDN). Using PPP, you can connect your Linux PC to a PPP server and access the resources of the network to which the server is connected (almost) as if you were directly connected to that network. You can also set up your Linux PC as a PPP server, so that other computers can dial into your computer and access the resources on your local PC and/or network. As PPP is a peer−to−peer system, you can also use PPP on two Linux PCs to link together two networks (or a local network to the Internet), creating a Wide Area Network (WAN). One major difference between serial based PPP and an Ethernet connection is of course speed − a standard. Ethernet connection operates at 10 Mbs (Mega − million bits per second) or 100 Mbs maximum theoretical throughput, whereas an analogue modem operates at speeds up to 56 kbps (kilo − thousand bits per second). Also, depending on the type of PPP connection, there may be some limitations in usage of some applications and services. PPP is strictly a peer to peer protocol; there is (technically) no difference between the machine that dials in and the machine that is dialed into.
environment.d - Configuration files in the environment.d/ directories contain lists of environment variable assignments for services started by the systemd user instance. systemd-environment-d-generator parses them and updates the environment exported by the systemd user instance. Configuration files are read from directories in /etc/, /run/, /usr/local/lib/, and /usr/lib/, in order of precedence. Files in /etc/ override files with the same name in /run/, /usr/local/lib/, and /usr/lib/. Files in /run/ override files with the same name under /usr/.
networkd-dispatcher - is similar to NetworkManager-dispatcher, but is much more limited in the types of events it supports due to the limited nature of systemd-networkd. Dispatcher service for systemd-networkd connection status changes. The daemon listens for signals from systemd-networkd over dbus, so it should be very light on resources (e.g. no polling). It is meant to be run as a system-wide daemon (as root). This allows it to be used for tasks such as starting a VPN after a connection is established. Desired actions (scripts) are placed into directories that reflect systemd-networkd operational states under SCRIPT_DIR and are executed when the daemon receives the relevant event from systemd-networkd. The systemd service reads /etc/default/networkd-dispatcher as an environment file for additional daemon arguments. For information about the network operational states exposed by systemd, see networkctl(1). 
groff - document formatting systems. A roff system consists of an extensible text formatting language and a set of programs for printing and converting to other text formats. Roff remains in wide use today; for example, the manual pages on Unix systems (“man pages”), books about software and programming, and technical memoranda are written in roff. Roff systems consist of: Typographical concepts that form the common background of all roff implementations, details on the roff pipeline which is usually hidden behind front ends like groff(1),a general overview of the formatting language. A roff preprocessor is any program that generates output that syntactically obeys the rules of the roff formatting language. Each preprocessor defines a language of its own that is translated into roff code when run through the preprocessor program. There are a lot of free and commercial roff preprocessors. there is a small set of preprocessors that are considered as an integral part of each roff system.the formatter is the program that parses documents written in the roff language.  It generates intermediate output, which is intended to be fed into an output driver (also known as a device postprocessor). The formatter just ignores all alien code.Documents using roff are normal text files interleaved with roff formatting elements. roff languages are powerful enough to support arbitrary computation and supply facilities that encourage their extension.  The primary such facility is macro definition; with this feature, macro packages have been developed that are tailored for particular applications. Macro packages can have a much smaller vocabulary than roff itself; this trait combined with their domain-specific nature can make them easy to acquire and master. The macro definitions of a package are typically kept in a file called name.tmac (historically, tmac.name).  All tmac files are stored in one or more directories at standardized positions.  Details on the naming of macro packages and their placement is found in groff_tmac(5).
vulkan - Vulkan is a low-level cross-platform 3D graphics API which is very well supported on GNU/Linux by the Mesa graphics stack. The API allows game and application developers to create games with very fancy graphics which are easily portable to any of the many platforms with a graphics stack supporting the Vulkan API. The Vulkan specification is maintained by the Khronos Group. OpenGL from the Khronos Group, Direct3D 11 and Direct3D 12 from Microsoft and Metal from Apple Inc are all graphics APIs who serve the same basic function as Vulkan. Vulkan, Metal and Direct3D 12 are more low-level oriented than OpenGL and Direct3D 11. Of those, OpenGL and Vulkan are the only free and open graphics standards with a clear specification. Vulkan is designed to run on multi-core systems. OpenGL was not, it was originally designed to run on single-core machines. It is also designed to give a higher degree of control over the graphics card compared to OpenGL. This is good or bad depending on how you look at it. Vulkan will provide higher performance than OpenGL if the code is well written. However, Vulkan requires more code than OpenGL to place a rotating 3D pyramid (or something else) on the screen. Vulkan is multi-platform. It can be used on Android, Linux and Windows 7-10. 
Upower - similar to acpi. You can use the upower command to check the battery power. (previously DeviceKit-power) is a piece of middleware (an abstraction layer) for power management on Linux systems.[2] It enumerates power sources, maintains statistics and history data on them and notifies about status changes. It consists of a daemon (upowerd), an application programming interface and a set of command line tools. The daemon provides its functionality to applications over the system bus (an instance of D-Bus).  PolicyKit restricts access to the UPower functionality for initiating hibernate mode or shutting down the operating system. The command-line client program upower can be used to query and monitor information about the power supply devices in the system. Graphical user interfaces to the functionality of UPower include the GNOME Power Manager and the Xfce Power Manager. It was conceived as a replacement for the corresponding features of the deprecated HAL. This resulted in a set of separate services under the new name "DeviceKit".[6] In 2010 the included DeviceKit-power was renamed to UPower. UPower is a product of the cross-desktop freedesktop.org project.
timidity - TiMidity++ is a software synthesizer that can play MIDI files without a hardware synthesizer. It can either render to the sound card in real time, or it can save the result to a file, such as a PCM .wav file. timidity++ is a converter that converts some of MIDI files (supported formats: Standard MIDI files (*.mid), Recomposer files (*.rcp, *.r36, *.g18, *.g36) and Module files (*.mod)) into formatted audio files (e.g. RIFF WAVE). TiMidity++ uses Gravis Ultrasound-compatible patch files or Soundfonts (*.sfx, *.sf2) to generate digital audio data from MIDI files. The digital audio data generated by TiMidity++ can be stored in a file for processing, or played in real time through an audio device. In real time playing, TiMidity++ can show the lyrics contained in KAR or WRD files. TiMidity allows you to use MIDI via the ALSA sequencer system without a midi soundcard. The ALSA sequencer interface is the interface of TiMidity which lets you create ALSA sequencer ports with real-time response.
thermald -  is a Linux daemon used to prevent the overheating of platforms. This daemon monitors temperature and applies compensation using available cooling methods. By default, it monitors CPU temperature using available CPU digital temperature sensors and maintains CPU temperature under control, before HW takes aggressive correction action. Thermal daemon looks for thermal sensors and thermal cooling drivers in the Linux thermal sysfs (/sys/class/thermal) and builds a list of sensors and cooling drivers. Each of the thermal sensors can optionally be binded to a cooling drivers by the in kernel drivers. In this case the Linux kernel thermal core can directly take actions based on the temperature trip points, for each sensor and associated cooling device. Thermal daemon allows one to change this relationship or add new one via a thermal configuration file (thermal-conf.xml). This file is automatically created (thermal-conf.xml.auto) and used, if the platform has ACPI thermal relationship table. If not this needs to be manually configured. In some newer platforms the auto creation of the config file is done by a companion tool "dptfxtract". There is another companion tool "ThermalMonitor", which presents a graphical front end.
cracklib - This module can be plugged into the password stack of a given application to provide some plug-in strength-checking for passwords. The action of this module is to prompt the user for a password and check its strength against a system dictionary and a set of rules for identifying poor choices. It checks for these poor choices.
Palindrome: Is the new password a palindrome? 
Case Change Only: Is the new password the the old one with only a change of case? 
Similar: Is the new password too much like the old one? This is primarily controlled by one argument, difok which is a number of character changes (inserts, removals, or replacements) between the old and new password that are enough to accept the new password. This defaults to 5 changes. Simple: Is the new password too small? This is controlled by 6 arguments minlen, maxclassrepeat, dcredit, ucredit, lcredit, and ocredit. See the section on the arguments for the details of how these work and there defaults. 
Rotated: Is the new password a rotated version of the old password? 
Same consecutive characters: Optional check for same consecutive characters. 
Too long monotonic character sequence: Optional check for too long monotonic character sequence. 
Contains user name: Optional check whether the password contains the user's name in some form. 
newt - is a programming library for color text mode, widget-based user interfaces. Newt can be used to add stacked windows, entry widgets, checkboxes, radio buttons, labels, plain text fields, scrollbars, etc., to text user interfaces. This package also contains the shared library needed by programs built with newt, as well as an application whiptail, which provides the most commonly used features of dialog. Newt was originally designed for use in the install code of Red Hat Linux. The capabilities are fully adequate for the installation process, and Newt was used for the user friendly OS installers. It is also used in some system tools (like Partimage) that focus more on functionality than on looking attractive to the end user. 
glvnd - (OpenGL Vendor-Neutral Driver) GLVND infrastructure is now included and supported by the NVIDIA GLX and OpenGL drivers. GLVND is a wrapper that dispatches API usage to the appropriate vendor provided implementation (ie an installed GPU driver stack) at runtime. My understanding is that the vendor provided API libraries historically clobbered each other. all common OpenGL implementations are compatible with the vendor neutral GLVND dispatch layer at this point, so it should be the default choice for reasonably portable (between linux and windows and possibly mac) OpenGL support on Linux. Mesa provides open source graphics API implementations built on top of the vendor specific drivers (as opposed to the vendor providing both the driver and the API implementations on top of it). As far as I can tell, Mesa was not originally compatible with the GLVND wrapper. However, it appears that they gained support at least two years ago. I can only assume that the lib32-mesa-libgl-noglvnd package is a holdover from prior to that.
libblockdev - is a C library with GObject introspection support that can be used for doing low-level operations with block devices like setting up LVM, BTRFS, LUKS or MD RAID. The library uses plugins (LVM, BTRFS,...) and serves as a thin wrapper around its plugins' functionality. All the plugins, however, can be used as standalone libraries. One of the core principles of libblockdev is that it is stateless from the storage configuration's perspective (e.g. it has no information about VGs when creating an LV). libblockdev is a C library supporting GObject introspection for manipulation of block devices. It has a plugin-based architecture where each technology (like LVM, Btrfs, MD RAID, Swap,...) is implemented in a separate plugin, possibly with multiple implementations (e.g. using LVM CLI or the new LVM DBus API).
gss - (Generic Security Service) is used to create a security context by authenticating a machine, or a user on a machine while a GSS on another machine does the same thing, then they share their keys using an implementation of the RPC (Remote Procedure Call protocol). GSS uses rpc.gssd daemon. It uses a variety of encryption types to encrypt the shared keys before they are passed across the network. GSS is an implementation of the GSS-API. GSS consists of a library and a manual. GSI-API is used by network servers to provide security services, e.g., to authenticate SMTP/IMAP clients agaisnt SMTP/IMAP servers. Before exchanging RPC requests using RPCSEC_GSS, an RPC client must establish a security context. A security context is shared state on each end of a network transport that enables GSS-API security services. An example usage is for RPC-based protocols such as NFS, the RPCSEC_GSS protocol is used. GSS was developed for GNU/Linux but runs on over 20 platforms.
dkms - (Dynamic Kernel Module Support) is a program/framework that enables generating Linux kernel modules whose source generally reside outside the kernel source tree. It provides support for installing supplementary versions of kernel modules. The dkms framework enables you to automatically re-build kernel modules into the current kernel tree as you upgrade your kernel. It allows keernel modules to be dynamically built for each kernel on your system in a simplified and organized fashion. It provides support for installing supplementary versions of kernel modules. It works for Out-of-tree or third-party kernel modules such as AMD/ATI Catalyst fglrx proprietary graphics drivers. Some people don't install DKMS so they can get the experience of having to re-install dependent kernel modules after a kernel update.
udev - is the device manager for Linux 2.6 kernel that creates/removes device nodes in the /dev directory dynamically. It is the successor of devfs and hotplug. It runs in userspace and the user can change device names using Udev rules. Udev depends on the sysfs file system. udev is now a part of systemd.
iproute2 - is a collection of userspace utilities for controlling and monitoring various aspects of networking in the Linux kernel, including routing network interfaces, tunnels, traffic control, and network-related device drivers. It replaced net-tools (ifconfig, vconfig, route, arp, etc) as the defacto Linux networking toolkit. Most of the functionality is unified in the ip command.It also includes tc for managing traffic policies (QoS) and ss (a netstat replacement). iptroute2 is the go-to network tool now, you should learn it.
cifs-utils - (Common Internet File System) CIFS is a network file-sharing protocol. CIFS is a form of SMB (Microsoft's Server Message Block protocol for internet and intranet file sharing). Install the cifs-utils package for connectivity to Microsoft Networks. It provides a means for mounting SMB/CIFS shares on a Linux system. The cifs-utils package is not part of Samba but was origninally included with it. 
alsa - (Advanced Linux Sound Architecture) is a Linux kernel component which replaced the original Open Sound System (OSSv3) for providing device drivers for sound cards. ALSA is a bundle of auido/sound drivers, as well as API/ABI interfaces for connecting other systems to the sound drivers. ALSA consists of a set of kernel drivers, an applcation programming interface (API) library and utility programs for supporting sound under Linux. 
dconf - is a tool to collect a system's hardware and software configuration. It acts like the registry used on Windows Systems. Understanding this system may help users figure out how to make various changes and fixes to their system. The dconf command-line utility is used for reading and writing individual values or entire directories. dconf is a low-level configuratoin system. It's main purpose it to provide a backend to GSettings on platforms that don't already have configuration storage systems. docnf is a simple key/value storage system that is heavily optimised for reading. This makes it an ideal system for storing user preferences (which are read 1000s of times for each time the user changes one). It was created with this usecase in mind. All preferences are stored in a single a large binary file. Dconf is the succesor to Gconf which was used in Gnome2. Dconf is a settings database used in Gnome3 and similar systems (such as Unity and XFCE). It allows you to take your system configuration with you on the road, compare identical systems (like nodes in a cluster) to troubleshoot HW or SW problems (using dconf profiles). It is also useful in projects where you have to manage changes as a team. It depends on GLib. Each user has a ~/.config/dconf directory with a file named user where the sizes vary greatly. Some users also have some .fues_hidden* files in them (with the ones that are logged in having one that cannot be removed) each user file has binary data stored.
netplan - is a command-line utility used for network configuration on certain Linux distibutions. It uses YAML description files to configure network interfaces. It was created by Canonical, the company behind Ubuntu. It provides a network configuration abstraction over the currently supported two "backend" system, (or "renderer" in Netplan terminology): networkd and NetworkManager. You have to declare which "renderer" you are going to use in each configuration file. Netplan replaced the old configuration file /etc/network/interfaces that we previously used for configuring network interfaces in Ubuntu. If Netplan is being used then either networkd or NetworkManager is being used to manage the network. If Netplan isn't being used then it may be being managed by ifupdown. You can tell if ifupdown is being used by looking in /run/network/ifstate and if their is text in that file then it's probably ifupdown doing the managing. To know what backend is being used by Netplan type: netplan generate --mapping {{enp3s0}}.
sane.d - SANE (Scanner Access Now Easy) is the linux way of scanning. It is also a scanner server which can be used to setup your scanner as a network scanner.  sane supports a great many scanners, and the community around SANE adds support for more scanners all the time. By and large, most supported scanners are plug and play simple (plug them in and your ready to scan). However, some scanners will require manual installation. Scanning on Linux is generally a quick and easy process that just works. There are two basic options for scanning in Linux, the Open Source SANE (Scanner Access Now Easy) and the commercial VueScan. This software allows linux devices to use various image scanner hardware (flatbed scanner, auto document feed scanners, hand-held scanners, video- and still-cameras, frame-grabbers, etc.). The SANE software is comprised of three parts: First is the standard API (Application Programming Interface) that is designed to allow various components of scanning hardware and software to work together. This allows programmers a stable interface to write scanning software to. Second part is the SANE back end. This is the actual software that communicates directly with the scanner to produce the images. A few manufacturers have even produced scanners with a SANE back-end built in to them. The third part is the SANE front end. Their are a number of front ends that allow you to interface with the scanner. These programs communicate with the back end to communicate with the scanner. SANE back ends include command line programs, Windows programs, Mac programs, php programs, Android apps and many, many more. Network scanning allows you to set up your scanner on a server. 
firehol - FireHOL is a stateful iptables packet filtering firewall configurator. It is abstracted, extensible, easy and powerful. It can handle any kind of firewall, but most importantly, it gives you the means to configure it, the same way you think of it. FireHOL is a shell script designed as a wrapper for iptables written to ease the customization of the Linux kernel 's firewall netfilter . FireHOL does not have graphical user interface, but is configured through an easy to understand plain text configuration file.
udisks2 - is a D-Bus service to access and manipulate storage devices. The udisks daemon serves as an interface to system block devices, implemented via D-Bus. usdisk provides a daemon udiskd, that implements D-Bus interfaces used to query and manipulate storage devices, and a command-line tool, udisksctl, used to query and use the daemon. usdisk2 is a rewrite of udisks so it can become an more of an internal Gnome component rather than a universal Linux tool, certainly not command-line friendly. That means there is no replacement for Hal without adopting almost complete desktop environments. udisks v1 proved difficult for many non-Gnome users having endless polkit and consolekit issues, and it only gets worse with udisks v2. All backwards compatibility has been broken, which means all v1 scripts need to be rewritten to work with v2. It doesn't conform to the core philosophy of Linux, which is that programs interoperate using simple command line interfaces and text streams. Users or administrators should never need to start this daemon as it will be automatically started by dbus-daemon(1) or systemd(1) whenever an application tries to access its D-Bus interfaces.
lightdm - (Light-weight Display Manager). It was built as a light-weight highly customizable alternative to GDM (Gnome Display Manager). It's main features are: Cross-desktop, Supports different display technologies (X, Mir, Wayland), Lightweight - as in it has low memeory usage and high performance, Supports guest sessions, supports remote login (incoming - XDMCP, VNC, outgoing - XDMCP, pluggable). It's main competition is SDDM. Greeters (login screens)  are important to LightDM because its lightness depends on the greeter. You can switch between display managers by installing the gdm3 or lightdm and then, at the cli, entering: sudo dpkg-reconfigure lightdm (or gdm3, or an alternative such as LXDE).
gufw - is a graphical utility for managing Uncomplicated Firewall (UFW). gufw is available in all major Linux distributions; On Ubuntu you'll need to have the Universe Repository enabled.
ufw - (Uncomplicated Firewall) is an interface to iptables and is particularly well-suited for host-based firewalls. On Ubuntu, ufw is disabled by default. It provides a framework for managing and manipulating netfilter firewall. ufw is a front-end for netfilter/iptables, the Linux mechanism for routing and filtering internet traffic. ufw is completely optional and it's possile to create firewall and routing tables directly using the iptables commands. Some people prefer the syntax of ufw, which is supposed to make it a bit easier.
pki - (Public Key Infrastructure) is what makes internet encryption and digital signatures work. The main purpose of pki is to create a PKI Certificate Authority which is beneficial becasue it limits trust to devices within a given organization. The pki utility is the Command-Line Interface for accessing Certificate System services. On the public web a good example is when you visit your bank website you are told it is encrypted and verified. If you install software on Windows machines you may notice a popup when Microsoft cannot verify the digital signature of the software. The pki command provides a command-line interface allowing clients to access various services on the Certificate System server. These services include certificates, groups, keys, security domains, and users. By default, the CLI connects to a server running on the local machine via the non-secure HTTP port 8080. A client certificate associated with the desired PKI server must be used for client authentication. This can be done by importing the client certificate into an NSS security database and passing the values to the relevant options provided by the pki CLI framework. 
apm - (Advanced Power Management) is a BIOS API that the Operating System may use to implement multiple strategies for power management. (It can also stand for Application Performance Monitoring). apm is known as a hard drive killer. The APM Standby timeout kills your hard drive by trying to save milliwatts, eventually resulting in drive clicking. It's mostly cause by badl configured power management.ACPI (Advanced Configuration and Power Interface) is an alternative to APM. The machine's firmware must implement the APM or ACPI specification for you to use either. Both are usually supported. APM can be used to suspend your computer or put it in stand-by. It requires support for 32-bit protected mode connections. To look at configuring APM to save the hard-drive look at: https://petermolnar.net/article/hard-drive-spindown-clicking-noise/
ghostscript - Ghostscript is an incredibly significant program for free software-driven printing. Most printing software under Unix generates PostScript, which is typically a $100 option on a printer. Ghostscript, however, is free, and will generate the language of your printer from PostScript. Despite its name, Ghostscript is not a script. It is a suite of software programs that can interpret the Postscript language created by Adobe Systems Inc. Ghostscript is capable of interpreting PostScript, encapsulated PostScript (EPS), DOS EPS (EPSF), and -- if the executable was built for it -- Adobe Portable Document Format (PDF). Ghostscript is works with every major Linux distribution. Use the gs command to use ghostscript.
polkit-1 - is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes: It is a framework for centralizing the decision making process with respect to granting access to privileged operations for unprivileged applications. Polkit is used for controlling system-wide privileges. Polkit allows a level of control of centralized system policy. Whenever a process from the user session tries to carry out an action in the system context, PolKit is queried. polkitd provides the D-Bus service on the system message bus. polkit is a maintenance hell. It allows more action based permissions instead of just file based permissions. It also allows non-root users to perform actions like control the network that root would normally need to do functions like connect to a wifi hotspot. It gives more flexibility than POSIX permissions. Polkit takes a subject and action, and then it applies a set of rules to determine whether the action is allowed. It's a more complex (but in theory more flexible) paradigm than granting one account (root) permission to perform every action. On the other hand, A generic NetworkManager can define a group for users to be able to use certain actions, "network" group? Cannot see why this has to pass through another complex daemon to be validated. The reason polkit is needed for this is because permissions can be handled by one daemon, instead of set independently all over the place. And yeah, while if you look at the capabilities Polkit has right now, it might not seem justified, I agree. It was developed to do more, and that's becoming slowly possible as the underlying system is developed. For example, the way developers want multi-seat to work is that a login screen is presented in every seat, but if someone writes their password into multiple of them, they become a single session spanning multiple monitors. That could be done with changing permissions at run time, but it gets messy fast. Using groups like this seems a bit messy. I sometimes wonder if polkit's functionality could be better implemented as a LSM though. Applications could use existing APIs, you wouldn't need proxy daemons to perform each privileged operation and access checking would be much better isolated from userspace attacks.
mate-settings-daemon - is responsible for setting the various parameters of a MATE session and the applications that run under it. Parameters/Settings such as: Keyboard: layout, accessibility options, shortcuts, media keys AND Clipboard management * Theming: background, icons, GTK+ applications, AND Mouse: cursors, speed, accessibility options, AND Startup of other daemons: screensaver, sound daemon AND Typing break, AND Cleanup of unused files, AND It also sets various application settings through X resources and XSETTINGS. This is a metapackage, it depends on GStreamer or PulseAudio backends.
gtk3.0 - (formerly called GIMP ToolKit) a cross-platform widget toolkit for creating graphical user interfaces (GUIs). It is heavily used by Wayland and X11 windowsing systems. There are thousands of apps that use GTK2 and GTK3 programs. If you run GTK apps you will need a theme compatible with both GTK2 and GTK3 installed. If your running a non-game application on linux it was probably made using a GTK+ library and depend on the GTK Engine. You can change your gtk theme in ~/.gtkrc-2.0 or ~/.config/gtk-3.0/settings.ini or by using a graphical application such as gtk-chtheme or lxappearance (better than gtk-chtheme).
