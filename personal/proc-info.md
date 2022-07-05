# proc-info

> An indepth explanation of the /proc file system.

NOTICE: The creation of sysfs helped clean up the proc file system because much of the hardware information has been moved from proc to sysfs.
Everything that is non-process information should have moved from /proc to /sys but historical inertia has kept a lot of stuff in /proc and /proc/sys.

The /proc file system allows arbitrary file_operations, the /sys file system is more restricted. For more information about differences in security between /sys and /proc see Section 5.

- These directories are extensive. Search for them directly. Ex: tldr {{proc-?-info}}

`/proc/sys     -  proc-sys-info`  
`/proc/net     -  proc-net-info`    
`/proc/tty     -  proc-tty-info`    
`/proc/parport -  proc-parport-info`
`/proc/ide     -  proc-ide-info`    


- 1

`The /proc file system was originally designed to allow easy access to information about processes.`
`Now it is used by every bit of the kernel which has something interesting to report.`

- 2

`The procinfo utility summarizes /proc file system information.`

- 3

`Most of the /proc file system is read-only; however, some files allow kernel variable to be changed. This provides a mechanism to actually tune the kernel without recompiling and rebooting.`

- 4

`The /proc file system is a mounted file system used to trace a process system call, receive signals, and incurred machine faults.`

- STRUCTURE OF THIS FILE:

`1. A list of popular terminal commands that pull their information from /proc.`
`2. A description of all of the files in the /proc directory.`
`3. A description of all of the files in each PID directory. ex /proc/1/{{some_file}}`

#---------------------------------------------------------------------------------------------
#-------------------------------| Commands That Use /proc |-----------------------------------
#---------------------------------------------------------------------------------------------

- These commands use the proc file system to obtain their information:

`ps`
`free`
`top`

#---------------------------------------------------------------------------------------------
#-----------------------------| Descriptions of /proc Files |---------------------------------
#---------------------------------------------------------------------------------------------


- /1

`A directory with information about process number 1. Each process has a directory below /proc with the name being its process identification number. `

- /apm

`Advanced power management info.`

- /bus

`Directory containing bus specific information.`

- /cmdline

`Kernel command line.`

- /cpuinfo

`Information about the processor, such as its type, make, model, and performance.`

- /devices

`List of device drivers configured into the currently running kernel. `

- /dma

`Shows which DMA channels are being used at the moment. `

- /driver

`Various drivers grouped here, currently rtc `

- /execdomains

`Execdomains, related to security.`

- /fb

`Frame Buffer devices.`

- /filesystems

`Filesystems configured/supported into/by the kernel. `

- /fs

`File system parameters, currently nfs/exports.`

- /ide

` This subdirectory contains information about all IDE devices of which the kernel is aware. There is one subdirectory for each IDE controller, the file drivers and a link for each IDE device, pointing to the device directory in the controller-specific subtree. The file drivers contains general information about the drivers used for the IDE devices. More detailed information can be found in the controller-specific subdirectories. These are named ide0, ide1 and so on. Each of these directories contains the files shown here: `

- /interrupts

`Shows which interrupts are in use, and how many of each there have been.  `

- /iomem

`Memory map. `

- /ioports

`Which I/O ports are in use at the moment. `

- /irq

`Masks for irq to cpu affinity.`

- /isapnp

`ISA PnP (Plug&Play) Info.`

- /kcore

`An image of the physical memory of the system. This is exactly the same size as your physical memory, but does not really take up that much memory; it is generated on the fly as programs access it. (Remember: unless you copy it elsewhere, nothing under /proc takes up any disk space at all.) `

- /kmsg

`Messages output by the kernel. These are also routed to syslog. `

- /ksyms

`Symbol table for the kernel. `

- /loadavg

`The `load average' of the system; three meaningless indicators of how much work the system has to do at the moment. `

- /locks

`Kernel locks.`

- /meminfo

`Information about memory usage, both physical and swap. `

- /misc

`Miscellaneous pieces of information. This is for information that has no real place within the rest of the proc filesystem.`

- /modules

`Which kernel modules are loaded at the moment. `

- /mounts

`Mounted filesystems`

- /mtrr

`Information regarding mtrrs. (On Intel P6 family processors (Pentium Pro, Pentium II and later) the Memory Type Range Registers (MTRRs) may be used to control processor access to memory ranges. This is most useful when you have a video (VGA) card on a PCI or AGP bus. Enabling write-combining allows bus write transfers to be combined into a larger transfer before bursting over the PCI/AGP bus. This can increase performance of image write operations 2.5 times or more. The Cyrix 6x86, 6x86MX and M II processors have Address Range Registers (ARRs) which provide a similar functionality to MTRRs. For these, the ARRs are used to emulate the MTRRs. The AMD K6-2 (stepping 8 and above) and K6-3 processors have two MTRRs. These are supported. The AMD Athlon family provide 8 Intel style MTRRs. The Centaur C6 (WinChip) has 8 MCRs, allowing write-combining. These are also supported. The VIA Cyrix III and VIA C3 CPUs offer 8 Intel style MTRRs.) For more details regarding mtrr technology see /usr/src/linux/Documentation/mtrr.txt.`

- /net

`Status information about network protocols. `

- /parport

`The directory /proc/parport contains information about the parallel ports of your system. It has one subdirectory for each port, named after the port number (0,1,2,...). `

- /partitions

`Table of partitions known to the system`

- /pci OR /bus/pci

`Depreciated info of PCI bus.`

- /rtc

`Real time clock`

- /scsi

`If you have a SCSI host adapter in your system, you'll find a subdirectory named after the driver for this adapter in /proc/scsi. You'll also see a list of all recognized SCSI devices in /proc/scsi. The directory named after the driver has one file for each adapter found in the system. These files contain information about the controller, including the used IRQ and the IO address range. The amount of information shown is dependent on the adapter you use.`

- /self

`A symbolic link to the process directory of the program that is looking at /proc. When two processes look at /proc, they get different links. This is mainly a convenience to make it easier for programs to get at their process directory. `

- /slabinfo

`The slabinfo file gives information about memory usage at the slab level. Linux uses slab pools for memory management above page level in version 2.2. Commonly used objects have their own slab pool (such as network buffers, directory cache, and so on).`

- /stat

`Various statistics about the system, such as the number of page faults since the system was booted. `

- /swaps

`Swap space utilization`

- /sys

`This is not only a source of information, it also allows you to change parameters within the kernel without the need for recompilation or even a system reboot. Take care when attempting this as it can both optimize your system and also crash it. It is advisable to read both documentation and source before actually making adjustments. The entries in /proc may change slightly between kernel versions, so if there is any doubt review the kernel documentation in the directory /usr/src/linux/Documentation. Under some circumstances, you may have no alternative but to reboot the machine once an error occurs. To change a value, simply echo the new value into the file. An example is given below in the section on the file system data. Of course, you need to be 'root' to do any of this. You can create your own boot script to perform this every time your system boots.`

- /sysvipc

`Info of SysVIPC Resources (msg, sem, shm) (2.4)`

- /tty

`Information about the available and actually used tty's can be found in the directory /proc/tty. You'll find entries for drivers and line disciplines in this directory.`

- /uptime

`The time the system has been up. `

- /version

`The kernel version. `

- /video

`BTTV info of video resources.`



#---------------------------------------------------------------------------------------------
#-------------------------| Descriptions of /proc/PID File Variables |------------------------
#---------------------------------------------------------------------------------------------

- /proc/PID/cmdline

`Command line arguments.`

- /proc/PID/cpu

`Current and last cpu in which it was executed.`

- /proc/PID/cwd

`Link to the current working directory.`

- /proc/PID/environ

`Values of environment variables.`

- /proc/PID/exe

`Link to the executable of this process.`

- /proc/PID/fd

`Directory, which contains all file descriptors.`

- /proc/PID/maps

`Memory maps to executables and library files.`

- /proc/PID/mem

`Memory held by this process.`

- /proc/PID/root

`Link to the root directory of this process.`

- /proc/PID/stat

`Process status.`

- /proc/PID/statm

`Process memory status information.`

- /proc/PID/status

`Process status in human readable form.`


















 The /proc file system provides access to the state of each active process and thread in the system. The name of each entry in the /proc file system is a decimal number corresponding to the process ID. These entries are subdirectories and the owner of each is determined by the user ID of the process. Access to the process state is provided by additional files contained within each subdirectory. Except where otherwise specified, the term /proc file is meant to refer to a non-directory file within the hierarchy rooted at /proc. The owner of each file is determined by the user ID of the process.

The various /proc directory, file, and field names contain the term lwp (light weight process). This term refers to a kernel thread. The /proc files do not refer to user space pthreads. While the operating system does not use the term lwp to describe its threads, it is used in the /proc file system for compatibility with other UNIX operating systems.

It is known as a "pseudo-filesystem", which means it is not a true filesystem that is consuming storage. The files and directories in /proc are entry points into kernel tables, such as the open file table or the process table. They do not consume space in any filesystem, and should be skipped when backing up the system.













You can change kernel variables in /proc
Kernel variables are numerous. Here are some uses:
ip_forward set to 1 turns on the kernel's network routing capabilities.

Each of the files in the /proc directory contains information about some part of the kernel.

cpuinfo - cpuinfo file is mostly static. It contains the specifications for all installed CPUs.

meminfo - 

The free command and the top command gives a few bits of information from meminfo.

1/cmdline - this is systemd






    procfs entries receive a file_operations struct, which contains function pointers that determine what happens to every file-based system call, e.g. open, read, mmap, etc., and you can take arbitrary actions from those.

    Minimal examples:
        How does /proc/* work? | Super User
        proc_create() example for kernel module | Stack Overflow

    sysfs is more restricted in the following senses:
        you implement only two methods show and store, which Linux uses to implement open, close, read, write and lseek for you. See also: How to attach file operations to sysfs attribute in platform driver? | Stack Overflow
        tightly coupled with kobject
