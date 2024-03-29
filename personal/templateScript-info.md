#--------------------------------------------------------------------------
#------------------------| EXAMPLE SCRIPT |--------------------------------
#---------------------------------------------------------------------------


#!/bin/bash
################################################################################
#                                   doUpdates				       #
#									       #
# This is a simple program to perform updates on a Linux computer. If a new    #
# kernel is installed, it will build a new grub.cfg to create the recovery     #
# mode kernel boot options, and then reboot the computer.		       #
#									       #
# Change History							       #
# 04/12/2017 David Both    Original code. Suitable only for testing.	       #
# 04/13/2017 David Both	   Tested code. V1.0.0.				       #
# 04/13/2017 David Both    Added messages for rebooting or not at end.	       #
#			   Added check for new glibc for doing reboot.	       #
# 04/14/2017 David Both    Completion message includes hostname.   	       #
# 04/28/2017 David Both    Add GPL2 statement.				       #
# 05/12/2017 David Both	   Added the code I forgot that rebuilds the grub.cfg  #
#			   file. Duh.					       #
# 06/30/2017 David Both    Test for glibc separately then change the logic so  #
#			   we only rebuild grub.conf when replacing the	       #
#			   kernel.					       #
# 08/08/2017 David Both	   Add -r option so that reboots only occur if -r is   #
#			   used and the kernel or glibc is updated.	       #
# 08/11/2017 David Both	   Redo logic for reboots just a bit. Add message to   #
#			   manually reboot if kernel or glibc updated but the  #
#			   -r option was not selected.			       #
#			   Add -c option to check and report on whether	       #
#			   updates are needed and whether reboot is needed.    #
################################################################################
################################################################################
# Copyright (C) 2007, 2018 David Both					       #
# LinuxGeek46@both.org							       #
# This program is free software; you can redistribute it and/or modify	       #
# it under the terms of the GNU General Public License as published by         #
# the Free Software Foundation; either version 2 of the License, or            #
# (at your option) any later version. 					       #
#									       #
# This program is distributed in the hope that it will be useful,	       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of	       #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the		       #
# GNU General Public License for more details.				       #
#									       #
# You should have received a copy of the GNU General Public License	       #
# along with this program; if not, write to the Free Software		       #
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA      #
################################################################################
################################################################################
# Help									       #
################################################################################
Help()
{
    # Display Help
    echo "doUpdates - Performs all updates, builds new GRUB2, and"
    echo "reboots if a new kernel or glibc was installed."
    echo
    echo "Syntax: doUpdates --[g|h|c|V|rv]"
    echo "options:"
    echo "g	Print the GPL license notification."
    echo "c	Check to see if updates are available and whether reboot would be
needed."
    echo "	Does not actually do the update or reboot."
echo "h		Print this Help."
echo "r 	Reboot if the kernel or glibc or both have been updated."
echo "v 	Verbose mode."
echo "V 	Print software version and exit."
echo
}

################################################################################
# Print the GPL license header						       #
################################################################################
gpl()
{
echo
echo
"###############################################################################"
echo "# Copyright (C) 2007, 2016 David Both				           #"
echo "# LinuxGeek46@both.org						           #"
echo "#						       			           #"
echo "# This program is free software; you can redistribute it and/or modify       #"
echo "# it under the terms of the GNU General Public License as published by       #"
echo "# the Free Software Foundation; either version 2 of the License, or          #"
echo "# (at your option) any later version.				           #"
echo "#						       			           #"
echo "# This program is distributed in the hope that it will be useful,	           #"
echo "# but WITHOUT ANY WARRANTY; without even the implied warranty of	           #"
echo "# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the	           #"
echo "# GNU General Public License for more details.			           #"
echo "#						        		           #"
echo "# You should have received a copy of the GNU General Public License          #"
echo "# along with this program; if not, write to the Free Software	           #"
echo "# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA    #"
echo "##############################################################################"
echo
}

################################################################################
# Quit nicely with messages as appropriate				       #
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
# Display verbose messages in a common format				       #
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
# Define the $PkgMgr variable based on distro and release		       #
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
# Get Distribution and architecture 64/32 bit				       #
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
# Main program								       #
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
# Process the input options						       #
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
    RC=$?
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




#---------------------------------------------------------------------------
#----------------------------| TEMPLATE SCRIPT |----------------------------
#---------------------------------------------------------------------------



#!/bin/bash
################################################################################
#			     script.template.sh				       #
#									       #
# Use this template as the beginning of a new program. Place a short	       #
# description of the script here.					       #
#									       #
# Change History							       #
# 04/12/2017 David Both     Original code. This is a template for creating     #
#			    new Bash shell scripts.			       #
#			    Add new history entries as needed.		       #
#									       #
################################################################################
################################################################################
#									       #
# Copyright (C) 2007, 2016 David Both					       #
# LinuxGeek46@both.org							       #
#									       #
# This program is free software; you can redistribute it and/or modify	       #
# it under the terms of the GNU General Public License as published by         #
# the Free Software Foundation; either version 2 of the License, or	       #
# (at your option) any later version.					       #
#									       #
# This program is distributed in the hope that it will be useful,	       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of	       #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the		       #
# GNU General Public License for more details.				       #
#									       #
# You should have received a copy of the GNU General Public License	       #
# along with this program; if not, write to the Free Software		       #
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA      #
#									       #
################################################################################
################################################################################
# Help									       #
################################################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: template <option list here>"
   echo "options:"
   echo "g	Print the GPL license notification."
   echo "h	Print this Help."
   echo "v	Verbose mode."
   echo "V	Print software version and exit."
   echo
}

################################################################################
# Print the GPL license header						       #
################################################################################
gpl()
{
   echo
   echo "################################################################################"
   echo "# Copyright (C) 2007, 2016 David Both					        #"
   echo "# Millennium Technology Consulting LLC					        #"
   echo "# http://www.millennium-technology.com					        #"
   echo "#									        #"
   echo "# This program is free software; you can redistribute it and/or modify	        #"
   echo "# it under the terms of the GNU General Public License as published by	        #"
   echo "# the Free Software Foundation; either version 2 of the License, or	        #"
   echo "# (at your option) any later version.					        #"
   echo "#									        #"
   echo "# This program is distributed in the hope that it will be useful,	        #"
   echo "# but WITHOUT ANY WARRANTY; without even the implied warranty of	        #"
   echo "# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the		        #"
   echo "# GNU General Public License for more details.				        #"
   echo "#									        #"
   echo "# You should have received a copy of the GNU General Public License	        #"
   echo "# along with this program; if not, write to the Free Software		        #"
   echo "# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA      #"
   echo "################################################################################"
   echo
}

################################################################################
# Quit nicely with messages as appropriate				       #
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
# Display verbose messages in a common format 				       #
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
################################################################################
# Main program								       #
################################################################################
################################################################################
# Set initial variables
badoption=0
error=0
RC=0
verbose=0
version=01.02.03

#---------------------------------------------------------------------------
# Check for root. Delete if necessary.

if [ `id -u` != 0 ]
then
    echo ""
    echo "You must be root user to run this program"
    echo ""
    Quit 1
fi

################################################################################
# Process the input options. Add options as needed.			       #
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

################################################################################
################################################################################
# The main body of your program goes here.				       #
################################################################################
################################################################################

Quit

################################################################################
# End of program							       #
################################################################################
