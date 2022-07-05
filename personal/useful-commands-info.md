# useful-commmands-info

> A list of commands that shouldn't be forgotten.

    auditd -
    conntrack -
    oprofile -
    systemtap - (stap)
    strace - 
    xprop -
    ulimit -
    dpkg -s -
    

nmtui - network configuration
man hier - manual page documenting the linux file system hierarchy
ps_mem.py - python script displaying accurate process memory usage
su -i - changes you to the root user temporarily
ctrl + D - exits you from running as a different user.
chmod u+rwx {{file}} - give the owner read, write, execute permissions
cat /etc/resolv.conf - shows the dns conf file.
cat /etc/hostname - shows the hostname file
man sysctl.conf - 
https://www.youtube.com/watch?v=cFcmJKiftEo - how to create nice logging little system
apt-mark - useful apt command for setting packages to auto remove or hold from getting removed or added as well as any other package that might try and install that package will be halted or to only be manually removed.
cut -d "" -f2 | cut -d "-" -f1
Explains EVN_VARs - https://www.geeksforgeeks.org/environment-variables-in-linux-unix/
$ printenv //displays all the global ENVs
$ set //display all the ENVs(global as well as local)
$ env //display all the global ENVs
env - shows your shell environment for which ever shell you run the command on. Each process run from that shell inherits the  enviroment variables of that shell and can then modify them as it's own.
set - shows a list of the current system environment variables.
export - change your environment variables for this session.
echo ${{some_env_var}} - displays the value of a single env variable 
vim ~/.bash_profile - change your $PATH variable permanently.
< - send the contents of a file to program
man 2 time - gives you the second manual page for time which was created by the c programming language about the time function in the c programming language.
`` - commands inside back ticks work differently. look it up.
unlink - check this command out as well.
grep something * - search all the files in pwd for the word something INSIDE the file. Awesome!
grep something */* - searches pwd and all of the subdirectories for the word something INSIDE the file (but it doesn't tell you the name of the file... you'll just know that it exists somewhere in those dirs)
hardlinks?? when would i use one?? Hardlinks refer to the actual location on the hard drive, so if you wanted to be able to access some dir even if the original link gets removed, that would be one use. It will probably also have it's own set of file permissions.
partprobe - tells the OS to re-read the partition table.
tune2fs - change/configure filesystems once unmounted.
/etc/groups - the file where all the group stuff is stored
id {{user}} - tells you the groups they are in.
usermod - lock or unlock accounts or add/remove users from group
/etc/sudoers - file tells you what the wheel group members can do.
/etc/skel/ - new created users get every dir and file in this dir.
umask - the default permission given to files/dirs for the current user. Read by taking 0777 and subtracting the umask columns from the 0777
chcon - setting selinux permissions of a file/dir
restorecon - restoring a selinux permissions of a file/dir
ls -Z - shows the selinux permission of the file/dir
multitail -N 6 --mergeall -ic red auth.log -ic blue dmesg -ic green syslog -ic yellow messages-ic white mail.log -i daemon.log



On: YouTube
Linux Administration Full Course 2:20:00
Search: Linux Administration Jobs 


troff
groff
mdoc
udev - dynamic device management
systemd-udevd.service(8) - receives device uevents directly from the kernel whenever a devicce is added or removed fro mthe system or it changes its state.
