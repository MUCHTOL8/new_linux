# chmod-info

> dv2: change users and groups permissions to read, write, execute, delete, search for the directory, and other things.

RELATED COMMANDS:
chown
umask
chgrp
stat



READING ls -l FILE PERMISSIONS.

File Types:
Starting from the extreme left, the first character/symbol indicates the file type. 
A hyphen (-) indicates that the file is a regular file. 
The symbol d indicates that it is a directory. 
Symbol l indicates that it’s a symbolic link.

File Permissions:
The remaining nine characters are segmented into 3 triplet
the first segment points to the owner permissions, 
the second indicates the group permissions and 
the last portion specifies the permissions that other users



CHMOD FILE REFERENCE
A convenient way of assigning file permissions is using a reference file.
Use of the –reference=ref_file option to set the permissions of a file to be the same as those of another reference file.

CHMOD FILE REFERENCE EXAMPLES
chmod –reference=file1.txt file2.txt     (set file permissions of file2.txt to be the same as those of file1.txt )


CHMOD'S 2 MODES with EXAMPLES
chmod changes the file mode bits of each given file according to mode.
The mode can be either symbolic or octal number.
- a symbolic representation of changes to make (ex. wrxXst)
OR 
- an octal number representing the bit pattern for the new mode bits. (ex. 755)

Multiple symbolic modes can be given seperated by commas. (chmod u=rwx,g=rw,o=r {{filename}} )



SYMBOLIC MODE

u = user who owns file/directory
g = other user's in the file's group
o = other user's not in the files group
a = all users
If none of these are given, the effect  is  as  if  (a)  were given, but bits that are set in the umask (user mask i.e. u=755) are not affected.

+ = add the file mode bits that come after the +
- = remove the file mode bits that come afte the -
= = add the file mode bits that come after the = and remove all existing bits EXCEPT any unmentioned user and group ID bits are unaffected.

r = read
w = write
x = execute (or search for directories)
X = execute or search only if the file is a directory OR already has execute permissions for some user.
s = set user or group ID on execution
t = restricted deletion flag (sitcky bit)

SYMBOLIC MODE EXAMPLES:
chmod ugo-w    (sets the write bit for: file owner, group of file owner, and all others)
chmod a+X *    (sets execute permissions on all directories in the current directory)
chmod o=       (remove all permissions of other users)
chmod o-rwx    (remove all permissions of other users)
chmod ug+x     (add execute commands to the owner and the group of the owner of the file)
chmod -R a=,+rwX dir   (Set file permissions of DIR and subsidiary files to be the umask default, assuming execute permissions for directories and for files already executable.)
chmod =rwx,g+s file    (Allow everyone to read, write, and execute the file and turn on the set group-ID)




NUMERIC MODE
A  numeric  mode is from one to four octal digits (0-7), derived by adding up the bits with values 4, 2, and 1.
Omitted digits are assumed to be leading zeros.

The first  digit: changes the file exector's User ID or group ID to that of the file's creator's ID or the file's group ID, and restricts file deletion or file name being changed.
Using (4) selects the set user ID, (2) selects the set group ID, and (1) selects the restricted deletion/sticky attributes.

The Unix access rights flags setuid and setgid (short for "set user ID" and "set group ID") allow users to run an executable with the file system permissions of the executable's owner or group respectively and to change behaviour in directories. They are often used to allow users on a computer system to run programs with temporarily elevated privileges in order to perform a specific task such as use the the ping command or change one's own password.

The second digit: sets permissions for the file's owner.
the third  digit: sets permissions for other users in the file's group.
the fourth digit: sets permissions for other users not in the file's group.
Using (4) selects read, (2) selects write, (1) selects execute.

NUMERIC MODE EXAMPLEs:
chmod 644 foo       (Change file permissions of file to be world readable and user writable, WITH NO OTHER PERMISSIONS (it erases previous perms.)
chmod a=r,u+w foo   (above's symbolic equivalent)

chmod +110 file     (Add user and group execute permissions to file.)
chmod ug+x file     (above's symbolic equivalent)

chmod 1750 file     ( (1)restricts file deletion except by user or admin, (7)full rwx to user, (5)rx for group, and (0)no perms for everyone else)
chmod 6711 file     (sets anyone who executes the file (or dir) as both the user who created the file and the group to which the file belongs so they (the executor) will have those same permissions as the person who created the file and the group to which the file belongs AND then it gives file permissions to ugo each in turn).



RECURSIVE ASSIGNMENT
When assigning permissions to directories, use the -R flag to recursively assign permissions to its files and subfolders.
chmod 755 -R /home/Documents/
chmod u+wrx, go+



RESTRICTED DELETION FLAG OR STICKY BIT
       The  restricted  deletion  flag or sticky bit is a single bit, whose interpretation depends on the file type.  For directories, it prevents
       unprivileged users from removing or renaming a file in the directory unless they own the file or the directory;  this  is  called  the  re‐
       stricted  deletion  flag for the directory, and is commonly found on world-writable directories like /tmp.  For regular files on some older
       systems, the bit saves the program's text image on the swap device so it will load more quickly when run; this is called the sticky bit.



SYMBOLIC LINKS
chmod never changes the permissions of symbolic links; the chmod system call cannot change their permissions. This is not a problem  since the permissions of symbolic links are never used. However, for each symbolic link listed on the command line, chmod changes the permisions of the pointed-to file. In contrast, chmod ignores symbolic links encountered during recursive directory traversals.


OPTIONS
The options are most useful when you are changing/processing many files. They can either keep errors from being thrown in your face or they can report back every change that was made to a file, and many several other things. Read their descriptions below.
-f, --silent, --quiet	suppress most error messages
-v, --verbose	output a diagnostic for every file processed
-c, --changes	like verbose but report only when a change is made
-c, --reference=RFile	use RFile's mode instead of MODE values
-R, --recursive	change files and directories recursively
--help	display help and exit
--version	output version information and exit

