# ps-info

> ps user manual (Process Status) - view info realted with running processes.

It reads the process information from the virtual files in /proc file-system. /proc contains virtual files, this is the reason it’s referred as a virtual file system.
https://www.man7.org/linux/man-pages/man1/ps.1.html

EXAMPLE - USEFUL PS FLAGS
`ps --headers -eo pid,pcpu,pmem,comm --sort cputime | tail -20`
`ps --headers -eo pid,pcpu,pmem,comm --sort %mem | tail -20`

EXAMPLE EXPLANATION
--headers = show headers on each page
-eo = expected output
pid = pid
pcpu = cpu usage percentage
pmem = memory usage percentage
--sort = which criteria output should be ordered by.
cputime = amount time process has been run by cpu from lowest to highest in descending order
%mem = like cputime but for current memory usage.
| = pipe output to tail
tail -20 = show the last 20 lines of pipe ps command.



#---------------------------------------------------------------------------------------------
------------------------------------  |STARTER COMMANDS| ------------------------------------
#---------------------------------------------------------------------------------------------

- A few of good ps flag groups.

`ps afx`
`The f flag gives the output a tree layout.`
`ps aux`
`The u flag provides more details about the processes.
`ps -elf`
`Gives the many columns and therefor much information`

- Display process for the current shell.

`ps`

- View all the running processes

`ps -A`
`OR`
`ps -e`

- View all processes except session leaders and processes not associated with a terminal.

`ps -a`
`A session leader is a process that kicks off other processes. The process ID of the first process of any session shares the same session ID. A unique session is assigned to every process group. `

- View all the processes except session leaders

`ps -d`

- View all processes except those that fulfill the specified conditions (negates the selection).

`ps -a -N`
`OR`
`ps -a --deselect`
`Above Example: These only the session leader and processes not associated with a terminal.`

- View all processes associated with this terminal.

`ps -T`

- View all the running processes.

`ps -r`

- View all processes owned by you. i.e. processes with same EUID as the ps command you enter.

`ps -x`


#---------------------------------------------------------------------------------------------
-------------------------------  |PROCESS SELECTION BY LIST|  --------------------------------
#---------------------------------------------------------------------------------------------

Get some specific processes listed. The following 8 options accept a single argument in the form of a blank-separated or comma-separated list. 

For example: ps -p {{“1 2” -p 3,4}}

There are Multiple ways of accomplishing this:

- 1. Select the process by the command name. This selects the processes whose executable name is given in cmdlist. There may be a chance you won’t know the process ID and with this command it is easier to search.

`ps -C {{command_name}}`
`ex: ps -C dhclient`

- 2. Select by group ID or name. The group ID identifies the group of the user who created the process.

`ps -G {{group-name}}`
`OR`
`ps --Group {{group_name}}`
`ex: ps -G root`

- 3. View by group id.

`ps -g {{group_id}}`
`OR`
`ps -group {{group_id}}`
`add a 1 before the group id(s) you want. A glitch causes it to not show the first parameter.`
`ex: ps -g 1`

- 4. View process by process ID (PID).

`ps -p {{process_id}}`
`OR`
`ps p {{process_id}}`
`NOTE: p and -p give somewhat different outputs/columns.`
`OR`
`ps --pid {{process_id}}`
`ex: ps -p 27223`

- View multiple processes by specifying multiple process IDs separated by a blank or comma.

`ex: ps -p {{1 904 27223}}`

- 5. Select by parent process ID. By using this command we can view all the processes owned by parent process except the parent process.

`ex: ps -p {{766}}`
`In above example process ID 766 is assigned to NetworkManager and below shows the parent process for dhclient with process ID 19805.`
`ex: ps -ppid 766`

- 6. View all the processes belonging to any session ID(s) you list.

`ps -s {{session_id}}`
`OR`
`ps --sid {{session_id}}`
`ex: ps -s 1248`

- 7. Select by tty.

`ps t {{tty}}`
`OR`
`ps -t {{tty}}`
`OR`
`ps --tty {{tty}}`
`ex: ps -t pts/0`

- 8. Select by effective user ID or name.

`ps U {{user_name/ID}}`
`OR`
`ps -U {{user_name/ID}}`
`OR`
`ps -u {{user_name/ID}}`
`OR`
`ps –User {{user_name/ID}}`
`OR`
`ps –user {{user_name/ID}}`
`ex: ps -u dv`


#---------------------------------------------------------------------------------------------
----------------------------------  |Output Format control|  ---------------------------------
#---------------------------------------------------------------------------------------------

Choose the information displayed by ps. The following options can be combined with any other options such as e, u, p, G, g.

- 1. Use -f to view full-format listing.

`ps -af`

- 2. Use -F to view Extra full format.

`ps -F`

- 3. To view process according to user-defined format.

`ps --format column_name`
`ps -o column_name`
`ps o column_name`
`ex: ps -aN --format cmd,pid,user,ppid`
`example gives columns: command, process ID, username and parent process ID`

- 4. View in BSD job control format.

`ps -j`

- 5. Display BSD long format.

`ps l`

- 6. Add a column of security data.

`ps -aM`

- 7. View command with signal format.

`ps s 766`

- 8. Display user-oriented format.

`ps u 1`

- 9. Display virutal memory format.

`ps v 1`

- 10. See environment of a command.

`ps ev 766`

- 11. View processes using highest memory.

`ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem`

- 12. Print a process tree.

`ps --forest -C sshd`
`ps -f -C sshd`
`ps -H`

- 13. List all threads for a particular process.

`ps -C sshd -L`
`This doesn't work because the BSD syntax is unsupported in Ubuntu.`

- 14. Set screen width.

`ps --cols {{n}}`
`OR`
`ps --columns {{n}}`
`ps --width {{n}}
- 15. Include some dead child process data (as a sum with the parent).

`ps -- cumulative`

- 16. Show the environment.

`ps e`

- 17. Don't print headers, unless BSD personality is selected, then it's 1 header per page.

`ps h`

- 18. Show the true command name; from exec file rather than argv value thus won't show args).

`ps c`

- 19. Set screen height.

`ps --lines {{n}}`
`ps --rows {{n}}`

- 20. Specify sorting order. (Identical to --sort and -O)

`Choose a multi-letter key from the STANDARD FORMAT SPECIFIERS section.`
`The + key is unnecessary since default direction is increasing numerical or lexicographic order.`
`Sorting syntax is [+|-]key[,[+|-]key[,...]].

`ps k {{+|-format specifier list}}`
`ps -O {{+|-format specifier list}}`
`ps --sort {{+|-format specifier list}}`
`example: ps jaxkuid, -ppid, +pid`
`example: ps axk comm o comm, args`
`example: ps kstart_time -ef`
`example: ps jax --sort=uid,-ppid,+pid`

- 21. Numeric output for WCHAN and USER (including all types of UID and GID)

`ps n`

- 22. Print no header line at all. --no-heading is an alias for this option.

`ps --no-headers`

- 23. Sum up some information, such as CPU usage, from dead child processes into their parent. This is useful for examining a system where a parent process repeatedly forks off short-lived children to do work.

`ps S`

- 24. Wide output. Use this option twice for unlimited width.

`ps -w`
`OR`
`ps w`
`ps ww`
`ps -ww`










#---------------------------------------------------------------------------------------------
-----------------------------------  |UNDERSTANDING OUTPUT|  ---------------------------------
#---------------------------------------------------------------------------------------------

OUTPUT HEADERS
PID – the unique process ID
TTY or TT – Controlling terminal associated with the process
TIME – 00:00:00 indicates that the kernel hasn't alloted any CPU time to the process.
CMD – name of the command that launched the process.
RSS - Resident set size, the non-swapped physical memory that is used.
VSZ or SZ - Virtual memory usage of the process.
%CPU - CPU time used divided by the process run time.
%MEM - Ratio of the process's resident set size to the physical memory on the machine.
START or STIME - Start time of the Process.
C or CP - CPU Usage and scheduling information.
ADDR - Memory address of a process.
NI - 'nice' value.
F - Flags.
PPID - ID number of the process's parent process.
PRI - Priority of the process.
WCHAN - Memory address of the event the process is waiting for.
STAT or S - Process State Code
`.`
`.`
OUTPUT FIELD EXPLANATION
TTY - ? = not attached to a TTY 
ex: Kernel Processes
C - .......
ex: .......
PRI - ......
ex: ......



`.`
`.`
----------------------------PROCESS STATE CODES
D    Iuninterruptible sleep (usually IO)
I    Idle kernel thread
R    running or runnable (on run queue)
S    interruptible sleep (waiting for an event to complete)
T    stopped by job control signal
t    stopped by debugger during the tracing
W    paging (not valid since the 2.6.xx kernel)
X    dead (should never be seen)
Z    defunct ("zombie") process, terminated but not reaped by its parent
The Process State Code are the values you'll find under the "STAT" and "S" headers when you use the s, stat, and state output specifiers (flags). They describe the state of a process.    
`.`
`.`
#---------------------------------------------------------------------------------------------
---------------------------|  DEEPER EXPLANATION OF STATE CODES| -----------------------------
#---------------------------------------------------------------------------------------------

- Uninterruptible sleep (D)

`Processes that cannot be killed or interrupted with a signal. A process enters such a state if it deals with I/O. If a process, when waiting for an I/O receives a signal to terminate, it will terminate before having the chance to handle the requested data. Since the process is blocked performing a system call, the process cannot be interrupted until the system call completes and the result is handled. When a process enters this state, there is no trivial way to kill the process except for rebooting. A process can be in this state when it is in the waiting stage in the process lifecycle.`

- Idle (I)

`The idle state is mainly to reduce energy consumption. In Linux, one idle task is created for every processor by default and is locked to that processor, when there’s no other process to run on a CPU, the idle task is scheduled.`

- Running /Runnable(R)

`Running process is currently the process that is being executed on the CPU. The runnable process is waiting in the queue and is in the ready state, meaning it has all it needs to be run and is waiting for a CPU core to execute it. The state corresponds to the running stage in the process life cycle.`

- Interruptable Sleep (S)

`When a process enters this state, it will wake up to handle any signals. A process usually enters this state when it is waiting for an event to complete, for instance, a user input. The event that is waiting for is not a system call if that is the case, the process enters an uninterruptable sleep state. A process can be in this state when it is in the waiting stage in the process lifecycle.`

- Stopped (T)

`A process enters this state when it is stopped or suspended manually. I will discuss include more details about the types of signals in the second part. This state corresponds to the terminated stage in the process life cycle.`

- Defunct/Zombie (Z)

`It is a process that is done executing, but still has an entry in the process table. If the child process has completed execution and is in a terminated state but the parent hasn’t read the exit status with the wait system call yet, then the child process enters the zombie state. An entry for the child still exits in the process table to facilitate the read of the exit status by its parent. Once the parent reads the exit status, the process is reaped and the child is no longer a zombie. A process can be in this state when it is in the terminated stage in the process lifecycle.`

`Processes that stay zombies for a long time are generally an error and they can cause a resource leak.`
`.`
`.`
#--------------------------------------------------------------------------------------------
------------------------------------  |PROCESS LIFECYCLE| -----------------------------------
#--------------------------------------------------------------------------------------------

        Created       Terminated
	       |            /   
	       |     Running
	       |    /       \
	       |   /         \
	    Waiting----------Blocked
	       |                |
	       |                |
	       |                |
	  Swapped out      Swapped out
	  and waiting      and blocked


- CREATED

`When a process is created, it enters a new or created state and waits to be promoted into the ready state`

- READY/WAITING

`When the process is loaded into the main memory, it enters the ready state. It is generally added to a queue or processes that are awaiting execution on a CPU.`

- RUNNING

`When a process is chosen by a CPU to serve, the process state is updated to running. The instructions of the process are executed by one of the CPUs. At any given time there is at most one running process on a CPU`

- BLOCKED

`If the process needs to access I/O or network resources or is waiting for user input, it enters into a blocked state and the processor serves a different process, if any until the current process received what it was waiting for.`

- TERMINATED

`A process is terminated either when it is done with its execution or is explicitly killed. A process that is gracefully terminated would no longer be in the process table.`



