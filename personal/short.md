# short

> Useful shortcuts and commands.

- Access a consoles 1 through 7

`CTRL + ALT + F[1-7]`

- Return to the last directory you visited.

`cd -`

- Rerun last command but with sudo:

`sudo!!`

- Cut until teh beginning of the line (BASH).

`Ctrl + u`

- Cuts to the end of the line (BASH).

`Ctrl + k`

- Pastes cut text (BASH). Useful if you forgot Sudo but haven't run the command.

`Ctrl + y`


- Follow logs in real-time.
- 4 types of logs: Application Logs, Event Logs, Service Logs, System Logs.
- Useful logs to follow: /var/log/syslog; var/log/message(syslog for non-debian systems); var/log/auth.log; var/log/secure(auth.log for non-debian systems); var/log/boot.log; /var/log/maillog (or) /var/log/mail.log; /var/log/kern; /var/log/dmesg; var/log/faillog; /var/log/cron; /var/log/daemon.log; var/log/btmp; /var/log/utmp; /var/log/wtmp; var/log/lastlog; 
- Special logs:
- /var/log/pureftp.log; /var/log/spooler; /var/log/xferlog;
- /var/log/yum.log (if yum package manager is installed);   
- /var/log/mysqld.log (or) /var/log/mysql.log (&) /var/log/mariadb/mariadb.log (for redhat and centos) (or) /var/logmysql/error.log (for Debian) (if you have mysql installed).

`less +f {{src}}`
`tail -f -n5 {{src}}`

- Follow the kernel ring buffer log.

`dmesg`
- or 
`dmesg|less`

- Follow Systemd messages
- From left to right:
- (1)Time message was created. (2)The hostname. (3)The name of the process that generated the message. (4)The Log Message.

`sudo journalctl -f -n 10

- For a shorter listing.

`journalctl -o short'

- To see all the metadata that accompanies each log message.

` journalctl -o verbose

- To see the full time stamp

`journalctl -o short-full (or) -o verbose-full

- How to read the the Priority field:
- 0: Emergency. The system is unusable.
- 1: Alert. A condition has been flagged that should be corrected immediately.
- 2: Critical. This covers crashes, coredumps, and significant failures in primary applications.
- 3: Error. An error has been reported, but it is not considered severe.
- 4: Warning. Brings a condiiton to your attention that, if ignored, may become an error.
- 5: Notice. Used to report events that are unusual, but not errors.
- 6: Information. Regular operational messages. These do not require action.
- 7: Debug. Messsages put into applications to make it easier for them to debug them.

- If you want it to be output in JSON (JavaScript Object Notation) objects.

`journalctl -o json`
- (or)
`journalctl -o json-pretty

- To only see the log messages, without the other data. Normally useless without showing which process raised the log event.

`journalctl -o cat

- To limit the output from journalctl to a time period use -S (since) or -U (until).

`journalctl -S {{date}} -U {{date}} (example date: "2020-91-12 07:00:00")

- Using relative time period:
- d (ex. 1d)
- now
- m (minutes)
- w (weeks)
- h (ex. 1h)
- yesterday (references everything from beginning to end of yesterday)
- today (referenes since or up to 0:00:00 today)


`journalctl -S 1d

- Queries device information from the /dev filesystem and controls the udevd daemon, and monitors udev and kernel events.

`udevadm`
`expects one of six commands as it's frist argument:`
`info, trigger, settle, control, monitor, or test.`
`info - prints device-specific information.`
`control - starts and stops udevd or forces it to reload its rules files.`
`monitor - displays events as they occur`




- Create devices manually. Looks up details to create a tldr page.

`mknod {{filename type major minor}}`
`filename - device file to be created.`
`type - c for character device or b for block device.`
`major and minor - the major and minor device numbers.`
`If creating a device file that refers to a driver that's already present in your system then check the documentation for the driver to find the appropriate major and minor device numbers.`
`It is sometimes convenient to implement an abstraction as a device driver even when it controls no actual device; such as pseudo-TTY(PTY), /dev/zero, /dev/null/, dev/urandom.`
`When your OS doesn't have the means to connect to a device you can create a device driver file and a device driver to connect up that device.`

- See the major and minor number of a device file.

`ls -l {{/dev/sda}}`
`give ls the path to a device file in the /dev filesystem and a -l flag.`

- /sys - provides detailed information about the system's available devices via a vfs.

`block - Information about block devices such as hard disks`
`bus - Buses known to the kernel: PCI-E, SCSI, USB, and others`
`class - A tree organized by functional types of devices; For example, sound and graphic cards, input devices, and network interfaces`
`dev - Device information split between character and block devices`
`devices - An ancestrally correct representation of all discovered devices`
`firmware - Interfaces to platform-specific subsystems such as ACPI`
`fs - A directory for some, but not all, filesystems known to the kernel`
`kernel - Kernel internals such as cache and virtual memory status`
`module - Dynamic modules loaded by the kernel`
`power - A few details about the system’s power state; mostly unused`

- /proc - Check out the proc filesystem

`.`

- sysctl - check out the sysctl command.

`.`

- /proc/sys - contains some tunable kernel parameters.

`cdrom/autoclose - Autocloses the CD-ROM when mounted`
`cdrom/autoeject - Autoejects the CD-ROM when unmounted`
`fs/file-max - Sets max number of open files`
`kernel/ctrl-alt-del - Reboots on <Control-Alt-Delete>; may increase security on unsecured consoles`
`kernel/panic - Sets seconds to wait before rebooting after a kernel panic: 0 = loop or hang indefinitely`
`kernel/panic_on_oops - Determines the kernel’s behavior after encountering an oops or a bug: 1 = always panic`
`kernel/printk_ratelimit - Sets minimum seconds between kernel messages`
`kernel/printk_ratelimit_burst - Sets number of messages in succession before the printk rate limit is actually enforced`
`kernel/shmmax - Sets max amount of shared memory`
`net/ip*/conf/default/rp_filter -  Enables IP source route verification; This antispoofing mechanism makes the kernel drop packets received from “impossible” paths.`
`net/ip*/icmp_echo_ignore_all - Ignores ICMP pings when set to 1; The related variable icmp_echo_ignore_broadcasts ignores broadcast ICMP pings. It’s almost always a good idea to set this value to 1.`
`net/ip*/ip_forward - Allows IP forwarding when set to 1; Only set this value to 1 if you explicitly intend to use your Linux box as a network router.`
`net/ip*/ip_local_port_range - Sets local port range used during connection setup; Increase this range to 1024–65000 on servers that initiate many outbound connections.`
`net/ip*/tcp_syncookies - Protects against SYN flood attacks; turn on if you suspect denial-of-service (DoS) attacks`
`tcp_fin_timeout - Sets seconds to wait for a final TCP FIN packet; Try setting this value lower (~20) on high-traffic servers to increase performance.`
`vm/overcommit_memory - Controls memory overcommit behavior, i.e., how the kernel reacts when physical memory is insufficient to handle a VM allocation request`
`vm/overcommit_ratio - Defines how much physical memory (as a percentage) will be used when overcommitting`


- Subdirectories containing the versioned kernel source files.

`/usr/src/kernels`
`ubuntu doesn't keep the kernel source anywhere on the system`

- make - make command is for creating a user interface that allows for easy configurability instead of configuring a file by hand?????? This is done for things you'll use the build command on to compile??????

`If you are running KDE:`
`make xconfig`
`If you are running GNOME:`
`make gconfig`
`If you only have a terminal:`
`make menuconfig`
`If you're migrating an existing kernel configuration to a new kernel version (or tree):`
`make oldconfig`
`make oldconfig reads in the previous config file and asks only the questions that are new to this edition of the kernel.`


- Build a new Kernel.

`Here’s an outline of the entire process:`
`1. Change directory (cd) to the top level of the kernel source directory.`
`2. Run make xconfig, make gconfig, or make menuconfig.`
`3. Run make clean.`
`4. Run make.`
`5. Run make modules_install.`
`6. Run make install.`

You might also have to update, configure, and install the GRUB boot loader’s con-
figuration file if this was not performed by the make install step. The GRUB up-
dater scans the boot directory to see which kernels are available and automatically
includes them in the boot menu.
The make clean step is not strictly necessary, but it’s generally a good idea to start
with a clean build environment. In practice, many problems can be traced back to
this step having been skipped.i




- uname - Print certain system information.

`With no OPTION, same as -s.`
`  -a, --all                print all information, in the following order,`
`                             except omit -p and -i if unknown:`
`  -s, --kernel-name        print the kernel name`
`  -n, --nodename           print the network node hostname`
`  -r, --kernel-release     print the kernel release`
`  -v, --kernel-version     print the kernel version`
`  -m, --machine            print the machine hardware name`
`  -p, --processor          print the processor type (non-portable)`
`  -i, --hardware-platform  print the hardware platform (non-portable)`
`  -o, --operating-system   print the operating system`
`      --help     display this help and exit`
`      --version  output version information and exit`

- lsmod - inspect the currently loaded modules (LKM - loadable kernel modules).

`Find more details and create tldr note`

- modprobe - command to manually load a kernelmodule. It's a semi-automatic wrapper around a more primitive command called insmod.

`modprobe understands dependencies, options, and installation and removal procedures. It also checks the version number of the running kernel and selects an appropriate version of the module from within /lib/modules. It consults the file /etc/modprobe.conf to figure out how to handle each individual module.`
`Once a loadable kernel module has been manually inserted into the kernel, it remains active until you explicitly request its removal or reboot the system.`
`You can dynamically generate an /etc/modprobe.conf file that corresponds to all
your currently installed modules by running modprobe -c.`
`You could use modprobe -r snd-usb-audio to remove the audio module loaded above.`

`The path statements tell where a particular module can be found. You can modify or add entries of this type to keep your modules in a nonstandard location.`
`The alias statements map between module names and block-major device numbers, character-major device numbers, filesystems, network devices, and network protocols.`
`The options lines are not dynamically generated but must be manually added by an administrator. They specify options that should be passed to a module when it is`
`loaded. For example, you could use the following line to pass in additional options to the USB sound module:`
`options snd-usb-audio nrpacks=8 async_unlink=1`
`modprobe also understands the statements install and remove . These statements allow commands to be executed when a specific module is inserted into or removed from the running kernel.`
