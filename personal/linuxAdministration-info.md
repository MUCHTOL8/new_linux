# linuxAdministration-info

> How to do everything in linux.




-----------------------------------------
-----  |TRANSFORMING DATA STREAMS|  -----
-----------------------------------------
awk
sed
sort
uniq
system
tee
egrep
cut
xargs

Goal:
Extract only the subject lines pertaining to banned SSH connections.


Piece of the source file:

"[Fail2Ban] SSH: banned 186.101.2.130 from wally2.","Fail2Ban
<fail2ban@example.com>","root@wally2.example.org",06/11/2015 14:59, ,
<fail2ban@example.com>","root@wally2.example.org",06/12/2015 0:10, ,
"[Fail2Ban] SSH: banned 91.200.12.21 from smwally","Fail2Ban
<fail2ban@church-ral.org>","root@smwally.church-ral.org",06/12/2015 0:31, ,
"Cron <root@david> time /usr/local/bin/rsbu -vubd1","(Cron Daemon)
<root@david1.example.org>","david@example.org",06/12/2015 1:01, ,
"Cron <root@office1> /usr/local/bin/dbu -bu","root@office1.church-ral.org
(Cron Daemon)","david@example.org",06/12/2015 1:07, ,
"Logwatch for wally1.example.org
(Linux)","logwatch@wally1.example.org","root@wally1.example.org",06/12/2015 3:11, ,
"rkhunter Daily Run on david.example.org","root
<root@david1.example.org>","root@david1.example.org",06/12/2015 3:12, ,
"rkhunter Daily Run on office1.church-ral.org","root <root@office1.church-
ral.org>","root@office1.church-ral.org",06/12/2015 3:12, ,
"Logwatch for alice1.example.org
(Linux)","logwatch@alice1.example.org","root@alice1.example.org",06/12/2015 3:48, ,
"[Fail2Ban] SSH: banned 212.118.132.162 from smwal","Fail2Ban
<fail2ban@church-ral.org>","root@smwally.church-ral.org",06/12/2015 5:04, ,
"[Fail2Ban] SSH: banned 82.187.240.70 from smwally","Fail2Ban
<fail2ban@church-ral.org>","root@smwally.church-ral.org",06/12/2015 5:12, ,
"[Fail2Ban] SSH: banned 132.248.173.10 from smwall","Fail2Ban
<fail2ban@church-ral.org>","root@smwally.church-ral.org",06/12/2015 5:22, ,


Understand these examles:
grep -i banned admin.index | grep SSH | awk '{print $4}' | sort
-n | uniq -c | sort -n

grep "SSH: banned" admin.index | sed 's/","/ /g'| cut -f4 -d" " | grep "^[0-9]"
| sort -k1,1n -k2,2 -k3,3n -k4,4n -t. | uniq -c

egrep -o '".F.*H.*\.[0-9]+' admin.index|cut -d\ -f4|sort|uniq -c

grep SSH admin.index|grep -Po '(\d+\.){3}\d+'|sort|uniq -c

grep SSH admin.index | awk '{print $4}' | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-
9]{1,3}\.[0-9]{1,3}' | sed 's/\".*//' | tee ips | xargs -I % sh -c "echo -ne
'%\t' ; grep -o % ips | wc -w" | sort | uniq > results ; rm ips

curl -s http://www.millennium-technology.com/downloads/admin.index|awk -F,
'$1~/SSH: banned/{print $1}'|grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-
9]\+'|sort|uniq -c

awk '/SSH: banned/ && $4 ~ /^[0-9]/ {print $4}' admin.index | sed 's/[^0-9.]*//g'
| sort | uniq -c | awk '{printf $1 " " $2 " "; system("geoiplookup "$2)};' | sort
-gr | sed 's/ GeoIP Country Edition: / /g'

cat admin.index | egrep -o '([0-9]*\.){3}[0-9]*' | sort -n | uniq -c | sort -nr |
awk '{ORS=" "} {print $1} {print $2} {system("geoiplookup " $2 "| cut -d: -f 2 |
xargs")}'


Find more examples. Find examples you don't understand.


Try some other terminal emulators for different interfaces and features (such as tiling windows in a single terminal window (Tilix), etc.]
Some options: Konsole, rxvt, gnome-terminal, Terminator, etc.
A PTY (pseudo-terminal) is a Linux device file to which a terminal emulator is logically attached in order to interface with the operating system. They are located in dev/pts and are created when a new terminal emulator session is launched. 
A single terminal emulator can have multiple terminals running at once.
A term session is a window pane with one or more terminals open in it.
You can enter the command, info coreutils, to view a list of the GNU Core Utilities, and select individual commands for more information.
A screen session will continue to run even if the connectivity to the remote host is broken because the network connection fails. 
It also allows disconnecting the screen session from the terminal session and reconnecting later from the same or a different computer. 
All of the CLI programs running in the screen terminal sessions will continue to run on the remote host. 
This means that once communications are reestablished, one can log back into the remote host and use the screen -r command at the remote command line to reattach the screen session to the terminal. 
The screen utility allows launching multiple shells in a single terminal session and provides means to navigate between the running shells.You can change your shell with the chsh command so that it will be persistent every
time you log in and start a new terminal session. So if you have a script that runs other commands – which is the purpose of a script – the script runs each command, waiting for it to finish before moving on to run the next command.
That behavior can be modified by appending an ampersand (&) to the end of a command, which places the called command in the background and allows the user to continue to interact with the shell, or for the script to continue processing more commands.

In our preparation for this chapter we installed three other shells, ksh, tcsh, and zsh.csh – the C shell for programmers who like the syntax of the C language.
• ksh – the Korn shell, written by David Korn and popular with Unix
users.
• tcsh – a version of csh with more ease of use features.
• zsh – which combines many features of other popular shells.

Install konsole tilix screen ksh tcsh zsh
You can change shells easily.
Just enter the name of the shell.

Other terminal emulators include Konsole, 4 Tilix, 5 (Figure 7-5), rxvt, 6 gnome-­
terminal, 7 Terminator, 8 and many more.Xterm is still maintained and is packaged as part of many modern Linux distributions.
KDE, Cinnamon, LXDE, GNOME, and others.
Linux typically provides the capability forsix or seven virtual consoles for text mode logins.
If a graphical interface is used, the first Virtual console, vc1, becomes the first graphical (GUI) session after the X Window System (X) starts, and vc7 becomes the second GUI session.
hold down the Ctrl-Alt keys and press F1 to switch to vc1 and what is usually the graphical desktop interface .Linux typically provides the capability for multiple virtual consoles to allow for multiple logins from a single keyboard and monitor.
The console is also the only terminal on which the host would display system-level error messages when problems occurred.
There can be many terminals connected to mainframe and Unix hosts, but only one is or can act as a console.
Dumb terminals have just enough logic in them to display data from the host and to transfer keystrokes back to the host. All of the processing and computing is performed on the host to which the terminal is connected. 

The /usr/local directory is where locally created executables and their configuration files should be stored.
The programs should be located in /usr/local/bin, and the configuration files, if any, in /usr/local/etc. There is also a /var/local directory in which local programs can store their own database files.Do you know where the email inbox is located on an email server? It is in /var/spool/
mail, and each of the inbox files there has the name of the email user ID. 
Do you know where the email inbox is located on an email server? It is in /var/spool/ mail, and each of the inbox files there has the name of the email user ID.h  ttp://refspecs.linuxfoundation.org/fhs.shtmlNote column 2, the middle column,All of the directories with a “Yes” in this columnmust all be located in the same partition or logical volume as the root filesystem because they are an integral part of it. These directories must all be mounted at the beginning of the boot process as a single unit with the root filesystem. 
None of these directories can be located on separate partitions or logical volumes; The directories that have a “No” in column 2 can be created on separate partitions or logical volumes – they do not have to be separate, but they can be. These filesystems,
when they are separate from the root filesystem, are mounted later in the startup sequence based on the information contained in the /etc/fstab file.

Table 6-1. The Top Level of the Linux Filesystem Hierarchical Standard
Directory
Part of / Description / (root filesystem) The root filesystem is the top-level directory of the filesystem. It must contain
all of the files required to boot the Linux system before other filesystems are
mounted. After the system is booted, all other filesystems are mounted on
standard, well-defined, mount points as subdirectories of the root filesystem.
/bin Yes The /bin directory contains user executable files.
/boot No Contains the static bootloader and kernel executable and configuration files required to boot a Linux computer.
/dev Yes This directory contains the device files for every hardware device attached to the system. These are not device drivers, rather they are files that represent each device on the computer and facilitate access to those devices.
/etc Yes Contains a wide variety of system configuration files for the host computer.
/home No Home directory storage for user files. Each human user usually has a subdirectory in /home. Some organizations may choose other locations for the users’ home directories. Some service or sever applications may also use different locations for home directories. For example, the Apache web server uses /var/www. You can look at the /etc/passwd file to view the home directory locations for those users. Installations that use a central file server may also have those remote home directories located on mount points other than /home.
(continued)
83Chapter 6
Using the Linux FHS
Table 6-1. (continued)
Directory Part of / Description
/lib Yes Contains shared library files that are required to boot the system.
/media No A place to mount external removable media devices such as USB thumb
drives that may be connected to the host.
/mnt No A temporary mountpoint for regular filesystems (as in not removable media) that can be used while the administrator is repairing or working on a filesystem.
/opt No Optional files such as vendor-supplied application programs should be located here.
/proc Virtual Virtual filesystem used to expose access to internal kernel information and editable tuning parameters.
/root Yes This is not the root (/) filesystem. It is the home directory for the root user.
/sbin Yes System binary files. These are executables used for system administration.
/selinux Virtual This pseudo filesystem is only used when SELinux is enabled. When activated, this filesystem contains critical SELinux tools and files.
/sys Virtual This virtual filesystem contains information about the USB and PCI buses and the devices attached to each.
/tmp No Temporary directory. Used by the operating system and many programs to store temporary files. Users may also store files here temporarily. Note that files stored here may be deleted at any time without prior notice.
/usr No These are shareable, read-only files including executable binaries and libraries, man[ual] files, and other types of documentation.
/usr/local No These are typically shell programs or compiled programs and their supporting configuration files that are written locally and used by the SysAdmin or other users of the host.
/var No Variable data files are stored here. This can include things like log files, MySQL and other database files, web server data files, email inboxes, and much more.The /media and /mnt directories are mount points for temporary filesystem maintenance or for external devices such as USB thumb drives that contain filesystems.
There is actually one exception to the “top level” statement about Table 6-1. That is the /usr/local directory.1. The entire Linux directory structure starting at the top (/) root directory.
2. A specific type of data storage format such as EXT3, EXT4, BTRFS, XFS, and so on. Linux supports almost 100 types of filesystem including some very old ones, as well as some of the newest.
Each of these filesystem types uses its own metadata structures to define how the data is stored and accessed.
3. A partition or logical volume formatted with a specific type of filesystem that can be mounted on a specified mount point – a directory – on a Linux filesystem.
The Linux filesystem directory structure consists of a hierarchy of mountable filesystems, item number 3 on the list at the beginning of this chapter. 
This can work only because a filesystem, such as /home, /tmp, /var, /opt, or /usr can be created on separate physical hard drives, a different partition, or a different logical volume from the / (root) filesystem and then be mounted on a mountpoint as part of the root filesystem directory tree. 
Mountpoints are just empty directories with nothing special about them. Even removable drives such as a USB thumb drive, an external USB or an ESATA hard drive will be mounted onto the root filesystem and become an integral part of that directory tree. 
In general, and aside from any upgrade utilities like dnf-upgrade in Fedora, it is wise to occasionally reformat the root and other partitions containing the operating system during an upgrade to positively remove any cruft that has accumulated over time. 
If /home is part of the root filesystem, it will be reformatted as well and would then have to be restored from a backup. 
By having /home as a separate filesystem, it will be known to the installation program as a separate filesystem and formatting of that filesystem can be skipped. 
This can also apply to /var where database, email inboxes, web site, and other variable user and system data are stored, and the /opt filesystem where commercial applications are intended to be stored. 
Thus none of that data is lost, and the applications should not require reinstallation unless the vendor is incredibly stupid.I managed to fill up my home directory with a large number of very big files. 
Since neither the /home directory nor the /tmp directory were separate filesystems but simply subdirectories of the root filesystem, the entire root filesystem filled up. 
There was no room left for the operating system to create temporary files or to expand existing data files. 
At first the application programs started complaining that there was no room to save files, and then the OS itself started to act very strangely. Booting to single user mode and clearing out the offending files in my home directory allowed me to get going again; I then reinstalled Linux using a pretty standard multi-filesystem setup and was able to prevent complete system crashes from occurring again. 
I once had a situation where a Linux host continued to run, but prevented the user from logging in using the GUI desktop. 
I was able to log in using the command-line interface (CLI) locally using one of the virtual consoles, and remotely using SSH. 
The problem was that the /tmp filesystem had filled up and some temporary files required by the GUI desktop could not be created at login time. 
Because the CLI login did not require files to be created in /tmp, the lack of space there did not prevent me from logging in using the CLI. 
In this case the /tmp directory was a separate filesystem and there was plenty of space available in the volume group of which the /tmp logical volume was a part. I simply expanded the /tmp logical volume to a size that accommodated my fresh understanding of the amount of temporary file space needed on that host and the problem was solved. Note that this solution did not require a reboot and as soon as the /tmp filesystem was enlarged, the user was able to log in to the desktop.Linux has some special filesystems/proc and /sys. 
These are virtual filesystems that exist only in RAM. 
They disappear when the computer is turned off and are re-created anew each time Linux starts up.The /proc filesystem is defined by the FHS as the location for Linux to store information about the system, the kernel, and all processes running on the host. 
It is intended to be a place for the kernel to expose information about itself in order to facilitate access to data about the system. 

It is also intended to provide access to view kernel configuration parameters and to modify many of them when necessary. 
When used as a window into the state of the operating system and its view of the system and hardware, it provides easy access to virtually every bit of information you might want as a SysAdmin.If you want the complete picture of memory usage, look in /proc/meminfo.The /sys directory maintains the list of hardware hierarchically for each bus type in the computer hardware.



#!/bin/bash
################################################################################
#                                   doUpdates
#
#
#
# This is a simple program to perform updates on a Linux computer. If a new
#
# kernel is installed, it will build a new grub.cfg to create the recovery
#
# mode kernel boot options, and then reboot the computer.
#
#
#
# Change History
#
## 04/12/2017 David Both
Original code. Suitable only for testing.
#
# 04/13/2017 David Both
Tested code. V1.0.0.
#
# 04/13/2017 David Both
Added messages for rebooting or not at end.
#
#
Added check for new glibc for doing reboot.
#
# 04/14/2017 David Both
Completion message includes hostname.
#
# 04/28/2017 David Both
Add GPL2 statement.
#
# 05/12/2017 David Both
Added the code I forgot that rebuilds the grub.cfg #
#
file. Duh.
#
# 06/30/2017 David Both
Test for glibc separately then change the logic so #
#
we only rebuild grub.conf when replacing the
#
#
kernel.
#
# 08/08/2017 David Both
Add -r option so that reboots only occur if -r is #
#
used and the kernel or glibc is updated.
#
# 08/11/2017 David Both
Redo logic for reboots just a bit. Add message to #
#
manually reboot if kernel or glibc updated but the #
#
-r option was not selected.
#
#
Add -c option to check and report on whether
#
#
updates are needed and whether reboot is needed. #
################################################################################
################################################################################
# Copyright (C) 2007, 2018 David Both
#
# LinuxGeek46@both.org
#
# This program is free software; you can redistribute it and/or modify
#
# it under the terms of the GNU General Public License as published by
#
# the Free Software Foundation; either version 2 of the License, or
#
# (at your option) any later version.
#
#
#
# This program is distributed in the hope that it will be useful,
#
# but WITHOUT ANY WARRANTY; without even the implied warranty of
#
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#
# GNU General Public License for more details.
#
#
#
# You should have received a copy of the GNU General Public License
#
# along with this program; if not, write to the Free Software
#
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA #
################################################################################
################################################################################
# Help
#
################################################################################
Help()
{
# Display Help
echo "doUpdates - Performs all updates, builds new GRUB2, and"
echo "reboots if a new kernel or glibc was installed."
echo
echo "Syntax: doUpdates --[g|h|c|V|rv]"
echo "options:"
echo "g
Print the GPL license notification."
echo "c
Check to see if updates are available and whether reboot would be
needed."
echo "
Does not actually do the update or reboot."
echo
echo
echo
echo
echo
"h
"r
"v
"V
Automate Everything
Print this Help."
Reboot if the kernel or glibc or both have been updated."
Verbose mode."
Print software version and exit."
}
################################################################################
# Print the GPL license header
#
################################################################################
gpl()
{
echo
echo
"###############################################################################"
echo "# Copyright (C) 2007, 2016 David Both
#"
echo "# LinuxGeek46@both.org
#"
echo "#
#"
echo "# This program is free software; you can redistribute it and/or modify
#"
echo "# it under the terms of the GNU General Public License as published by
#"
echo "# the Free Software Foundation; either version 2 of the License, or
#"
echo "# (at your option) any later version.
#"
echo "#
#"
echo "# This program is distributed in the hope that it will be useful,
#"
echo "# but WITHOUT ANY WARRANTY; without even the implied warranty of
#"
echo "# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#"
echo "# GNU General Public License for more details.
#"
echo "#
#"
echo "# You should have received a copy of the GNU General Public License
#"
echo "# along with this program; if not, write to the Free Software
#"
echo "# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA #"
echo "##############################################################################"
echo
}
################################################################################
# Quit nicely with messages as appropriate
#
################################################################################
Quit()
{
if [ $verbose = 1 ]
then
if [ $error = 0 ]
then
echo "Program terminated normally"
else
echo "Program terminated with error ID $ErrorMsg";
fi
fi
exit $error
}
################################################################################
# Display verbose messages in a common format
#
################################################################################
PrintMsg()
{
if [ $verbose = 1 ] && [ -n "$Msg" ]
then
echo "########## $Msg ##########"
# Set the message to null
Msg=""
fi
}
################################################################################
# Define the $PkgMgr variable based on distro and release
#
################################################################################
SelectPkgMgr()
{
# get the Distribution, release and architecture.
GetDistroArch
if [ $NAME = "Fedora" ] && [ $RELEASE -ge 20 ]
then
PkgMgr="dnf"
elif [ $NAME = "Fedora" ] && [ $RELEASE -lt 20 ]
then
PkgMgr="yum"
elif [ $NAME = "CentOS" ]
then
PkgMgr="yum"
else
Msg="Unknown distrubution and release. Unable to define Package Manager."
PrintMsg
error=7
Quit $error
fi
Msg="Using $PkgMgr Package Manager"
PrintMsg
} # End SelectPkgMgr
################################################################################
# Get Distribution and architecture 64/32 bit
#
################################################################################
GetDistroArch()
{
#---------------------------------------------------------------------------
# Get the host physical architecture
HostArch=`echo $HOSTTYPE | tr [:lower:] [:upper:]`
Msg="The host physical architecture is $HostArch"
PrintMsg
#---------------------------------------------------------------------------
# Get some information from the *-release file. We care about this to give
# us Fedora or CentOS version number and because some group names change between
# release levels.
#---------------------------------------------------------------------------
# First get the distro info out of the file in a way that produces consistent
results
# Due to the different ways distros keep info in the release files we have to do
this
# a bit harder than we would otherwise.
# Switch to /etc for now
cd /etc
# Start by looking for Fedora
if grep -i "NAME=Fedora" os-release > /dev/null
then
# This is Fedora
NAME="Fedora"
# Define the Distribution
Distro=`grep PRETTY_NAME os-release | awk -F= '{print $2}' | sed -e "s/\"//g"`
# Get the full release number
FULL_RELEASE=`grep VERSION_ID os-release | awk -F= '{print $2}'`
# The Release version is the same as the full release number, i.e., no minor
versions for Fedora
RELEASE=$FULL_RELEASE
#---------------------------------------------------------------------------
# Verify Fedora release $MinFedoraRelease= or above. This is due to the lack
# of Fedora and Fusion repositories prior to that release.
#---------------------------------------------------------------------------
if [ $RELEASE -lt $MinFedoraRelease ]
then
Msg="Release $RELEASE of Fedora is not supported. Only releases
$MinFedoraRelease and above are supported."
PrintMsg
error=2
Quit $error
fi
elif grep -i CentOS centos-release > /dev/null
then
# This is CentOS
NAME="CentOS"
Distro=`cat centos-release`
# Get the full release number
FULL_RELEASE=`echo $Distro | sed -e "s/[a-zA-Z() ]//g"`
# Get the CentOS major version number
RELEASE=`echo $FULL_RELEASE | awk -F. '{print $1}'`
#---------------------------------------------------------------------------
# Verify CentOS release $MinCentOSRelease= or above. This is due to the lack
# of testing for this program prior to that release.
#---------------------------------------------------------------------------
if [ $RELEASE -lt $MinCentOSRelease ]
then
Msg="Release $RELEASE of CentOS is not supported. Only releases
$MinCentOSRelease and above are supported."
PrintMsg
error=4
Quit $error
fi
else
Msg="Unsupported OS: $NAME"
PrintMsg
error=2
Quit $error
fi
Msg="Distribution = $Distro"
PrintMsg
Msg="Name = $NAME Release = $RELEASE Full Release = $FULL_RELEASE"
PrintMsg
# Now lets find whether Distro is 32 or 64 bit
if uname -r | grep -i x86_64 > /dev/null
then
# Just the bits
Arch="64"
else
# Just the bits
Arch="32"
fi
if [ $verbose = 1 ]
then
Msg="This is a $Arch bit version of the Linux Kernel."
PrintMsg
fi
} # end GetDistroArch
################################################################################
################################################################################
# Main program
#
################################################################################
################################################################################
# Set initial variables
badoption=0
check=0
doReboot=0
error=0
MinCentOSRelease="6"
MinFedoraRelease="22"
NeedsReboot=0
newKernel=0
newglibc=0
PkgMgr="dnf"
RC=0
UpdatesAvailable=0
verbose=0
version=01.02.03
#---------------------------------------------------------------------------
# Check for root
if [ `id -u` != 0 ]
then
echo ""
echo "You must be root user to run this program"
echo ""
Quit 1
fi
################################################################################
# Process the input options
#
################################################################################
# Get the options
while getopts ":gchrvV" option; do
case $option in
g) # display GPL
gpl
Quit;;
v) # Set verbose mode
verbose=1;;
V) # Set verbose mode
echo "Version = $version"
Quit;;
c) # Check option
verbose=1
check=1;;
r) # Reboot option
doReboot=1;;
h) # display Help
Help
Quit;;
\?) # incorrect option
badoption=1;;
esac
done
if [ $badoption = 1 ]
then
echo "ERROR: Invalid option"
Help
verbose=1
error=1
ErrorMsg="10T"
Quit $error
fi
# What package manager should we be using?
SelectPkgMgr
# Are updates available? Just quit with message if not
# RC from dnf check-update = 100 if available and 0 if none available.
$PkgMgr check-update > /dev/null
UpdatesAvailable=$?
if [ $UpdatesAvailable = 0 ]
then
Msg="Updates are NOT available for host $HOSTNAME at this time."
# Turn on verbose so message will print
verbose=1
PrintMsg
Quit
else
Msg="Updates ARE available for host $HOSTNAME."
# Turn on verbose so message will print
PrintMsg
fi
# Does the update include a new kernel
if $PkgMgr check-update | grep ^kernel > /dev/null
then
newKernel=1
NeedsReboot=1
fi
# Or is there a new glibc
if $PkgMgr check-update | grep ^glibc > /dev/null
then
newglibc=1
NeedsReboot=1
fi
# Are we checking or doing?
if [ $check = 1 ]
then
# Checking: Report results and quit
if [ $NeedsReboot = 1 ]
then
Msg="A reboot will be required after these updates are installed."
PrintMsg
else
Msg="A reboot will NOT be required after these updates are installed."
PrintMsg
fi
Quit
else
# Do the update
$PkgMgr -y update
# Preserve the return code
# RC=$?
# Message and quit if error =3 occurred
if [ $RC -eq 1 ]
then
Msg="An error ocuurred during the update but it was handled by $PkgMgr."
PrintMsg
elif [ $RC -eq 3 ]
then
Msg="WARNING!!! An uncorrectable error ocuurred during the update."
PrintMsg
Quit
fi
fi
# Update man database
mandb
# If new kernel rebuild grub.cfg and reboot
if [ $newKernel = 1 ]
then
# Generate the new grub.cfg file
Msg="Rebuilding the grub.cfg file on $HOSTNAME."
PrintMsg
grub2-mkconfig > /boot/grub2/grub.cfg
fi
if [ $doReboot = 1 ] && [ $NeedsReboot = 1 ]
then
# reboot the computer because the kernel or glibc have been updated
# AND the reboot option was specified.
Msg="Rebooting $HOSTNAME."
PrintMsg
reboot
# no need to quit in this fork
elif [ $doReboot = 0 ] && [ $NeedsReboot = 1 ]
then
Msg="This system, $HOSTNAME, needs rebooted but you did not choose the -r option
to reboot it."
PrintMsg
Msg="You should reboot $HOSTNAME manually at the earliest opportunity."
else
Msg="NOT rebooting $HOSTNAME."
fi
PrintMsg
Quit
################################################################################
# End of program
################################################################################





The minimum I will accept is a description and sample of the input data;
any formulas, logic, or other processing required; and a description of the required
outputs or functional results.

we can
say that the need for speed of development in the SysAdmin’s job overrides the need
to make the program run as fast as possible or to use as little as possible in the way of
system resources like RAM.

As lazy SysAdmins we
have lots of C code already available in the form of the Linux Core Utilities and other
command-line utilities. We should always use that which is already there.

Variables
Use variables instead of hard-coded values for almost everything. Even if you think you
will only use a particular value once, such as a directory name or a file name, create a
variable and use the variable where you would have placed the hard-coded name.
Many times I have needed a particular value in more places in the scripts so I am
already prepared if it is accessed as a variable. It can take less time to type a variable
name than a complete directory name, especially if it is a long one. It is also easier to
change a script if the value changes. Fixing the value of the variable in one location is
much easier than replacing it in several locations.
I always have a single location in my scripts to set initial values for variables. Keeping
the initial variable settings in the same place helps make them easy to find.

The test plan should be created from the requirements statements. The test plan will
have lists of the requirements to test, such as, “for input X the output should be Y,” and
“for bad input error message X should be displayed.”
“Test Early, Test Often,”

Open and Open Source
Of course this code sharing depends upon the open source licensing of the original
code. I always include within the code itself an explicit statement of the license under
which I share the code I write, usually the GPL V2. Many times I even have an option in
the program to display the GPL license statement.
Making all of the code I write Open Source and properly licensed as such is just
another basic requirement as far as I am concerned.

shell scripts as a tool for prototyping large and complex programs.That
approach can allow for fast prototyping and early testing to ensure that the program is
exactly what the customer wants.

As the number of computers in my home network grew, I realized that I was also
updating the man database; making a decision; and, if there was a kernel update,
updating the GRUB configuration file and running the reboot command. At that point I
wrote a simple script with no frills to perform those tasks.
But that script needed a couple decisions of its own and some direction from me.
I did not want to have the script arbitrarily reboot the host every time it was run. So I
added an option to reboot only if the kernel or glibc were updated. Well, that required
that I add the case command to interpret the options. I also added a variable that
contained the current version of the program and an option to display the version. A
bit later I added a “verbose” option so I could get more debugging information if the
program encountered problems.
With the addition of options I needed a Help facility, so I added that. Then I added
an option to display the GPL statement.

Planning and Foresight
Some programs written by SysAdmins are actually planned in advance. Once again I
start with a set of requirements although I try to spend a bit more time formulating them
than with the quick and dirty programs.
To start coding, I make a copy of the script template and name it appropriately. The
template contains all of the standard procedures and basic structure that I need to begin
any project. This template includes a skeletal help facility, a procedure for ending the
program with an appropriate return code (RC), and a case statement to enable use of
options.
So the first thing I do with this template is code the help facility. Then I test to see if
that is working and looks as I intend. Coding the Help facility first also begins the process
of documentation. It helps me to define the function of the script as well as some of the
features.
At this point I like to add comments that define specific functionality and create
execution sequences within the script. If I need to write a new procedure, I create a
small skeleton for that procedure with comments that contain a short description of its
function. By adding these comments first, I have embedded the set of requirements I
created earlier into the very fabric of the code. This makes it easy to follow and ensure
that I have translated all of those requirements into code.
I then begin to add code to each section of comments. And then I test each new
section to ensure that it meets the requirements stated in the comments.

Of course all scripts should begin with the shebang and this one is no different. Then
I add a couple sections of comments.
The first comment section is the program name and description and a change
history. This is a format I learned while working at IBM, and it provides a means of
documenting the long-term development of the program and any fixes applied to it. This
is an important start to documenting your program.
The second comment section is a copyright and license statement. I use the GPL2
and this seems to be a standard statement for programs licensed under the GPL2. If you
choose to use a different open source license, that is fine, but I do suggest adding an
explicit statement like this to the code in order to eliminate any possible confusion about
licensing. I read an interesting article recently, “The source code is the license, 1 ” that
helps to explain the reasoning behind this.
The procedures section begins after these two comment sections. This is the required
location for procedures in Bash. They must appear before the body of the program. As part
of my own need to document everything, I place a comment before each procedure that
contains a short description of what it is intended to do. I also include comments inside
the procedure to provide further elaboration. Your own procedures can be added here.


