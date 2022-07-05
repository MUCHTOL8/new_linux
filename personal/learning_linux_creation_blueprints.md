# learning_linux_creation_blueprints

> The Learning Linux program development plan.

Sections:
	Commands
	Files
	Directories
	Hotkeys
	Projects


Commands Sections:
0: (BASICS/INTRODUCTION)
1: (CONFIGURATIONS)
2: (PROGRAMS/PROCESSES/SCRIPTS)
3: (NETWORK) 
4: (DEVICES)
5: (LOGS and SPOOLS) 
6: (X11)
7: (VFS)
8: (BOOT, KERNEL/MODULES/DRIVERS)
9: (MISCELLANIOUS) 
10: (SECURITY)
11: (MEM IN-DEPTH, and PROC TRACING)

Files Sections:
0: (BASICS/INTRODUCTION)
1: (CONFIGURATIONS) .bashrc, .bash_profile, .bash_logout, .bash_history, .login, .logout, .profile, .viminfo, .vimrc, /etc/termcap, /etc/profile, /etc/motd, /etc/bashrc, /etc/aliases, /etc/profile.d, /etc/init.d, /etc/bash.bashrc, /etc/profile.d, /home/user/.bashrc, 
2: (PROGRAMS/PROCESSS/SCRIPTS) /etc/crontab, /dev/null,
3: (NETWORK) /etc/resolv.conf, /etc/hosts.deny, /etc/hosts.allow, /etc/hosts, /etc/exports
4: (DEVICES) /etc/printcap, /etc/mtab, /etc/fstab, /dev/null, /dev/hdc, /dev/hda, /dev/fd0, /etc/printcap
5: (LOGS and SPOOLS) /var/log/lastlog, /var/log/messages, /var/log/wtmp, /var/log/auth.log, /var/log/secure (for redhat/centoOS), /var/log/boot.log, /var/log/dmesg, /var/log/kern.log, /var/log/faillog, /var/log/cron, /var/log/yum.log, /var/log/maillog or /var/log/mail.log, var/log/httpd/error_log, var/log/httpd/access_log or /var/log/httpd, /var/log/mysqld.log, /var/log/cups/access_log, /varlog/cups/error_log, /var/log/btmp, /var/log,unattended-upgrades.log, /var/log/unattended-upgrades-shutdown.log, /var/log/snort/snort.log /var/log/installer/casper.log, /var/log/installer/debug, /var/log/installer/media-info, /var/log/installer/partman, /var/log/installer/syslog, /var/log/installer/telemetry, /var/log/installer/version, /var/log/clamav/freshclam.log, /var/log/apt/history.log, /var/log/apt/term.log, /var/log/apache2/access.log, /var/log/apache2/error.log, /var/log/apache2/other_vhosts_access.log, /var/log/alternatives, /var/log/apport.log, /var/log/aptitude, /var/log/dpkg.log, /var/log/rkhunter.log, /var/log/syslog, /var/log/ubuntu-advantage.log, /var/log/ufw.log, /var/log/user.log, /var/log/Xorg.x.log, /var/log/anaconda.log, /var/log/daemon.log, /var/log/lighttpd/, /var/log/conman/, /var/log/prelink/, /var/log/audit/, /var/log/setroubleshoot/, /var/log/samba/, /var/log/sa/, /var/log/sssd/, 
6: (X11) .gtkrc, .wm_style, .Xdefaults & .Xresources, .xinitrc, .xsession, /etc/X11, /usr/bin/X11
7: (VFS) /proc/cpuinfo, /proc/filesystems, /proc/interrupts, /proc/ioports, /proc/meminfo, /proc/modules, /proc/mounts, /proc/stat, /proc/swaps, /proc/version, (ADD THE SPECIFIC PROC AND SYS FILES TO THE SECTIONS THEY RELATE, AND CREATE AN 11 SECTION OUTLINE IN THE PROC/SYS SECTION THAT SHOWS WHERE EACH PROC FILE FITS IN TO THE SECTIONS OF THE OVERVIEW SO YOU CAN SEE IT ALL IN ONE PLACE, ALSO MOVE THE PROC/SYS SECTION TO THE END SO YOU CAN GO OVER THE FILES THAT ARE LESS PERTINANTE ONCE YOU'VE FINISHED ALL 11 SECTIONS.)
8: (BOOT, KERNEL/MODULES/DRIVERS) /etc/modules.conf, /etc/lilo.conf, /etc/inittab, /etc/grub.conf, /etc/fstab, /dev/fd0H1440, /boot/vmlinuz, /etc/rc.d/rc?.d, /etc/rc.d/init.d, /etc/rc.local, /etc/rc.d,  
9: (MISCELLANIOUS) /usr/share, 
10: (SECURITY) /etc/passwd, /etc/securetty, /etc/group, (PROTECT THESE FILES) Kernel parameters in /proc/cmdline, daemons and services in /etc/system.d, run commands in /etc/rc.* and /etc/init.*, set up scripts to run as cron jobs, other crafty ways to cause scripts to run with whenever your shell starts:/etc/profile, ~/.bash_profile, ~/.bash_login, ~/.profile. /home/user/.bashrc, /etc/bash.bashrc, /etc/profile.d, Attackers can override DNS and cause your system to communicate with imposter systems: /etc/hosts and /etc/resolv.conf, user accounts, groups and password hashes are stored are: /etc/passwd, /etc/shadow, /etc/group, /etc/gshadow, password and lockout policies are stored and where sophisticated attackers can install bogus pluggable authentication modules that steal passwords: /etc/pam.d, The actual code Linux runs are files too – usually called binaries. If you can change the code of the operating system you can make the OS do anything you want. Most of the core binaries are found in /bin and /sbin with more peripheral programs in /usr/bin and /usr/local/bin, Some file based attacks don’t require you to change the actual content of the file but simply its attributes so file integrity monitoring is also about detecting attribute and permission changes such as with chattr and chmod.

File integrity monitoring is integral to Linux security. But FIM usually only tells you that a file changed, not what changed in the file or who did it. That’s where privileged access management comes in – especially sudo-io logs which you can watch with sudoreplay. FIM becomes the trigger to investigate changed files and session logs help you determine the who, what and how.
BeyondTrust’s PowerBroker for Unix & Linux combines FIM and Privileged Account Management into one solution that makes it easy to stay in control of what’s happening on your systems.
11: (MEM IN-DEPTH and PROC TRACING)

Directories Sections:
0: (BASICS/INTRODUCTION) /, /home, ~/, /Downloads, /Documents
1: (CONFIGURATIONS) ~/.local, ~/.config, /etc, /bin, /sbin
2: (PROGRAMS/PROCESSES/SCRIPTS) /usr, /usr/local, /usr/bin, /usr/sbin, /usr/local /usr/local, /usr/local/sbin/, /usr/local/bin, /usr/local/src/, /usr/local/lib, /usr/include/g++, /usr/include, /var/tmp, /var/spool/at, /var/spool/cron, /usr/lib, /usr/bin, 
3: (NETWORK)
4: (DEVICES) /mnt, /media, /root, /dev, /var/spool/lpd, /media
5: (LOGS AND SPOOLS) /var, /var/log, /var/mail,  /var/spool, /etc/issue, var/log/httpd, /var/log/cups, /var/log/sysstat, /var/log/snort, /var/log/journal, /var/log/installer, /var/log/hp, /var/log/gdm3, /var/log/firebird, /var/log/apt, /var/log/clamav, /var/log/dist-upgrade, /var/log/chkrootkit, /var/log/apache2, /var/log/openvpn, /var/log/private, /var/log/unattended-upgrades, /var/log/ufw, /var/log/ubuntu-advantage.log, /var/log/speech-dispatcher, 
6: (X11) /usr/include/X11, /etc/X11, /usr/X11(allVariations), /var/lib/xdm, 
7: (VFS) /proc, /sys,
8: (BOOT, KERNEL/MODULES/DRIVERS) /boot/, /lib, /lib/modules, /sbin, /bin, /boot/efi/, /boot/grub, /boot/grub/x86-64-efi, /boot/efi,
9: (MISCELLANIOUS) /usr/src, /usr/src/linux, /var/lib/hwclock, /var/lib/misc, /var/yp, /etc/sgml, /etc/skel, /etc/xml /srv, /tmp, /opt,  /etc/rc.d, /etc/init.d, /etc/profile.d, /var/www, 
10: (SECURITY) 
11: (MEM IN-DEPTH and PROC TRACING) /var/run, /var/crash, /var/lock, 

Hotkeys Sections:
0:
1:
2:
3:
4:
5:
6:
7:

Projects Sections:
0:
1:
2:
3:
4:
5:
6:
7:

