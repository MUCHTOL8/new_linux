# learning_linux_lvl_02

> Level 02 of the Learning Linux program by Josh Anderson

Level 2 - List of commands.
Skill Level: Padawan (Intermediate)

This file contains the commands to do anything in linux that can be done in Windows or MacOS.

Basic things to know about linux:
level 0: 
level 1: *
level 2: **

basic commands
	cd
	cd {{partial_command}} + press TAB
	ls
	pwd
	cat
	man
	sudo
	--help, -h
	apt-get install
	apt-get remove
	apt-get update
	apt-get upgrade
	apt-cache
	tldr
	clear
	exit
*	shutdown
*	Arrow up
*	Arrow Down
*	sudo !!

myScripts
	install
	remove
	programList

text editors
	nano
*	vim
*	neovim
*	ed

network utilities
	ifconfig - Displays all network interfaces, sets ip address.
***	ip addr - Display all network interfaces, and sets ip address and MUCH MORE.
***	ip route - Show kernel routing table, and add or remove routes.
	NetworkManager - 
	ethtool
*	ufw
*	netstat
*	lsof -l
	iwconfig
	nmcli
	iw
**	hostname - shows system host name, local ip address, and domain name.
file and directory management
	ls
	touch
	cat
	cp
	mv
	rm
	mkdir
	rmdir
	rm -rf
	locate -i {{some_text}}* - find all instances of a file on the system.
	find . -name {{some_file}} - Finds file names in the current directory.
	find d -name {{some_directory}} - Finds all instances of a directory on the system.
*	tree

System utilities
*	htop - Display all running processes and cpu/memory usage.
*	systemctl
*	uname - Displays linux system information.
*	mpstat	

ram and disk space
	du
	free
	df
*	fdisk
*	cfdisk
*	parted

device and filesystem management
*	mount
*	umount
*	lshw	
*	lsblk
*	lsusb
*	hwinfo
*	lscpu
*	lspci
*	lsscsi
*	blkid

system logs
*	journalctl
*	last - Show a list of the last logins on the system.
**	dmesg - Displays all the messages from the Kernel ring buffer.

backup utilities
*	rsync

process management
*	ps - Displays your currently active processes.
	Ctrl + c
	Ctrl + z
	jobs
	fg - Brings the msot recent job to foreground.
*	pstree

