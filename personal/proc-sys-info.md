# sys-info

> An indepth explanation of the /proc/sys file system.



NOT TO BE CONFUSED WITH the /SYS file system. They serve the same purpose but are entirely different.

The creation of sysfs helped clean up the proc file system because much of the hardware information has been moved from proc to sysfs.
Everything that is non-process information should have moved from /proc to /sys but historical inertia has kept a lot of stuff in /proc and /proc/sys.

     /proc/sys is not only a source of information, it also allows you to change parameters within the kernel without the need for recompilation or even a system reboot. Take care when attempting this as it can both optimize your system and also crash it. It is advisable to read both documentation and source before actually making adjustments. The entries in /proc may change slightly between kernel versions, so if there is any doubt review the kernel documentation in the directory /usr/src/linux/Documentation. Under some circumstances, you may have no alternative but to reboot the machine once an error occurs. To change a value, simply echo the new value into the file. An example is given below in the section on the file system data. Of course, you need to be 'root' to do any of this. You can create your own boot script to perform this every time your system boots.

In order to have the change remain persistent and survive a system reboot, we need to create a .conf file within the /etc/sysctl.d directory. This file will be read by the systemd-sysctl service on boot as well as other sysctl configuration files.

‘Why’, I hear you ask, ‘would anyone even _want_ documentation for them sysctl files? If anybody really needs it, it’s all in the source…’

Well, this documentation is written because some people either don’t know they need to tweak something, or because they don’t have the time or knowledge to read the source code.

Furthermore, the programmers who built sysctl have built it to be actually used, not just for the fun of programming it :-)



#---------------------------------------------------------------------------------------------
#------------------------------| QUICK /PROC/SYS DIRS OVERVIEW |------------------------------
#---------------------------------------------------------------------------------------------

- /abi

`execution domains & personalities`

- /debug
	
`<empty>`

- /dev
	
`device specific information (eg dev/cdrom/info)`

- /fs
	
`specific filesystems filehandle, inode, dentry and quota tuning binfmt_misc <Kernel Support for miscellaneous Binary Formats (binfmt_misc)>`

- /kernel
	
`global kernel info / tuning miscellaneous stuff`

- /net
	
`networking stuff, for documentation look in: <Documentation/networking/>`

- /proc
	
`<empty>`

- /sunrpc
	
`SUN Remote Procedure Call (NFS)`

- /vm
	
`memory management tuning buffer and cache management`

- /user

`Per user per user namespace limits`


#---------------------------------------------------------------------------------------------
#--------------------------------------| ABI DIRECTORY |--------------------------------------
#---------------------------------------------------------------------------------------------

The files in /proc/sys/abi can be used to see and modify ABI-related settings.

- Currently, these files might (depending on your configuration) show up in /proc/sys/kernel:

`vsyscall32 (x86)`

- vsyscall32 (x86)

`Determines whether the kernels maps a vDSO page into 32-bit processes; can be set to 1 to enable, or 0 to disable. Defaults to enabled if CONFIG_COMPAT_VDSO is set, disabled otherwise.`

`This controls the same setting as the vdso32 kernel boot parameter.`


#---------------------------------------------------------------------------------------------
#--------------------------------------| FS DIRECTORY |---------------------------------------
#---------------------------------------------------------------------------------------------

- /proc/sys/fs

`Contains file system data. This subdirectory contains specific file system, file handle, inode, dentry and quota information.`


- Currently, these files are in /proc/sys/fs:

`aio-max-nr`

`aio-nr`

`dentry-state`

`dquot-max`

`dquot-nr`

`file-max`

`file-nr`

`inode-max`

`inode-nr`

`inode-state`

`nr_open`

`overflowuid`

`overflowgid`

`pipe-user-pages-hard`

`pipe-user-pages-soft`

`protected_fifos`

`protected_hardlinks`

`protected_regular`

`protected_symlinks`

`suid_dumpable`

`super-max`

`super-nr`

- aio-max-nr & aio-nr 

`aio-nr is the running total of the number of events specified on the io_setup system call for all currently active aio contexts. If aio-nr reaches aio-max-nr then io_setup will fail with EAGAIN. Note that raising aio-max-nr does not result in the pre-allocation or re-sizing of any kernel data structures.`

- dentry-state

`Status of the directory cache. Since directory entries are dynamically allocated and deallocated, this file indicates the current status. It holds six values, in which the last two are not used and are always zero. The others are listed below:`

`File      Content `
`nr_dentry Almost always zero `
`nr_unused Number of unused cache entries `
`age_limit in seconds after the entry may be reclaimed, when memory is short want_pages internally`
          
`nr_dentry shows the total number of dentries allocated (active + unused). nr_unused shows the number of dentries that are not actively used, but are saved in the LRU list for future reuse.`

`Age_limit is the age in seconds after which dcache entries can be reclaimed when memory is short and want_pages is nonzero, and when shrink_dcache_pages() has been called and the dcache isn’t pruned yet.`

`nr_negative shows the number of unused dentries that are also negative dentries which do not map to any files. Instead, they help in speeding up the rejection of non-existing files provided by the users.`

- dquot-max

`The file dquot-max shows the maximum number of cached disk quota entries.`

- dquot-nr

`shows the number of allocated disk quota entries and the number of free disk quota entries. If the number of available cached disk quotas is very low and you have a large number of simultaneous system users, you might want to raise the limit.`

- file-nr and file-max

`The kernel allocates file handles dynamically, but doesn't free them again. The value in file-max denotes the maximum number of file handles that the Linux kernel will allocate. When you get a lot of error messages about running out of file handles, you might want to raise this limit. The default value is 4096. To change it, just write the new number into the file:`

`# cat /proc/sys/fs/file-max`
`4096`
`# echo 8192 > /proc/sys/fs/file-max`
`# cat /proc/sys/fs/file-max`
`8192`
          
`This method of revision is useful for all customizable parameters of the kernel - simply echo the new value to the corresponding file.`

`The three values in file-nr denote the number of allocated file handles, the number of used file handles, and the maximum number of file handles. When the allocated file handles come close to the maximum, but the number of actually used handles is far behind, you've encountered a peak in your usage of file handles and you don't need to increase the maximum.`

`Attempts to allocate more file descriptors than file-max are reported with printk, look for “VFS: file-max limit <number> reached”.`

`nr_open`

`This denotes the maximum number of file-handles a process can allocate. Default value is 1024*1024 (1048576) which should be enough for most machines. Actual limit depends on RLIMIT_NOFILE resource limit.`

`Linux 2.6 always reports 0 as the number of free file handles – this is not an error, it just means that the number of allocated file handles exactly matches the number of used file handles.`

- inode-state, inode-nr and inode-max

`As with file handles, the kernel allocates the inode structures dynamically, but can't free them yet.`

`The value in inode-max denotes the maximum number of inode handlers. This value should be 3 to 4 times larger than the value in file-max, since stdin, stdout, and network sockets also need an inode struct to handle them. If you regularly run out of inodes, you should increase this value.`

`The file inode-nr contains the first two items from inode-state, so we'll skip to that file...`

`inode-state contains three actual numbers and four dummy values. The numbers are nr_inodes, nr_free_inodes, and preshrink (in order of appearance).`

`nr_inodes denotes the number of inodes the system has allocated. This can be slightly more than inode-max because Linux allocates them one pageful at a time. `

`nr_free_inodes represents the number of free inodes and preshrink is nonzero when nr_inodes is greater than inode-max and the system needs to prune the inode list instead of allocating more.`

- overflowgid & overflowuid

`Some filesystems only support 16-bit UIDs and GIDs, although in Linux UIDs and GIDs are 32 bits. When one of these filesystems is mounted with writes enabled, any UID or GID that would exceed 65535 is translated to a fixed value before being written to disk.`

`These sysctls allow you to change the value of the fixed UID and GID. The default is 65534.`

- pipe-user-pages-hard

`Maximum total number of pages a non-privileged user may allocate for pipes. Once this limit is reached, no new pipes may be allocated until usage goes below the limit again. When set to 0, no limit is applied, which is the default setting.`

- pipe-user-pages-soft

`Maximum total number of pages a non-privileged user may allocate for pipes before the pipe size gets limited to a single page. Once this limit is reached, new pipes will be limited to a single page in size for this user in order to limit total memory usage, and trying to increase them using fcntl() will be denied until usage goes below the limit again. The default value allows to allocate up to 1024 pipes at their default size. When set to 0, no limit is applied.`

- protected_fifos

`The intent of this protection is to avoid unintentional writes to an attacker-controlled FIFO, where a program expected to create a regular file.`

`When set to “0”, writing to FIFOs is unrestricted.`

`When set to “1” don’t allow O_CREAT open on FIFOs that we don’t own in world writable sticky directories, unless they are owned by the owner of the directory.`

`When set to “2” it also applies to group writable sticky directories.`

`This protection is based on the restrictions in Openwall.`

- protected_hardlinks

`A long-standing class of security issues is the hardlink-based time-of-check-time-of-use race, most commonly seen in world-writable directories like /tmp. The common method of exploitation of this flaw is to cross privilege boundaries when following a given hardlink (i.e. a root process follows a hardlink created by another user). Additionally, on systems without separated partitions, this stops unauthorized users from “pinning” vulnerable setuid/setgid files against being upgraded by the administrator, or linking to special files.`

`When set to “0”, hardlink creation behavior is unrestricted.`

`When set to “1” hardlinks cannot be created by users if they do not already own the source file, or do not have read/write access to it.`

`This protection is based on the restrictions in Openwall and grsecurity.`

- protected_regular

`This protection is similar to protected_fifos, but it avoids writes to an attacker-controlled regular file, where a program expected to create one.`

`When set to “0”, writing to regular files is unrestricted.`

`When set to “1” don’t allow O_CREAT open on regular files that we don’t own in world writable sticky directories, unless they are owned by the owner of the directory.`

`When set to “2” it also applies to group writable sticky directories.`

- protected_symlinks

`A long-standing class of security issues is the symlink-based time-of-check-time-of-use race, most commonly seen in world-writable directories like /tmp. The common method of exploitation of this flaw is to cross privilege boundaries when following a given symlink (i.e. a root process follows a symlink belonging to another user). For a likely incomplete list of hundreds of examples across the years, please see: https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=/tmp`

`When set to “0”, symlink following behavior is unrestricted.`

`When set to “1” symlinks are permitted to be followed only when outside a sticky world-writable directory, or when the uid of the symlink and follower match, or when the directory owner matches the symlink’s owner.`

`This protection is based on the restrictions in Openwall and grsecurity.`

- suid_dumpable

`This value can be used to query and set the core dump mode for setuid or otherwise protected/tainted binaries. The modes are:`

`0 - (default) - traditional behaviour. Any process which has changed privilege levels or is execute only will not be dumped.`

`1 - (debug) - all processes dump core when possible. The core dump is owned by the current user and no security is applied. This is intended for system debugging situations only. Ptrace is unchecked. This is insecure as it allows regular users to examine the memory contents of privileged processes.`

`2 - (suidsafe) - any binary which normally would not be dumped is dumped anyway, but only if the “core_pattern” kernel sysctl is set to either a pipe handler or a fully qualified path. (For more details on this limitation, see CVE-2006-2451.) This mode is appropriate when administrators are attempting to debug problems in a normal environment, and either have a core dump pipe handler that knows to treat privileged core dumps with care, or specific directory defined for catching core dumps. If a core dump happens without a pipe handler or fully qualified path, a message will be emitted to syslog warning about the lack of a correct setting.`

- super-nr and super-max

`Again, super block structures are allocated by the kernel, but not freed. The file super-max contains the maximum number of super block handlers, where super-nr shows the number of currently allocated ones. Every mounted file system needs a super block, so if you plan to mount lots of file systems, you may want to increase these numbers. `

- mount-max

`This denotes the maximum number of mounts that may exist in a mount namespace.`

- fs/binfmt_misc

`This handles the kernel support for miscellaneous binary formats. binfmt_misc provides the ability to register additional binary formats to the kernel without compiling an additional module/kernel. Therefore, binfmt_misc needs to know magic numbers at the beginning or the filename extension of the binary. It works by maintaining a linked list of structs that contain a description of a binary format, including a magic with size (or the filename extension), offset and mask, and the interpreter name. On request it invokes the given interpreter with the original program as argument, as binfmt_java and binfmt_em86 and binfmt_mz do. Since binfmt_misc does not define any default binary-formats, you have to register an additional binary-format. There are two general files in binfmt_misc and one file per registered format. The two general files are register and status. To register a new binary format you have to issue the command echo :name:type:offset:magic:mask:interpreter: > /proc/sys/fs/binfmt_misc/register with appropriate name (the name for the /proc-dir entry), offset (defaults to 0, if omitted), magic, mask (which can be omitted, defaults to all 0xff) and last but not least, the interpreter that is to be invoked (for example and testing /bin/echo). Type can be M for usual magic matching or E for filename extension matching (give extension in place of magic). If you do a cat on the file /proc/sys/fs/binfmt_misc/status, you will get the current status (enabled/disabled) of binfmt_misc. Change the status by echoing 0 (disables) or 1 (enables) or -1 (caution: this clears all previously registered binary formats) to status. For example echo 0 > status to disable binfmt_misc (temporarily). Each registered handler has an entry in /proc/sys/fs/binfmt_misc. These files perform the same function as status, but their scope is limited to the actual binary format. By 'cating' this file, you also receive all related information about the interpreter/magic of the binfmt. An example of the usage of binfmt_misc (emulate binfmt_java) follows: `

`cd /proc/sys/fs/binfmt_misc `
`echo ':Java:M::\xca\xfe\xba\xbe::/usr/local/java/bin/javawrapper:' `
`> register `
`echo ':HTML:E::html::/usr/local/java/bin/appletviewer:'`
`> register `
`echo ':Applet:M::<!--applet::/usr/local/java/bin/appletviewer:' >`
`register `
`echo ':DEXE:M::\x0eDEX::/usr/bin/dosexec:' < register`
          

`These four lines add support for Java executables and Java applets (like binfmt_java, additionally recognizing the .html extension with no need to put <!--applet> to every applet file). You have to install the JDK and the shell-script /usr/local/java/bin/javawrapper too. It works around the brokenness of the Java filename handling. To add a Java binary, just create a link to the class-file somewhere in the path.`

- A Second Explanation of fs/binfmt_misc

`This Kernel feature allows you to invoke almost (for restrictions see below) every program by simply typing its name in the shell. This includes for example compiled Java(TM), Python or Emacs programs.`

`To achieve this you must tell binfmt_misc which interpreter has to be invoked with which binary. Binfmt_misc recognises the binary-type by matching some bytes at the beginning of the file with a magic byte sequence (masking out specified bits) you have supplied. Binfmt_misc can also recognise a filename extension aka .com or .exe.`

`First you must mount binfmt_misc:`

`mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc`

`To actually register a new binary type, you have to set up a string looking like :name:type:offset:magic:mask:interpreter:flags (where you can choose the : upon your needs) and echo it to /proc/sys/fs/binfmt_misc/register.`

`Here is what the fields mean:`

`name`

`    is an identifier string. A new /proc file will be created with this name below /proc/sys/fs/binfmt_misc; cannot contain slashes / for obvious reasons.`

`type`

`    is the type of recognition. Give M for magic and E for extension.`

`offset`

`    is the offset of the magic/mask in the file, counted in bytes. This defaults to 0 if you omit it (i.e. you write :name:type::magic...). Ignored when using filename extension matching.`

`magic`

`    is the byte sequence binfmt_misc is matching for. The magic string may contain hex-encoded characters like \x0a or \xA4. Note that you must escape any NUL bytes; parsing halts at the first one. In a shell environment you might have to write \\x0a to prevent the shell from eating your \. If you chose filename extension matching, this is the extension to be recognised (without the ., the \x0a specials are not allowed). Extension matching is case sensitive, and slashes / are not allowed!`

`mask`

`    is an (optional, defaults to all 0xff) mask. You can mask out some bits from matching by supplying a string like magic and as long as magic. The mask is anded with the byte sequence of the file. Note that you must escape any NUL bytes; parsing halts at the first one. Ignored when using filename extension matching.`

`interpreter`

`    is the program that should be invoked with the binary as first argument (specify the full path)`


`flags`

`    is an optional field that controls several aspects of the invocation of the interpreter. It is a string of capital letters, each controls a certain aspect. The following flags are supported:`

	`P - preserve-argv[0]`
`            Legacy behavior of binfmt_misc is to overwrite the original argv[0] with the full path to the binary. When this flag is included, binfmt_misc will add an argument to the argument vector for this purpose, thus preserving the original argv[0]. e.g. If your interp is set to /bin/foo and you run blah (which is in /usr/local/bin), then the kernel will execute /bin/foo with argv[] set to ["/bin/foo", "/usr/local/bin/blah", "blah"]. The interp has to be aware of this so it can execute /usr/local/bin/blah with argv[] set to ["blah"].`

	`O - open-binary`
`            Legacy behavior of binfmt_misc is to pass the full path of the binary to the interpreter as an argument. When this flag is included, binfmt_misc will open the file for reading and pass its descriptor as an argument, instead of the full path, thus allowing the interpreter to execute non-readable binaries. This feature should be used with care - the interpreter has to be trusted not to emit the contents of the non-readable binary.`

	`C - credentials`
`            Currently, the behavior of binfmt_misc is to calculate the credentials and security token of the new process according to the interpreter. When this flag is included, these attributes are calculated according to the binary. It also implies the O flag. This feature should be used with care as the interpreter will run with root permissions when a setuid binary owned by root is run with binfmt_misc.`
        
	`F - fix binary`
`            The usual behaviour of binfmt_misc is to spawn the binary lazily when the misc format file is invoked. However, this doesn’t work very well in the face of mount namespaces and changeroots, so the F mode opens the binary as soon as the emulation is installed and uses the opened image to spawn the emulator, meaning it is always available once installed, regardless of how the environment changes.`

`There are some restrictions:`

`        the whole register string may not exceed 1920 characters`

`        the magic must reside in the first 128 bytes of the file, i.e. offset+size(magic) has to be less than 128`

`        the interpreter string may not exceed 127 characters`

`To use binfmt_misc you have to mount it first. You can mount it with mount -t binfmt_misc none /proc/sys/fs/binfmt_misc command, or you can add a line none  /proc/sys/fs/binfmt_misc binfmt_misc defaults 0 0 to your /etc/fstab so it auto mounts on boot.`

`You may want to add the binary formats in one of your /etc/rc scripts during boot-up. Read the manual of your init program to figure out how to do this right.`

`Think about the order of adding entries! Later added entries are matched first!`

`A few examples (assumed you are in /proc/sys/fs/binfmt_misc):`

`	enable support for em86 (like binfmt_em86, for Alpha AXP only):`

`echo ':i386:M::\x7fELF\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03:\xff\xff\xff\xff\xff\xfe\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfb\xff\xff:/bin/em86:' > register`
`echo ':i486:M::\x7fELF\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x06:\xff\xff\xff\xff\xff\xfe\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfb\xff\xff:/bin/em86:' > register`

`	enable support for packed DOS applications (pre-configured dosemu hdimages):`

`echo ':DEXE:M::\x0eDEX::/usr/bin/dosexec:' > register`

`	enable support for Windows executables using wine:`

`echo ':DOSWin:M::MZ::/usr/local/bin/wine:' > register`

`For java support see Java(tm) Binary Kernel Support for Linux v1.03`

`You can enable/disable binfmt_misc or one binary type by echoing 0 (to disable) or 1 (to enable) to /proc/sys/fs/binfmt_misc/status or /proc/.../the_name. Catting the file tells you the current status of binfmt_misc/the_entry.`

`You can remove one entry or all entries by echoing -1 to /proc/.../the_name or /proc/sys/fs/binfmt_misc/status.`

`Hints`

`If you want to pass special arguments to your interpreter, you can write a wrapper script for it. See Java(tm) Binary Kernel Support for Linux v1.03 for an example.`

`Your interpreter should NOT look in the PATH for the filename; the kernel passes it the full filename (or the file descriptor) to use. Using $PATH can cause unexpected behaviour and can be a security hazard.`

- /fs/mqueue - POSIX message queues filesystem

`The “mqueue” filesystem provides the necessary kernel features to enable the creation of a user space library that implements the POSIX message queues API (as noted by the MSG tag in the POSIX 1003.1-2001 version of the System Interfaces specification.)`

`The “mqueue” filesystem contains values for determining/setting the amount of resources used by the file system.`

`/proc/sys/fs/mqueue/queues_max is a read/write file for setting/getting the maximum number of message queues allowed on the system.`

`/proc/sys/fs/mqueue/msg_max is a read/write file for setting/getting the maximum number of messages in a queue value. In fact it is the limiting value for another (user) limit which is set in mq_open invocation. This attribute of a queue must be less or equal then msg_max.`

`/proc/sys/fs/mqueue/msgsize_max is a read/write file for setting/getting the maximum message size value (it is every message queue’s attribute set during its creation).`

`/proc/sys/fs/mqueue/msg_default is a read/write file for setting/getting the default number of messages in a queue value if attr parameter of mq_open(2) is NULL. If it exceed msg_max, the default value is initialized msg_max.`

`/proc/sys/fs/mqueue/msgsize_default is a read/write file for setting/getting the default message size value if attr parameter of mq_open(2) is NULL. If it exceed msgsize_max, the default value is initialized msgsize_max.`

- /fs/epoll - Configuration options for the epoll interface

`This directory contains configuration options for the epoll(7) interface.`

`max_user_watches`

`Every epoll file descriptor can store a number of files to be monitored for event readiness. Each one of these monitored files constitutes a “watch”. This configuration option sets the maximum number of “watches” that are allowed for each user. Each “watch” costs roughly 90 bytes on a 32bit kernel, and roughly 160 bytes on a 64bit one. The current default value for max_user_watches is the 1/25 (4%) of the available low memory, divided for the “watch” cost in bytes.`

#---------------------------------------------------------------------------------------------
#------------------------------------| KERNEL DIRECTORY |-------------------------------------
#---------------------------------------------------------------------------------------------

- /proc/sys/kernel

`The files in this directory can be used to tune and monitor miscellaneous and general things in the operation of the Linux kernel.`
`This directory reflects general kernel behaviors and the contents will be dependent upon your configuration. Here you'll find the most important files, along with descriptions of what they mean and how to use them.`

Currently, these files might (depending on your configuration) show up in /proc/sys/kernel:

    acct

    acpi_video_flags

    auto_msgmni

    bootloader_type (x86 only)

    bootloader_version (x86 only)

    bpf_stats_enabled

    cad_pid

    cap_last_cap

    core_pattern

    core_pipe_limit

    core_uses_pid

    ctrl-alt-del

    dmesg_restrict

    domainname & hostname

    firmware_config

    ftrace_dump_on_oops

    ftrace_enabled, stack_tracer_enabled

    hardlockup_all_cpu_backtrace

    hardlockup_panic

    hotplug

    hung_task_all_cpu_backtrace

    hung_task_panic

    hung_task_check_count

    hung_task_timeout_secs

    hung_task_check_interval_secs

    hung_task_warnings

    hyperv_record_panic_msg

    ignore-unaligned-usertrap

    kexec_load_disabled

    kptr_restrict

    modprobe

    modules_disabled

    msgmax, msgmnb, and msgmni

    msg_next_id, sem_next_id, and shm_next_id (System V IPC)

    ngroups_max

    nmi_watchdog

    numa_balancing

    numa_balancing_scan_period_min_ms, numa_balancing_scan_delay_ms, numa_balancing_scan_period_max_ms, numa_balancing_scan_size_mb

`    oops_all_cpu_backtrace`

`    osrelease, ostype & version`

`    overflowgid & overflowuid`

`    panic`

`    panic_on_io_nmi`

`    panic_on_oops`

`    panic_on_stackoverflow`

`    panic_on_unrecovered_nmi`

`    panic_on_warn`

`    panic_print`

`    panic_on_rcu_stall`

`    perf_cpu_time_max_percent`

`    perf_event_paranoid`

`    perf_event_max_stack`

`    perf_event_mlock_kb`

`    perf_event_max_contexts_per_stack`

`    pid_max`

`    ns_last_pid`

`    powersave-nap (PPC only)`

`    printk`

`    printk_delay`

`    printk_ratelimit`

`    printk_ratelimit_burst`

`    printk_devkmsg`

`    pty`

`    random`

`    randomize_va_space`

`    real-root-dev`

`    reboot-cmd (SPARC only)`

`    sched_energy_aware`

`    task_delayacct`

`    sched_schedstats`

`    sched_util_clamp_min`

`    sched_util_clamp_max`

`    sched_util_clamp_min_rt_default`

`    seccomp`

`    sg-big-buff`

`    shmall`

`    shmmax`

`    shmmni`

`    shm_rmid_forced`

`    sysctl_writes_strict`

`    softlockup_all_cpu_backtrace`

`    softlockup_panic`

`    soft_watchdog`

`    stack_erasing`

`    stop-a (SPARC only)`

`    sysrq`

`    tainted`

`    threads-max`

`    traceoff_on_warning`

`    tracepoint_printk`

`    unaligned-dump-stack (ia64)`

`    unaligned-trap`

`    unknown_nmi_panic`

`    unprivileged_bpf_disabled`

`    watchdog`

`    watchdog_cpumask`

`    watchdog_thresh`


- /kernel/acct

`highwater lowwater frequency`
`If BSD-style process accounting is enabled these values control its behaviour. If free space on filesystem where the log lives goes below lowwater``% accounting suspends. If free space gets above ``highwater``% accounting resumes. ``frequency determines how often do we check the amount of free space (value is in seconds). Default:`

`4 2 30`

`That is, suspend accounting if free space drops below 2%; resume it if it increases to at least 4%; consider information about amount of free space valid for 30 seconds.`

-/kernel/acpi_video_flags

`This allows the video resume mode to be set, in a similar fashion to the acpi_sleep kernel parameter, by combining the following values:`

`1 - s3_bios`

`2 - s3_mode`

`4 - s3_beep`

`During S3 resume, hardware needs to be reinitialized. For most devices, this is easy, and kernel driver knows how to do it. Unfortunately there’s one exception: video card. Those are usually initialized by BIOS, and kernel does not have enough information to boot video card. (Kernel usually does not even contain video card driver – vesafb and vgacon are widely used).`

If you run into problems with S3 resume see Video issues with S3 resume. https://www.kernel.org/doc/html/latest/power/video.html`

- /kernel/auto_msgmni

`This variable has no effect and may be removed in future kernel releases. Reading it always returns 0. Up to Linux 3.17, it enabled/disabled automatic recomputing of msgmni upon memory add/remove or upon IPC namespace creation/removal. Echoing “1” into this file enabled msgmni automatic recomputing. Echoing “0” turned it off. The default value was 1.`

- /kernel/bootloader_type (x86 only)

`This gives the bootloader type number as indicated by the bootloader, shifted left by 4, and OR’d with the low four bits of the bootloader version. The reason for this encoding is that this used to match the type_of_loader field in the kernel header; the encoding is kept for backwards compatibility. That is, if the full bootloader type number is 0x15 and the full version number is 0x234, this file will contain the value 340 = 0x154.`

`See the type_of_loader and ext_loader_type fields in The Linux/x86 Boot Protocol for additional information. The following link has also extensive information on the Linux x86 boot process.
`https://www.kernel.org/doc/html/latest/x86/boot.html`

- /kernel/bootloader_version (x86 only)

`The complete bootloader version number. In the example above, this file will contain the value 564 = 0x234.`

`See the type_of_loader and ext_loader_ver fields in The Linux/x86 Boot Protocol for additional information.`
`https://www.kernel.org/doc/html/latest/x86/boot.html`

- /kernel/bpf_stats_enabled

`Controls whether the kernel should collect statistics on BPF programs (total time spent running, number of times run…). Enabling statistics causes a slight reduction in performance on each program run. The statistics can be seen using bpftool.`

`0 - Don’t collect statistics (default).`

`1 - Collect statistics.`

- /kernel/cad_pid

`This is the pid which will be signalled on reboot (notably, by Ctrl-Alt-Delete). Writing a value to this file which doesn’t correspond to a running process will result in -ESRCH.`
`See also ctrl-alt-del.`

- /kernel/cap_last_cap

`Highest valid capability of the running kernel. Exports CAP_LAST_CAP from the kernel.`

- /kernel/console_loglevel

`Messages with a higher priority than this will be printed to the console.`

- /kernel/minimum_console_loglevel

`Minimum (highest) value to which the console_loglevel can be set.`

- /kernel/default_console_loglevel

`Default value for console_loglevel.`

- /kernel/core_pattern

`core_pattern is used to specify a core dumpfile pattern name.`

`    max length 127 characters; default value is “core”`

`    core_pattern is used as a pattern template for the output filename; certain string patterns (beginning with ‘%’) are substituted with their actual values.`

`    backward compatibility with core_uses_pid:`

`        If core_pattern does not include “%p” (default does not) and core_uses_pid is set, then .PID will be appended to the filename.`

`    corename format specifiers`

`%<NUL> - ‘%’ is dropped`

`%% - output one ‘%’`

`%p - pid`

`%P - global pid (init PID namespace)`

`%i - tid`

`%I - global tid (init PID namespace)`

`%u - uid (in initial user namespace)`

`%g - gid (in initial user namespace)`

`%d - dump mode, matches PR_SET_DUMPABLE and /proc/sys/fs/suid_dumpable`

`%s - signal number`

`%t - UNIX time of dump`

`%h - hostname`

`%e - executable filename (may be shortened, could be changed by prctl etc)`

`%f - executable filename`

`%E - executable path`

`%c - maximum size of core file by resource limit RLIMIT_CORE`

`%<OTHER> - both are dropped`

`If the first character of the pattern is a ‘|’, the kernel will treat the rest of the pattern as a command to run. The core dump will be written to the standard input of that program instead of to a file.`

- /kernel/core_pipe_limit

`This sysctl is only applicable when core_pattern is configured to pipe core files to a user space helper (when the first character of core_pattern is a ‘|’, see above). When collecting cores via a pipe to an application, it is occasionally useful for the collecting application to gather data about the crashing process from its /proc/pid directory. In order to do this safely, the kernel must wait for the collecting process to exit, so as not to remove the crashing processes proc files prematurely. This in turn creates the possibility that a misbehaving userspace collecting process can block the reaping of a crashed process simply by never exiting. This sysctl defends against that. It defines how many concurrent crashing processes may be piped to user space applications in parallel. If this value is exceeded, then those crashing processes above that value are noted via the kernel log and their cores are skipped. 0 is a special value, indicating that unlimited processes may be captured in parallel, but that no waiting will take place (i.e. the collecting process is not guaranteed access to /proc/<crashing pid>/). This value defaults to 0.`

- /kernel/core_uses_pid

`The default coredump filename is “core”. By setting core_uses_pid to 1, the coredump filename becomes core.PID. If core_pattern does not include “%p” (default does not) and core_uses_pid is set, then .PID will be appended to the filename.`

- /kernel/ctrl-alt-del

`When the value in this file is 0, ctrl-alt-del is trapped and sent to the init program to handle a graceful restart. However, when the value is greater that zero, Linux's reaction to this key combination will be an immediate reboot, without syncing its dirty buffers. `
`NOTE: that when a program (like dosemu) has the keyboard in raw mode, the ctrl-alt-del is intercepted by the program before it ever reaches the kernel tty layer, and it is up to the program to decide what to do with it.`

- /kernel/default_message_level

`Messages without an explicit priority will be printed with this priority.`

- /kernel/dmesg_restrict

`This toggle indicates whether unprivileged users are prevented from using dmesg(8) to view messages from the kernel’s log buffer. When dmesg_restrict is set to 0 there are no restrictions. When dmesg_restrict is set to 1, users must have CAP_SYSLOG to use dmesg(8).`

`The kernel config option CONFIG_SECURITY_DMESG_RESTRICT sets the default value of dmesg_restrict.`

- /kernel/domainname, /kernel/hostname

`These files can be used to set the NIS/YP domainname and the hostname of your box in exactly the same way as the commands domainname and hostname, i.e.:`
`# echo "darkstar" > /proc/sys/kernel/hostname`
`# echo "mydomain" > /proc/sys/kernel/domainname`
`has the same effect as:`
`# hostname "darkstar"`
`# domainname "mydomain"`
`Note, however, that the classic darkstar.frop.org has the hostname “darkstar” and DNS (Internet Domain Name Server) domainname “frop.org”, not to be confused with the NIS (Network Information Service) or YP (Yellow Pages) domainname. These two domain names are in general different. For a detailed discussion see the hostname(1) man page.`

` /proc/sys/kernel/osrelease, /proc/sys/kernel/ostype, /proc/sys/kernel/version The names make it pretty obvio0us what these fields contain: # cat /proc/sys/kernel/osrelease 2.2.12 # cat /proc/sys/kernel/ostype Linux # cat /proc/sys/kernel/version #4 Fri Oct 1 12:41:14 PDT 1999 The files osrelease and ostype should be clear enough. Version needs a little more clarification. The #4 means that this is the 4th kernel built from this source base and the date after it indicates the time the kernel was built. The only way to tune these values is to rebuild the kernel.`

- /kernel/firmware_config

`See Fallback mechanisms.`
`https://www.kernel.org/doc/html/latest/driver-api/firmware/fallback-mechanisms.html`

`The entries in this directory allow the firmware loader helper fallback to be controlled:`

`    force_sysfs_fallback, when set to 1, forces the use of the fallback;`

`    ignore_sysfs_fallback, when set to 1, ignores any fallback.`

- /kernel/ftrace_dump_on_oops

`Determines whether ftrace_dump() should be called on an oops (or kernel panic). This will output the contents of the ftrace buffers to the console. This is very useful for capturing traces that lead to crashes and outputting them to a serial console.`

`0 - Disabled (default).`

`1 - Dump buffers of all CPUs.`

`2 - Dump the buffer of the CPU that triggered the oops.`

- /kernel/ftrace_enabled OR /kernel/stack_tracer_enabled

`See ftrace - Function Tracer.`

- /kernel/hardlockup_all_cpu_backtrace

`This value controls the hard lockup detector behavior when a hard lockup condition is detected as to whether or not to gather further debug information. If enabled, arch-specific all-CPU stack dumping will be initiated.`

`0 - Do nothing. This is the default behavior.`

`1 - On detection capture more debug information.`

- /kernel/hardlockup_panic

`This parameter can be used to control whether the kernel panics when a hard lockup is detected.`

`0 - Don’t panic on hard lockup.`

`1 - Panic on hard lockup.`

`See Softlockup detector and hardlockup detector (aka nmi_watchdog) for more information. This can also be set using the nmi_watchdog kernel parameter.`
`https://www.kernel.org/doc/html/latest/admin-guide/lockup-watchdogs.html`

- /kernel/hotplug

`Path for the hotplug policy agent. Default value is CONFIG_UEVENT_HELPER_PATH, which in turn defaults to the empty string.`

`This file only exists when CONFIG_UEVENT_HELPER is enabled. Most modern systems rely exclusively on the netlink-based uevent source and don’t need this.`


- /kernel/hung_task_all_cpu_backtrace

`If this option is set, the kernel will send an NMI to all CPUs to dump their backtraces when a hung task is detected. This file shows up if CONFIG_DETECT_HUNG_TASK and CONFIG_SMP are enabled.`

`0: Won’t show all CPUs backtraces when a hung task is detected. This is the default behavior.`

`1: Will non-maskably interrupt all CPUs and dump their backtraces when a hung task is detected.`

- /kernel/hung_task_panic

`Controls the kernel’s behavior when a hung task is detected. This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.`

`0 - Continue operation. This is the default behavior.`

`1 - Panic immediately.`

- /kernel/hung_task_check_count

`The upper bound on the number of tasks that are checked. This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.`

- /kernel/hunt_task_timeout_sec

`When a task in D state did not get scheduled for more than this value report a warning. This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.`

`0 means infinite timeout, no checking is done.`

`Possible values to set are in range {0:LONG_MAX/HZ}.`

- /kernel/hunt_task_check_interval_secs

`Hung task check interval. If hung task checking is enabled (see hung_task_timeout_secs), the check is done every hung_task_check_interval_secs seconds. This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.`

`0 (default) means use hung_task_timeout_secs as checking interval.`

`Possible values to set are in range {0:LONG_MAX/HZ}.`

- /kernel/hung_task_warnings

`The maximum number of warnings to report. During a check interval if a hung task is detected, this value is decreased by 1. When this value reaches 0, no more warnings will be reported. This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.`

`-1: report an infinite number of warnings.`

- /kernel/hyperv_record_panic_msg

`Controls whether the panic kmsg data should be reported to Hyper-V.`

`0 Do not report panic kmsg data.`

`1 Report the panic kmsg data. This is the default behavior.`

- /kernel/ignore-unaligned-usertrap

`On architectures where unaligned accesses cause traps, and where this feature is supported (CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN; currently, arc and ia64), controls whether all unaligned traps are logged.`

`0 Log all unaligned accesses.`

`1 Only warn the first time a process traps. This is the default setting.`

`See also unaligned-trap and unaligned-dump-stack. On ia64, this allows system administrators to override the IA64_THREAD_UAC_NOPRINT prctl and avoid logs being flooded.`

- /kernel/kexec_load_disabled

`A toggle indicating if the kexec_load syscall has been disabled. This value defaults to 0 (false: kexec_load enabled), but can be set to 1 (true: kexec_load disabled). Once true, kexec can no longer be used, and the toggle cannot be set back to false. This allows a kexec image to be loaded before disabling the syscall, allowing a system to set up (and later use) an image without it being altered. Generally used together with the modules_disabled sysctl.`

- /kernel/kptr_restrict

`This toggle indicates whether restrictions are placed on exposing kernel addresses via /proc and other interfaces.`

`When kptr_restrict is set to 0 (the default) the address is hashed before printing. (This is the equivalent to %p.)`

`When kptr_restrict is set to 1, kernel pointers printed using the %pK format specifier will be replaced with 0s unless the user has CAP_SYSLOG and effective user and group ids are equal to the real ids. This is because %pK checks are done at read() time rather than open() time, so if permissions are elevated between the open() and the read() (e.g via a setuid binary) then %pK will not leak kernel pointers to unprivileged users. Note, this is a temporary solution only. The correct long-term solution is to do the permission checks at open() time. Consider removing world read permissions from files that use %pK, and using dmesg_restrict to protect against uses of %pK in dmesg(8) if leaking kernel pointer values to unprivileged users is a concern.`

`When kptr_restrict is set to 2, kernel pointers printed using %pK will be replaced with 0s regardless of privileges.`

- /kernel/modprobe

`The location where the modprobe binary is located. The kernel uses this program to load modules on demand.`
`The full path to the usermode helper for autoloading kernel modules, by default CONFIG_MODPROBE_PATH, which in turn defaults to “/sbin/modprobe”. This binary is executed when the kernel requests a module. For example, if userspace passes an unknown filesystem type to mount(), then the kernel will automatically request the corresponding filesystem module by executing this usermode helper. This usermode helper should insert the needed module into the kernel.`

`This sysctl only affects module autoloading. It has no effect on the ability to explicitly insert modules.`

`This sysctl can be used to debug module loading requests:`

`echo '#! /bin/sh' > /tmp/modprobe`
`echo 'echo "$@" >> /tmp/modprobe.log' >> /tmp/modprobe`
`echo 'exec /sbin/modprobe "$@"' >> /tmp/modprobe`
`chmod a+x /tmp/modprobe`
`echo /tmp/modprobe > /proc/sys/kernel/modprobe`

`Alternatively, if this sysctl is set to the empty string, then module autoloading is completely disabled. The kernel will not try to execute a usermode helper at all, nor will it call the kernel_module_request LSM hook.`

`If CONFIG_STATIC_USERMODEHELPER=y is set in the kernel configuration, then the configured static usermode helper overrides this sysctl, except that the empty string is still accepted to completely disable module autoloading as described above.`

- /kernel/modules_disabled

`A toggle value indicating if modules are allowed to be loaded in an otherwise modular kernel. This toggle defaults to off (0), but can be set true (1). Once true, modules can be neither loaded nor unloaded, and the toggle cannot be set back to false. Generally used with the kexec_load_disabled toggle.`

- /kernel/msgmax, /kernel/msgmnb, and /kernel/msgmni

`msgmax is the maximum size of an IPC message, in bytes. 8192 by default (MSGMAX).`

`msgmnb is the maximum size of an IPC queue, in bytes. 16384 by default (MSGMNB).`

`msgmni is the maximum number of IPC queues. 32000 by default (MSGMNI).`

- /kernel/msg_next_id, /kernel/sem_next_id, and /kernel/shm_next_id (System V IPC)

`These three toggles allows to specify desired id for next allocated IPC object: message, semaphore or shared memory respectively.`

`By default they are equal to -1, which means generic allocation logic. Possible values to set are in range {0:INT_MAX}.`

`Notes:`

`        kernel doesn’t guarantee, that new object will have desired id. So, it’s up to userspace, how to handle an object with “wrong” id.`

`        Toggle with non-default value will be set back to -1 by kernel after successful IPC object allocation. If an IPC object allocation syscall fails, it is undefined if the value remains unmodified or is reset to -1.`

- /kernel/ngroups_max

`Maximum number of supplementary groups, _i.e._ the maximum size which setgroups will accept. Exports NGROUPS_MAX from the kernel.`

- /kernel/nmi_watchdog

`This parameter can be used to control the NMI watchdog (i.e. the hard lockup detector) on x86 systems.`

`0 Disable the hard lockup detector.`

`1 Enable the hard lockup detector.`

`The hard lockup detector monitors each CPU for its ability to respond to timer interrupts. The mechanism utilizes CPU performance counter registers that are programmed to generate Non-Maskable Interrupts (NMIs) periodically while a CPU is busy. Hence, the alternative name ‘NMI watchdog’.`

`The NMI watchdog is disabled by default if the kernel is running as a guest in a KVM virtual machine. This default can be overridden by adding:`

`nmi_watchdog=1`

`to the guest kernel command line (see The kernel’s command-line parameters).`

- /kernel/numa_balancing

`Enables/disables automatic page fault based NUMA memory balancing. Memory is moved automatically to nodes that access it often.`

`Enables/disables automatic NUMA memory balancing. On NUMA machines, there is a performance penalty if remote memory is accessed by a CPU. When this feature is enabled the kernel samples what task thread is accessing memory by periodically unmapping pages and later trapping a page fault. At the time of the page fault, it is determined if the data being accessed should be migrated to a local memory node.`

`The unmapping of pages and trapping faults incur additional overhead that ideally is offset by improved memory locality but there is no universal guarantee. If the target workload is already bound to NUMA nodes then this feature should be disabled. Otherwise, if the system overhead from the feature is too high then the rate the kernel samples for NUMA hinting faults may be controlled by the numa_balancing_scan_period_min_ms, numa_balancing_scan_delay_ms, numa_balancing_scan_period_max_ms, numa_balancing_scan_size_mb, and numa_balancing_settle_count sysctls.`

- /kernel/numa_balancing_scan_period_min_ms, /kernel/numa_balancing_scan_delay_ms, /kernel/numa_balancing_scan_period_max_ms, /kernel/numa_balancing_scan_size_mb

`Automatic NUMA balancing scans tasks address space and unmaps pages to detect if pages are properly placed or if the data should be migrated to a memory node local to where the task is running. Every “scan delay” the task scans the next “scan size” number of pages in its address space. When the end of the address space is reached the scanner restarts from the beginning.`

`In combination, the “scan delay” and “scan size” determine the scan rate. When “scan delay” decreases, the scan rate increases. The scan delay and hence the scan rate of every task is adaptive and depends on historical behaviour. If pages are properly placed then the scan delay increases, otherwise the scan delay decreases. The “scan size” is not adaptive but the higher the “scan size”, the higher the scan rate.`

`Higher scan rates incur higher system overhead as page faults must be trapped and potentially data must be migrated. However, the higher the scan rate, the more quickly a tasks memory is migrated to a local node if the workload pattern changes and minimises performance impact due to remote memory accesses. These sysctls control the thresholds for scan delays and the number of pages scanned.`

`numa_balancing_scan_period_min_ms is the minimum time in milliseconds to scan a tasks virtual memory. It effectively controls the maximum scanning rate for each task.`

`numa_balancing_scan_delay_ms is the starting “scan delay” used for a task when it initially forks.`

`numa_balancing_scan_period_max_ms is the maximum time in milliseconds to scan a tasks virtual memory. It effectively controls the minimum scanning rate for each task.`

`numa_balancing_scan_size_mb is how many megabytes worth of pages are scanned for a given scan.`

`- /kernel/oops_all_cpu_backtrace`

`If this option is set, the kernel will send an NMI to all CPUs to dump their backtraces when an oops event occurs. It should be used as a last resort in case a panic cannot be triggered (to protect VMs running, for example) or kdump can’t be collected. This file shows up if CONFIG_SMP is enabled.`

`0: Won’t show all CPUs backtraces when an oops is detected. This is the default behavior.`

`1: Will non-maskably interrupt all CPUs and dump their backtraces when an oops event is detected.`

- /kernel/osrelease, /kernel/ostype & /kernel/version

`# cat osrelease`
`2.1.88`
`# cat ostype`
`Linux`
`# cat version`
`#5 Wed Feb 25 21:49:24 MET 1998`

`The files osrelease and ostype should be clear enough. version needs a little more clarification however. The ‘#5’ means that this is the fifth kernel built from this source base and the date behind it indicates the time the kernel was built. The only way to tune these values is to rebuild the kernel :-)`

- /kernel/overflowgid & /kernel/overflowuid

`if your architecture did not always support 32-bit UIDs (i.e. arm, i386, m68k, sh, and sparc32), a fixed UID and GID will be returned to applications that use the old 16-bit UID/GID system calls, if the actual UID or GID would exceed 65535.`

`These sysctls allow you to change the value of the fixed UID and GID. The default is 65534.`

- /kernel/panic

`The value in this file determines the behaviour of the kernel on a panic.`
`The value in this file represents the number of seconds the kernel waits before rebooting on a panic:`

`    if zero, the kernel will loop forever;`

`    if negative, the kernel will reboot immediately;`

`    if positive, the kernel will reboot after the corresponding number of seconds.`

`When you use the software watchdog, the recommended setting is 60. `
`If set to 0, the auto reboot after a kernel panic is disabled, which is the default setting.`

- /kernel/panic_on_io_nmi

`Controls the kernel’s behavior when a CPU receives an NMI caused by an IO error.`

`0 - Try to continue operation (default).`

`1 - Panic immediately. The IO error triggered an NMI. This indicates a serious system condition which could result in IO data corruption. Rather than continuing, panicking might be a better choice. Some servers issue this sort of NMI when the dump button is pushed, and you can use this option to take a crash dump.`

- /kernel/panic_on_oops

`Controls the kernel’s behaviour when an oops or BUG is encountered.`

`0 - Try to continue operation.`

`1 - Panic immediately. If the panic sysctl is also non-zero then the machine will be rebooted.`

- /kernel/panic_on_stackoverflow

`Controls the kernel’s behavior when detecting the overflows of kernel, IRQ and exception stacks except a user stack. This file shows up if CONFIG_DEBUG_STACKOVERFLOW is enabled.`

`0 - Try to continue operation.`

`1 - Panic immediately.`

- /kernel/panic_on_unrecovered_nmi

`The default Linux behaviour on an NMI of either memory or unknown is to continue operation. For many environments such as scientific computing it is preferable that the box is taken out and the error dealt with than an uncorrected parity/ECC error get propagated.`

`A small number of systems do generate NMIs for bizarre random reasons such as power management so the default is off. That sysctl works like the existing panic controls already in that directory.`

- /kernel/panic_on_warn

`Calls panic() in the WARN() path when set to 1. This is useful to avoid a kernel rebuild when attempting to kdump at the location of a WARN().`

`0 - Only WARN(), default behaviour.`

`1 - Call panic() after printing out WARN() location.`

- /kernel/panic_print

`Bitmask for printing system info when panic happens. User can chose combination of the following bits:`

`bit 0 - print all tasks info`

`bit 1 - print system memory info`

`bit 2 - print timer info`

`bit 3 - print locks info if CONFIG_LOCKDEP is on`

`bit 4 - print ftrace buffer`

`So for example to print tasks and memory info on panic, user can:`

`echo 3 > /proc/sys/kernel/panic_print`

- /kernel/panic_on_rcu_stall

`When set to 1, calls panic() after RCU stall detection messages. This is useful to define the root cause of RCU stalls using a vmcore.`

`0 - Do not panic() when RCU stall takes place, default behavior.`

`1 - panic() after printing RCU stall messages.`

- /kernel/perf_cpu_time_max_percent

`Hints to the kernel how much CPU time it should be allowed to use to handle perf sampling events. If the perf subsystem is informed that its samples are exceeding this limit, it will drop its sampling frequency to attempt to reduce its CPU usage.`

`Some perf sampling happens in NMIs. If these samples unexpectedly take too long to execute, the NMIs can become stacked up next to each other so much that nothing else is allowed to execute.`

`0 - Disable the mechanism. Do not monitor or correct perf’s sampling rate no matter how CPU time it takes.`

`1-100 - Attempt to throttle perf’s sample rate to this percentage of CPU. Note: the kernel calculates an “expected” length of each sample event. 100 here means 100% of that expected length. Even if this is set to 100, you may still see sample throttling if this length is exceeded. Set to 0 if you truly do not care how much CPU is consumed.`

- /kernel/perf_event_paranoid

`Controls use of the performance events system by unprivileged users (without CAP_PERFMON). The default value is 2.`

`For backward compatibility reasons access to system performance monitoring and observability remains open for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN usage for secure system performance monitoring and observability operations is discouraged with respect to CAP_PERFMON use cases.`

`-1 - Allow use of (almost) all events by all users. Ignore mlock limit after perf_event_mlock_kb without CAP_IPC_LOCK.`

`>=0 - Disallow ftrace function tracepoint by users without CAP_PERFMON. Disallow raw tracepoint access by users without CAP_PERFMON.`

`>=1 - Disallow CPU event access by users without CAP_PERFMON.`

`>=2 - Disallow kernel profiling by users without CAP_PERFMON.`

- /kernel/perf_event_max_stack

`Controls maximum number of stack frames to copy for (attr.sample_type & PERF_SAMPLE_CALLCHAIN) configured events, for instance, when using ‘perf record -g’ or ‘perf trace --call-graph fp’.`

`This can only be done when no events are in use that have callchains enabled, otherwise writing to this file will return -EBUSY.`

`The default value is 127.`

`- /kernel/perf_event_mlock_kb`

`Control size of per-cpu ring buffer not counted against mlock limit.`

`The default value is 512 + 1 page`

- /kernel/perf_event_max_contexts_per_stack

`Controls maximum number of stack frame context entries for (attr.sample_type & PERF_SAMPLE_CALLCHAIN) configured events, for instance, when using ‘perf record -g’ or ‘perf trace --call-graph fp’.`

`This can only be done when no events are in use that have callchains enabled, otherwise writing to this file will return -EBUSY.`

`The default value is 8.`

- /kernel/pid_max

`PID allocation wrap value. When the kernel’s next PID value reaches this value, it wraps back to a minimum PID value. PIDs of value pid_max or larger are not allocated.`

- /kernel/ns_last_pid

`The last pid allocated in the current (the one task using this sysctl lives in) pid namespace. When selecting a pid for a next task on fork kernel tries to allocate a number starting from this one.`

- /kernel/powersave-nap (PPC only)

`If set, Linux-PPC will use the ‘nap’ mode of powersaving, otherwise the ‘doze’ mode will be used.`

- /kernel/printk

`The four values in printk denote * console_loglevel, * default_message_loglevel, * minimum_console_level and * default_console_loglevel respectively. `
`These values influence printk() behavior when printing or logging error messages, which come from inside the kernel. See syslog(2) for more information on the different log levels.`

`console_loglevel - messages with a higher priority than this will be printed to the console`

`default_message_loglevel - messages without an explicit priority will be printed with this priority`

`minimum_console_loglevel - minimum (highest) value to which console_loglevel can be set`

`default_console_loglevel - default value for console_loglevel`

- /kernel/printk_delay

`Delay each printk message in printk_delay milliseconds`

`Value from 0 - 10000 is allowed.`

- /kernel/printk_ratelimit

`Some warning messages are rate limited. printk_ratelimit specifies the minimum length of time between these messages (in seconds). The default value is 5 seconds.`

`A value of 0 will disable rate limiting.`

- /kernel/printk_ratelimit_burst

`While long term we enforce one message per printk_ratelimit seconds, we do allow a burst of messages to pass through. printk_ratelimit_burst specifies the number of messages we can send before ratelimiting kicks in.`

`The default value is 10 messages.`

- /kernel/printk_devkmsg

`Control the logging to /dev/kmsg from userspace:`

`ratelimit - default, ratelimited`

`on - unlimited logging to /dev/kmsg from userspace`

`off - logging to /dev/kmsg disabled`

`The kernel command line parameter printk.devkmsg= overrides this and is a one-time setting until next reboot: once set, it cannot be changed by this sysctl interface anymore.`

- /kernel/pty

`See The Devpts Filesystem. `
https://www.kernel.org/doc/html/latest/filesystems/devpts.html

- /kernel/random

`This is a directory, with the following entries:`

`    boot_id: a UUID generated the first time this is retrieved, and unvarying after that;`

`    entropy_avail: the pool’s entropy count, in bits;`

`    poolsize: the entropy pool size, in bits;`

`    urandom_min_reseed_secs: obsolete (used to determine the minimum number of seconds between urandom pool reseeding).`

`    uuid: a UUID generated every time this is retrieved (this can thus be used to generate UUIDs at will);`

`    write_wakeup_threshold: when the entropy count drops below this (as a number of bits), processes waiting to write to /dev/random are woken up.`

`If drivers/char/random.c is built with ADD_INTERRUPT_BENCH defined, these additional entries are present:`

`    add_interrupt_avg_cycles: the average number of cycles between interrupts used to feed the pool;`

`    add_interrupt_avg_deviation: the standard deviation seen on the number of cycles between interrupts used to feed the pool.`

- /kernel/randomize_va_space

`This option can be used to select the type of process address space randomization that is used in the system, for architectures that support this feature.`

`0 - Turn the process address space randomization off. This is the default for architectures that do not support this feature anyways, and kernels that are booted with the “norandmaps” parameter.`

`1 - Make the addresses of mmap base, stack and VDSO page randomized. This, among other things, implies that shared libraries will be loaded to random addresses. Also for PIE-linked binaries, the location of code start is randomized. This is the default if the CONFIG_COMPAT_BRK option is enabled.`

`2 - Additionally enable heap randomization. This is the default if CONFIG_COMPAT_BRK is disabled. There are a few legacy applications out there (such as some ancient versions of libc.so.5 from 1996) that assume that brk area starts just after the end of the code+bss. These applications break when start of the brk area is randomized. There are however no known non-legacy applications that would be broken this way, so for most systems it is safe to choose full randomization. Systems with ancient and/or broken binaries should be configured with CONFIG_COMPAT_BRK enabled, which excludes the heap from process address space randomization.`

- /kernel/real-root-dev

`See Using the initial RAM disk (initrd).`
https://www.kernel.org/doc/html/latest/admin-guide/initrd.html

- /kernel/reboot-cmd (SPARC only)

`??? This seems to be a way to give an argument to the Sparc ROM/Flash boot loader. Maybe to tell it what to do after rebooting. ???`

- /kernel/sched_energy_aware

`Enables/disables Energy Aware Scheduling (EAS). EAS starts automatically on platforms where it can run (that is, platforms with asymmetric CPU topologies and having an Energy Model available). If your platform happens to meet the requirements for EAS but you do not want to use it, change this value to 0.`

- /kernel/task_delayacct

`Enables/disables task delay accounting (see accounting/delay-accounting.rst). Enabling this feature incurs a small amount of overhead in the scheduler but is useful for debugging and performance tuning. It is required by some tools such as iotop.`

- /kernel/sched_schedstats

`Enables/disables scheduler statistics. Enabling this feature incurs a small amount of overhead in the scheduler but is useful for debugging and performance tuning.`

- /kernel/sched_util_clamp_min

`Max allowed minimum utilization.`

`Default value is 1024, which is the maximum possible value.`

`It means that any requested uclamp.min value cannot be greater than sched_util_clamp_min, i.e., it is restricted to the range [0:sched_util_clamp_min].`

- /kernel/sched_util_clamp_max

`Max allowed maximum utilization.`

`Default value is 1024, which is the maximum possible value.`

`It means that any requested uclamp.max value cannot be greater than sched_util_clamp_max, i.e., it is restricted to the range [0:sched_util_clamp_max].`

- /kernel/sched_util_clamp_min_rt_default

`By default Linux is tuned for performance. Which means that RT tasks always run at the highest frequency and most capable (highest capacity) CPU (in heterogeneous systems).`

`Uclamp achieves this by setting the requested uclamp.min of all RT tasks to 1024 by default, which effectively boosts the tasks to run at the highest frequency and biases them to run on the biggest CPU.`

`This knob allows admins to change the default behavior when uclamp is being used. In battery powered devices particularly, running at the maximum capacity and frequency will increase energy consumption and shorten the battery life.`

`This knob is only effective for RT tasks which the user hasn’t modified their requested uclamp.min value via sched_setattr() syscall.`

`This knob will not escape the range constraint imposed by sched_util_clamp_min defined above.`

`For example if`

`    sched_util_clamp_min_rt_default = 800 sched_util_clamp_min = 600`

`Then the boost will be clamped to 600 because 800 is outside of the permissible range of [0:600]. This could happen for instance if a powersave mode will restrict all boosts temporarily by modifying sched_util_clamp_min. As soon as this restriction is lifted, the requested sched_util_clamp_min_rt_default will take effect.`

- /kernel/seccomp

`See Seccomp BPF (SECure COMPuting with filters).`
`https://www.kernel.org/doc/html/latest/userspace-api/seccomp_filter.html`

- /kernel/sg-big-buff

`This file shows the size of the generic SCSI (sg) buffer. At this point, you can't tune it yet, but you can change it at compile time by editing include/scsi/sg.h and changing the value of SG_BIG_BUFF. `
`If you use a scanner with SANE (Scanner Access Now Easy) you might want to set this to a higher value. Refer to the SANE documentation on this issue.`

- /kernel/shmall

`This parameter sets the total amount of shared memory pages that can be used system wide. Hence, shmall should always be at least ceil(shmmax/PAGE_SIZE).`

`If you are not sure what the default PAGE_SIZE is on your Linux system, you can run the following command:`

`# getconf PAGE_SIZE`

- /kernel/shmmax

`This value can be used to query and set the run time limit on the maximum shared memory segment size that can be created. Shared memory segments up to 1Gb are now supported in the kernel. This value defaults to SHMMAX.`

- /kernel/shmmni

`This value determines the maximum number of shared memory segments. 4096 by default (SHMMNI).`

- /kernel/shm_rmid_forced

`Linux lets you set resource limits, including how much memory one process can consume, via setrlimit(2). Unfortunately, shared memory segments are allowed to exist without association with any process, and thus might not be counted against any resource limits. If enabled, shared memory segments are automatically destroyed when their attach count becomes zero after a detach or a process termination. It will also destroy segments that were created, but never attached to, on exit from the process. The only use left for IPC_RMID is to immediately destroy an unattached segment. Of course, this breaks the way things are defined, so some applications might stop working. Note that this feature will do you no good unless you also configure your resource limits (in particular, RLIMIT_AS and RLIMIT_NPROC). Most systems don’t need this.`

`Note that if you change this from 0 to 1, already created segments without users and with a dead originative process will be destroyed.`

- /kernel/sysctl_writes_strict

`Control how file position affects the behavior of updating sysctl values via the /proc/sys interface:`

`    -1 -     Legacy per-write sysctl value handling, with no printk warnings. Each write syscall must fully contain the sysctl value to be written, and multiple writes on the same sysctl file descriptor will rewrite the sysctl value, regardless of file position.`

`    0 -     Same behavior as above, but warn about processes that perform writes to a sysctl file descriptor when the file position is not 0.`

`    1 -     (default) Respect file position when writing sysctl strings. Multiple writes will append to the sysctl value buffer. Anything past the max length of the sysctl value buffer will be ignored. Writes to numeric sysctl entries must always be at file position 0 and the value must be fully contained in the buffer sent in the write syscall.`

- /kernel/softlockup_all_cpu_backtrace

`This value controls the soft lockup detector thread’s behavior when a soft lockup condition is detected as to whether or not to gather further debug information. If enabled, each cpu will be issued an NMI and instructed to capture stack trace.`

`This feature is only applicable for architectures which support NMI.`

`0 - Do nothing. This is the default behavior.`

`1 - On detection capture more debug information.`

- /kernel/softlockup_panic

`This parameter can be used to control whether the kernel panics when a soft lockup is detected.`

`0 - Don’t panic on soft lockup.`

`1 - Panic on soft lockup.`

`This can also be set using the softlockup_panic kernel parameter.`

- /kernel/soft_watchdog

`This parameter can be used to control the soft lockup detector.`

`0 - Disable the soft lockup detector.`

`1 - Enable the soft lockup detector.`

`The soft lockup detector monitors CPUs for threads that are hogging the CPUs without rescheduling voluntarily, and thus prevent the ‘migration/N’ threads from running, causing the watchdog work fail to execute. The mechanism depends on the CPUs ability to respond to timer interrupts which are needed for the watchdog work to be queued by the watchdog timer function, otherwise the NMI watchdog — if enabled — can detect a hard lockup condition.`

- /kernel/stack_erasing

`This parameter can be used to control kernel stack erasing at the end of syscalls for kernels built with CONFIG_GCC_PLUGIN_STACKLEAK.`

`That erasing reduces the information which kernel stack leak bugs can reveal and blocks some uninitialized stack variable attacks. The tradeoff is the performance impact: on a single CPU system kernel compilation sees a 1% slowdown, other systems and workloads may vary.`

`0 - Kernel stack erasing is disabled, STACKLEAK_METRICS are not updated.`

`1 - Kernel stack erasing is enabled (default), it is performed before returning to the userspace at the end of syscalls.`

- /kernel/stop-a (SPARC only)

`Controls Stop-A:`

`0 - Stop-A has no effect.`

`1 - Stop-A breaks to the PROM (default).`

`Stop-A is always enabled on a panic, so that the user can return to the boot PROM.`

- /kernel/sysrq

`See Linux Magic System Request Key Hacks.`
`https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html`

- /kernel/tainted

`Non-zero if the kernel has been tainted. Numeric values, which can be ORed together. The letters are seen in “Tainted” line of Oops reports.`

`1 - (P) - proprietary module was loaded`

`2 - (F) - module was force loaded`

`4 - (S) - kernel running on an out of specification system`

`8 - (R) - module was force unloaded`

`16 - (M) - processor reported a Machine Check Exception (MCE)`

`32 - (B) - bad page referenced or some unexpected page flags`

`64 - (U) - taint requested by userspace application`

`128 - (D) - kernel died recently, i.e. there was an OOPS or BUG`

`256 - (A) - an ACPI table was overridden by user`

`512 - (W) - kernel issued warning`

`1024 - (C) - staging driver was loaded`

`2048 - (I) - workaround for bug in platform firmware applied`

`4096 - (O) - externally-built (“out-of-tree”) module was loaded`

`8192 - (E) - unsigned module was loaded`

`16384 - (L) - soft lockup occurred`

`32768 - (K) - kernel has been live patched`

`65536 - (X) - Auxiliary taint, defined and used by for distros`

`131072 - (T) - The kernel was built with the struct randomization plugin`

`See Tainted kernels for more information.`
https://www.kernel.org/doc/html/latest/admin-guide/tainted-kernels.html
``
Note:
``
	writes to this sysctl interface will fail with EINVAL if the kernel is booted with the command line option panic_on_taint=<bitmask>,nousertaint and any of the ORed together values being written to tainted match with the bitmask declared on panic_on_taint. 
`	`
	See The kernel’s command-line parameters for more details on that particular kernel command line option and its optional nousertaint switch.
`https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html`

- /kernel/threads-max

`This value controls the maximum number of threads that can be created using fork().`

`During initialization the kernel sets this value such that even if the maximum number of threads is created, the thread structures occupy only a part (1/8th) of the available RAM pages.`

`The minimum value that can be written to threads-max is 1.`

`The maximum value that can be written to threads-max is given by the constant FUTEX_TID_MASK (0x3fffffff).`

`If a value outside of this range is written to threads-max an EINVAL error occurs.`

- /kernel/traceoff_on_warning

`When set, disables tracing (see ftrace - Function Tracer) when a WARN() is hit.`
`https://www.kernel.org/doc/html/latest/trace/ftrace.html`

- /kernel/tracepoint_printk

`When tracepoints are sent to printk() (enabled by the tp_printk boot parameter), this entry provides runtime control:`

`echo 0 > /proc/sys/kernel/tracepoint_printk`

`will stop tracepoints from being sent to printk(), and:`

`echo 1 > /proc/sys/kernel/tracepoint_printk`

`will send them to printk() again.`

`This only works if the kernel was booted with tp_printk enabled.`

`See The kernel’s command-line parameters and Boot-time tracing.`
`https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html`
`https://www.kernel.org/doc/html/latest/trace/boottime-trace.html`

- /kernel/unaligned-dump-stack (ia64)

`When logging unaligned accesses, controls whether the stack is dumped.`

`0 - Do not dump the stack. This is the default setting.`

`1 - Dump the stack.`

`See also ignore-unaligned-usertrap.`

- /kernel/unaligned-trap

`On architectures where unaligned accesses cause traps, and where this feature is supported (CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW; currently, arc and parisc), controls whether unaligned traps are caught and emulated (instead of failing).`

`0 - Do not emulate unaligned accesses.`

`1 - Emulate unaligned accesses. This is the default setting.`

`See also ignore-unaligned-usertrap.`

- /kernel/unknown_nmi_panic

`The value in this file affects behavior of handling NMI. When the value is non-zero, unknown NMI is trapped and then panic occurs. At that time, kernel debugging information is displayed on console.`

`NMI switch that most IA32 servers have fires unknown NMI up, for example. If a system hangs up, try pressing the NMI switch.`

- /kernel/unprivileged_bpf_disabled

`Writing 1 to this entry will disable unprivileged calls to bpf(); once disabled, calling bpf() without CAP_SYS_ADMIN or CAP_BPF will return -EPERM. Once set to 1, this can’t be cleared from the running kernel anymore.`

`Writing 2 to this entry will also disable unprivileged calls to bpf(), however, an admin can still change this setting later on, if needed, by writing 0 or 1 to this entry.`

`If BPF_UNPRIV_DEFAULT_OFF is enabled in the kernel config, then this entry will default to 2 instead of 0.`

`0 - Unprivileged calls to bpf() are enabled`

`1 - Unprivileged calls to bpf() are disabled without recovery`

`2 - Unprivileged calls to bpf() are disabled`

- /kernel/watchdog

`This parameter can be used to disable or enable the soft lockup detector and the NMI watchdog (i.e. the hard lockup detector) at the same time.`

`0 - Disable both lockup detectors.`

`1 - Enable both lockup detectors.`

`The soft lockup detector and the NMI watchdog can also be disabled or enabled individually, using the soft_watchdog and nmi_watchdog parameters. If the watchdog parameter is read, for example by executing:`

`cat /proc/sys/kernel/watchdog`

`the output of this command (0 or 1) shows the logical OR of soft_watchdog and nmi_watchdog.`

- /kernel/watchdog_cpumask

`This value can be used to control on which cpus the watchdog may run. The default cpumask is all possible cores, but if NO_HZ_FULL is enabled in the kernel config, and cores are specified with the nohz_full= boot argument, those cores are excluded by default. Offline cores can be included in this mask, and if the core is later brought online, the watchdog will be started based on the mask value.`

`Typically this value would only be touched in the nohz_full case to re-enable cores that by default were not running the watchdog, if a kernel lockup was suspected on those cores.`

`The argument value is the standard cpulist format for cpumasks, so for example to enable the watchdog on cores 0, 2, 3, and 4 you might say:`

`echo 0,2-4 > /proc/sys/kernel/watchdog_cpumask`

- /kernel/watchdog_thresh

`This value can be used to control the frequency of hrtimer and NMI events and the soft and hard lockup thresholds. The default threshold is 10 seconds.`

`The softlockup threshold is (2 * watchdog_thresh). Setting this tunable to zero will disable lockup detection altogether.`













#---------------------------------------------------------------------------------------------
#------------------------------------| VM DIRECTORY |-----------------------------------------
#---------------------------------------------------------------------------------------------

- /proc/sys/vm

`The files in this directory can be used to tune the operation of the virtual memory (VM) subsystem of the Linux kernel. In addition, one of the files (bdflush) has some influence on disk usage.`

- nfract

`This parameter governs the maximum number of dirty buffers in the buffer cache. Dirty means that the contents of the buffer still have to be written to disk (as opposed to a clean buffer, which can just be forgotten about). Setting this to a higher value means that Linux can delay disk writes for a long time, but it also means that it will have to do a lot of I/O at once when memory becomes short. A lower value will spread out disk I/O more evenly.`

- ndirty

`Ndirty gives the maximum number of dirty buffers that bdflush can write to the disk at one time. A high value will mean delayed, bursty I/O, while a small value can lead to memory shortage when bdflush isn't woken up often enough.`

- nrefill

`This is the number of buffers that bdflush will add to the list of free buffers when refill_freelist() is called. It is necessary to allocate free buffers beforehand, since the buffers are often different sizes than the memory pages and some bookkeeping needs to be done beforehand. The higher the number, the more memory will be wasted and the less often refill_freelist() will need to run.`

- nref_dirt

`When refill_freelist() comes across more than nref_dirt dirty buffers, it will wake up bdflush.`

- age_buffer, age_super

`Finally, the age_buffer and age_super parameters govern the maximum time Linux waits before writing out a dirty buffer to disk. The value is expressed in jiffies (clockticks), the number of jiffies per second is 100. Age_buffer is the maximum age for data blocks, while age_super is for filesystems meta data.`

- buffermem

`The three values in this file control how much memory should be used for buffer memory. The percentage is calculated as a percentage of total system memory.`

`The values are:`

- min_percent

`This is the minimum percentage of memory that should be spent on buffer memory.`

- borrow_percent

`When Linux is short on memory, and the buffer cache uses more than it has been allotted, the memory management (MM) subsystem will prune the buffer cache more heavily than other memory to compensate.`

- max_percent

`This is the maximum amount of memory that can be used for buffer memory.`

- freepages

`This file contains three values: min, low and high:`

- min

`When the number of free pages in the system reaches this number, only the kernel can allocate more memory.`

- low

`If the number of free pages falls below this point, the kernel starts swapping aggressively.`

- high

`The kernel tries to keep up to this amount of memory free; if memory falls below this point, the kernel starts gently swapping in the hopes that it never has to do really aggressive swapping.`

- kswapd

`Kswapd is the kernel swap out daemon. That is, kswapd is that piece of the kernel that frees memory when it gets fragmented or full. Since every system is different, you'll probably want some control over this piece of the system.`

`The file contains three numbers:`

- tries_base

`The maximum number of pages kswapd tries to free in one round is calculated from this number. Usually this number will be divided by 4 or 8 (see mm/vmscan.c), so it isn't as big as it looks. When you need to increase the bandwidth to/from swap, you'll want to increase this number.`

- tries_min

`This is the minimum number of times kswapd tries to free a page each time it is called. Basically it's just there to make sure that kswapd frees some pages even when it's being called with minimum priority.`

- swap_cluster

`This is probably the greatest influence on system performance. swap_cluster is the number of pages kswapd writes in one turn. You'll want this value to be large so that kswapd does its I/O in large chunks and the disk doesn't have to seek as often, but you don't want it to be too large since that would flood the request queue.`

- overcommit_memory

`This file contains one value. The following algorithm is used to decide if there's enough memory: if the value of overcommit_memory is positive, then there's always enough memory. This is a useful feature, since programs often malloc() huge amounts of memory 'just in case', while they only use a small part of it. Leaving this value at 0 will lead to the failure of such a huge malloc(), when in fact the system has enough memory for the program to run. On the other hand, enabling this feature can cause you to run out of memory and thrash the system to death, so large and/or important servers will want to set this value to 0.`

- pagecache

`This file does exactly the same job as buffermem, only this file controls the amount of memory allowed for memory mapping and generic caching of files. You don't want the minimum level to be too low, otherwise your system might thrash when memory is tight or fragmentation is high.`

- pagetable_cache

`The kernel keeps a number of page tables in a per-processor cache (this helps a lot on SMP systems). The cache size for each processor will be between the low and the high value. On a low-memory, single CPU system, you can safely set these values to 0 so you don't waste memory. It is used on SMP systems so that the system can perform fast pagetable allocations without having to acquire the kernel memory lock. For large systems, the settings are probably fine. For normal systems they won't hurt a bit. For small systems ( less than 16MB ram) it might be advantageous to set both values to 0.`

- swapctl

`This file contains no less than 8 variables. All of these values are used by kswapd. The first four variables sc_max_page_age, sc_page_advance, sc_page_decline and sc_page_initial_age are used to keep track of Linux's page aging. Page ageing is a bookkeeping method to track which pages of memory are often used, and which pages can be swapped out without consequences.`

`When a page is swapped in, it starts at sc_page_initial_age (default 3) and when the page is scanned by kswapd, its age is adjusted according to the following scheme.`

`If the page was used since the last time we scanned, its age is increased by sc_page_advance (default 3). Where the maximum value is given by sc_max_page_age (default 20). Otherwise (meaning it wasn't used) its age is decreased by sc_page_decline (default 1).`

`When a page reaches age 0, it's ready to be swapped out.`

`The variables sc_age_cluster_fract, sc_age_cluster_min, sc_pageout_weight and sc_bufferout_weight, can be used to control kswapd's aggressiveness in swapping out pages.`

`Sc_age_cluster_fract is used to calculate how many pages from a process are to be scanned by kswapd. The formula used is`

`(sc_age_cluster_fract divided by 1024) times resident set size`

`So if you want kswapd to scan the whole process, sc_age_cluster_fract needs to have a value of 1024. The minimum number of pages kswapd will scan is represented by sc_age_cluster_min, which is done so that kswapd will also scan small processes. The values of sc_pageout_weight and sc_bufferout_weight are used to control how many tries kswapd will make in order to swap out one page/buffer. These values can be used to fine-tune the ratio between user pages and buffer/cache memory. When you find that your Linux system is swapping out too many process pages in order to satisfy buffer memory demands, you may want to either increase sc_bufferout_weight, or decrease the value of sc_pageout_weight.`


#---------------------------------------------------------------------------------------------
#------------------------------------| DEV DIRECTORY |----------------------------------------
#---------------------------------------------------------------------------------------------

- /proc/sys/dev

`Device specific parameters. Currently there is only support for CDROM drives, and for those, there is only one read-only file containing information about the CD-ROM drives attached to the system: >cat /proc/sys/dev/cdrom/info CD-ROM information, Id: cdrom.c 2.55 1999/04/25 drive name: sr0 hdb drive speed: 32 40 drive # of slots: 1 0 Can close tray: 1 1 Can open tray: 1 1 Can lock tray: 1 1 Can change speed: 1 1 Can select disk: 0 1 Can read multisession: 1 1 Can read MCN: 1 1 Reports media changed: 1 1 Can play audio: 1 1 You see two drives, sr0 and hdb, along with a list of their features.`


#---------------------------------------------------------------------------------------------
#----------------------------------| SUNRPC DIRECTORY |---------------------------------------
#---------------------------------------------------------------------------------------------

SUNRPC 
- /proc/sys/sunrpc

`This directory contains four files, which enable or disable debugging for the RPC functions NFS, NFS-daemon, RPC and NLM. The default values are 0. They can be set to one to turn debugging on. (The default value is 0 for each)`


#---------------------------------------------------------------------------------------------
#----------------------------------| NET DIRECTORY |------------------------------------------
#---------------------------------------------------------------------------------------------

- /proc/sys/net

`The interface to the networking parts of the kernel is located in /proc/sys/net. The following table shows all possible subdirectories. You may see only some of them, depending on your kernel's configuration. Our main focus will be on IP networking since AX15, X.25, and DEC Net are only minor players in the Linux world. Should you wish review the online documentation and the kernel source to get a detailed view of the parameters for those protocols not covered here. In this section we'll discuss the subdirectories listed above. As default values are suitable for most needs, there is no need to change these values.`



GENERAL PARAMETERS

- /proc/sys/net/core

`Network core options`

- rmem_default

`The default setting of the socket receive buffer in bytes.`

- rmem_max

`The maximum receive socket buffer size in bytes.`

- wmem_default

`The default setting (in bytes) of the socket send buffer.`

- wmem_max

`The maximum send socket buffer size in bytes.`

- message_burst and message_cost

`These parameters are used to limit the warning messages written to the kernel log from the networking code. They enforce a rate limit to make a denial-of-service attack impossible. A higher message_cost factor, results in fewer messages that will be written. Message_burst controls when messages will be dropped. The default settings limit warning messages to one every five seconds.`

- netdev_max_backlog

`Maximum number of packets, queued on the INPUT side, when the interface receives packets faster than kernel can process them.`

- optmem_max

`Maximum ancillary buffer size allowed per socket. Ancillary data is a sequence of struct cmsghdr structures with appended data.`



UNIX DOMAIN SOCKETS

- /proc/sys/net/unix

`Parameters for Unix domain sockets`

`There are only two files in this subdirectory. They control the delays for deleting and destroying socket descriptors.`



IPv4

- /proc/sys/net/ipv4

`IPV4 settings. IP version 4 is still the most used protocol in Unix networking. It will be replaced by IP version 6 in the next couple of years, but for the moment it's the de facto standard for the internet and is used in most networking environments around the world. Because of the importance of this protocol, we'll have a deeper look into the subtree controlling the behavior of the Ipv4 subsystem of the Linux kernel.`

Let's start with the entries in /proc/sys/net/ipv4.



ICMP settings

- icmp_echo_ignore_all and icmp_echo_ignore_broadcasts

`Turn on (1) or off (0), if the kernel should ignore all ICMP ECHO requests, or just those to broadcast and multicast addresses.`

`Please note that if you accept ICMP echo requests with a broadcast/multi\-cast destination address your network may be used as an exploder for denial of service packet flooding attacks to other hosts.`

- icmp_destunreach_rate, icmp_echoreply_rate, icmp_paramprob_rate and icmp_timeexeed_rate

`Sets limits for sending ICMP packets to specific targets. A value of zero disables all limiting. Any positive value sets the maximum package rate in hundredth of a second (on Intel systems).`



IP settings

- ip_autoconfig

`This file contains the number one if the host received its IP configuration by RARP, BOOTP, DHCP or a similar mechanism. Otherwise it is zero.`

- ip_default_ttl

`TTL (Time To Live) for IPv4 interfaces. This is simply the maximum number of hops a packet may travel.`

- ip_dynaddr

`Enable dynamic socket address rewriting on interface address change. This is useful for dialup interface with changing IP addresses.`

- ip_forward

`Enable or disable forwarding of IP packages between interfaces. Changing this value resets all other parameters to their default values. They differ if the kernel is configured as host or router.`

- ip_local_port_range

`Range of ports used by TCP and UDP to choose the local port. Contains two numbers, the first number is the lowest port, the second number the highest local port. Default is 1024-4999. Should be changed to 32768-61000 for high-usage systems.`

- ip_no_pmtu_disc

`Global switch to turn path MTU discovery off. It can also be set on a per socket basis by the applications or on a per route basis.`

- ip_masq_debug

`Enable/disable debugging of IP masquerading.`

IP fragmentation settings


- ipfrag_high_trash and ipfrag_low_trash

`Maximum memory used to reassemble IP fragments. When ipfrag_high_thrash bytes of memory is allocated for this purpose, the fragment handler will toss packets until ipfrag_low_thrash is reached.`

- ipfrag_time

`Time in seconds to keep an IP fragment in memory.`



TCP settings

- tcp_ecn

`This file controls the use of the ECN bit in the IPv4 headers, this is a new feature about Explicit Congestion Notification, but some routers and firewalls block traffic that has this bit set, so it could be necessary to echo 0 to /proc/sys/net/ipv4/tcp_ecn, if you want to talk to this sites. For more info you could read RFC2481.`

- tcp_retrans_collapse

`Bug-to-bug compatibility with some broken printers. On retransmit, try to send larger packets to work around bugs in certain TCP stacks. Can be turned off by setting it to zero.`

- tcp_keepalive_probes

`Number of keep alive probes TCP sends out, until it decides that the connection is broken.`

- tcp_keepalive_time

`How often TCP sends out keep alive messages, when keep alive is enabled. The default is 2 hours.`

- tcp_syn_retries

`Number of times initial SYNs for a TCP connection attempt will be retransmitted. Should not be higher than 255. This is only the timeout for outgoing connections, for incoming connections the number of retransmits is defined by tcp_retries1.`

- tcp_sack

`Enable select acknowledgments after RFC2018.`

- tcp_timestamps

`Enable timestamps as defined in RFC1323.`

- tcp_stdurg

`Enable the strict RFC793 interpretation of the TCP urgent pointer field. The default is to use the BSD compatible interpretation of the urgent pointer pointing to the first byte after the urgent data. The RFC793 interpretation is to have it point to the last byte of urgent data. Enabling this option may lead to interoperability problems. Disabled by default.`

- tcp_syncookies

`Only valid when the kernel was compiled with CONFIG_SYNCOOKIES. Send out syncookies when the syn backlog queue of a socket overflows. This is to ward off the common 'syn flood attack'. Disabled by default. Note that the concept of a socket backlog is abandoned. This means the peer may not receive reliable error messages from an over loaded server with syncookies enabled.`

- tcp_window_scaling

`Enable window scaling as defined in RFC1323.`

- tcp_fin_timeout

`The length of time in seconds it takes to receive a final FIN before the socket is always closed. This is strictly a violation of the TCP specification, but required to prevent denial-of-service attacks.`

- tcp_max_ka_probes

`Indicates how many keep alive probes are sent per slow timer run. Should not be set too high to prevent bursts.`

- tcp_max_syn_backlog

`Length of the per socket backlog queue. Since Linux 2.2 the backlog specified in listen(2) only specifies the length of the backlog queue of already established sockets. When more connection requests arrive Linux starts to drop packets. When syncookies are enabled the packets are still answered and the maximum queue is effectively ignored.`

- tcp_retries1

`Defines how often an answer to a TCP connection request is retransmitted before giving up.`

- tcp_retries2

`Defines how often a TCP packet is retransmitted before giving up.`


- /proc/sys/net/ipv4/conf

`Here you'll find one subdirectory for each interface the system knows about and one directory called all. Changes in the all subdirectory affect all interfaces, whereas changes in the other subdirectories affect only one interface. All directories have the same entries:`

- accept_redirects

`This switch decides if the kernel accepts ICMP redirect messages or not. The default is 'yes' if the kernel is configured for a regular host and 'no' for a router configuration.`

- accept_source_route

`Should source routed packages be accepted or declined. The default is dependent on the kernel configuration. It's 'yes' for routers and 'no' for hosts.`

- bootp_relay

`Accept packets with source address 0.b.c.d with destinations not to this host as local ones. It is supposed that a BOOTP relay daemon will catch and forward such packets. The default is 0.`

- forwarding

`Enable or disable IP forwarding on this interface.`

- log_martians

`Log packets with source addresses with no known route to kernel log.`

- mc_forwarding

`Do multicast routing. The kernel needs to be compiled with CONFIG_MROUTE and a multicast routing daemon is required.`

- proxy_arp

`Does (1) or does not (0) perform proxy ARP.`

- rp_filter

`Integer value determines if a source validation should be made. 1 means yes, 0 means no. Disabled by default, but local/broadcast address spoofing is always on. If you set this to 1 on a router that is the only connection for a network to the net, it will prevent spoofing attacks against your internal networks (external addresses can still be spoofed), without the need for additional firewall rules.`

- secure_redirects

`Accept ICMP redirect messages only for gateways, listed in default gateway list. Enabled by default.`

- shared_media

`If it is not set the kernel does not assume that different subnets on this device can communicate directly. Default setting is 'yes'.`

- send_redirects

`Determines whether to send ICMP redirects to other hosts.`

Routing settings

The directory /proc/sys/net/ipv4/route contains several file to control routing issues.

- error_burst and error_cost

`These parameters are used to limit the warning messages written to the kernel log from the routing code. The higher the error_cost factor is, the fewer messages will be written. Error_burst controls when messages will be dropped. The default settings limit warning messages to one every five seconds.`

- flush

`Writing to this file results in a flush of the routing cache.`

- gc_elastic, gc_interval, gc_min_interval, gc_tresh, gc_timeout

`Values to control the frequency and behavior of the garbage collection algorithm for the routing cache.`

- max_size

`Maximum size of the routing cache. Old entries will be purged once the cache reached has this size.`

- max_delay, min_delay

`Delays for flushing the routing cache.`

- redirect_load, redirect_number

`Factors which determine if more ICPM redirects should be sent to a specific host. No redirects will be sent once the load limit or the maximum number of redirects has been reached.`

- redirect_silence

`Timeout for redirects. After this period redirects will be sent again, even if this has been stopped, because the load or number limit has been reached. `

- /proc/sys/net/ipv4/neigh

`Network Neighbor handling. It contains settings about how to handle connections with direct neighbors (nodes attached to the same link). As we saw it in the conf directory, there is a default subdirectory which holds the default values, and one directory for each interface. The contents of the directories are identical, with the single exception that the default settings contain additional options to set garbage collection parameters.`

In the interface directories you'll find the following entries:

- base_reachable_time

`A base value used for computing the random reachable time value as specified in RFC2461.`

- retrans_time

`The time, expressed in jiffies (1/100 sec), between retransmitted Neighbor Solicitation messages. Used for address resolution and to determine if a neighbor is unreachable.`

- unres_qlen

`Maximum queue length for a pending arp request - the number of packets which are accepted from other layers while the ARP address is still resolved.`

- anycast_delay

`Maximum for random delay of answers to neighbor solicitation messages in jiffies (1/100 sec). Not yet implemented (Linux does not have anycast support yet).`

- ucast_solicit

`Maximum number of retries for unicast solicitation.`

- mcast_solicit

`Maximum number of retries for multicast solicitation.`

- delay_first_probe_time

`Delay for the first time probe if the neighbor is reachable. (see gc_stale_time)`

- locktime

`An ARP/neighbor entry is only replaced with a new one if the old is at least locktime old. This prevents ARP cache thrashing.`

- proxy_delay

`Maximum time (real time is random [0..proxytime]) before answering to an ARP request for which we have an proxy ARP entry. In some cases, this is used to prevent network flooding.`

- proxy_qlen

`Maximum queue length of the delayed proxy arp timer. (see proxy_delay).`

- app_solcit

`Determines the number of requests to send to the user level ARP daemon. Use 0 to turn off.`

- gc_stale_time

`Determines how often to check for stale ARP entries. After an ARP entry is stale it will be resolved again (which is useful when an IP address migrates to another machine). When ucast_solicit is greater than 0 it first tries to send an ARP packet directly to the known host When that fails and mcast_solicit is greater than 0, an ARP request is broadcasted.`



APPLETALK

- /proc/sys/net/appletalk

`Holds the Appletalk configuration data when Appletalk is loaded. The configurable parameters are:`

- aarp-expiry-time

`The amount of time we keep an ARP entry before expiring it. Used to age out old hosts.`

- aarp-resolve-time

`The amount of time we will spend trying to resolve an Appletalk address.`

- aarp-retransmit-limit

`The number of times we will retransmit a query before giving up.`

- aarp-tick-time

`Controls the rate at which expires are checked.`

- /proc/net/appletalk

`Holds the list of active Appletalk sockets on a machine. The fields indicate the DDP type, the local address (in network:node format) the remote address, the size of the transmit pending queue, the size of the received queue (bytes waiting for applications to read) the state and the uid owning the socket.`

- /proc/net/atalk_iface

`lists all the interfaces configured for appletalk. It shows the name of the interface, its Appletalk address, the network range on that address (or network number for phase 1 networks), and the status of the interface.`

- /proc/net/atalk_route

`lists each known network route. It lists the target (network) that the route leads to, the router (may be directly connected), the route flags, and the device the route is using.`



IPX

`The IPX protocol has no tunable values in proc/sys/net, it does, however, provide proc/net/ipx. This lists each IPX socket giving the local and remote addresses in Novell format (that is network:node:port). In accordance with the strange Novell tradition, everything but the port is in hex. Not_Connected is displayed for sockets that are not tied to a specific remote address. The Tx and Rx queue sizes indicate the number of bytes pending for transmission and reception. The state indicates the state the socket is in and the uid is the owning uid of the socket.`

- ipx_interface

`Lists all IPX interfaces. For each interface it gives the network number, the node number, and indicates if the network is the primary network. It also indicates which device it is bound to (or Internal for internal networks) and the Frame Type if appropriate. Linux supports 802.3, 802.2, 802.2 SNAP and DIX (Blue Book) ethernet framing for IPX.`

- ipx_route

`Table holding a list of IPX routes. For each route it gives the destination network, the router node (or Directly) and the network address of the router (or Connected) for internal networks.`


