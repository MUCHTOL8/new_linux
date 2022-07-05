# crontab-info

> Guide to using crontab to edit the CRON files to automate scripts.




- Create cron files in /var/spool/cron directory.

`crontab -e`


The directory /etc/cron.d is for system-level jobs run by various users. 
It is where some applications install cron files when there are no users under which the programs would run.
Many Linux SysAdmins prefer using the cron.d directory for cron files over the older crontab system of managing cron files located in /var/spool/cron.
The cron files located in /etc/cron.d have the same format as a regular cron file.
Files located in the cron.d directory are run in alphanumeric sort order. That is the reason that the 0hourly file has a zero at the beginning of its name, so that it runs first.
One of the drawbacks of the crontab system of managing cron jobs is the fact that some users have used a standard editor to alter the files. This method does not inform the crond
daemon of the changes so the altered cron file is not activated until crond is restarted. This is not the case with the cron files located in /etc/cron.d as the file modification times are
checked every minute by crond.


All cron files are empty the first time you edit it so you must create it from scratch.

#-----------------------------------------------------------------------------------------
#-----------------------------------| CRON FILE TEMPLATE |--------------------------------
#-----------------------------------------------------------------------------------------

# crontab -e
SHELL=/bin/bash
MAILTO=root@example.com
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

#For details see man 4 crontabs
#Example of job definition:
#.---------------- minute (0 - 59)
#| .------------- hour (0 - 23)
#| | .---------- day of month (1 - 31)
#| | | .------- month (1 - 12) OR jan,feb,mar,apr ...
#| | | | .---- day of week (0-6)(Sunday=0 or 7)(sun,mon,tue,wed,thu,fri,sat)
#| | | | |
#* * * * * user-name command to be executed

# backup using the rsbu program to the internal HDD then the external USB HDD
01 01 * * * /usr/local/bin/rsbu -vbd1 ; /usr/local/bin/rsbu -vbd2
# Set the hardware clock to keep it in sync with the more accurate system clock
03 05 * * * /sbin/hwclock --systohc
# Perform monthly updates on the first of the month
25 04 1 * * /usr/local/bin/doit


#-----------------------------------------------------------------------------------------
#-----------------------------------| TEMPLATE END |--------------------------------------
#-----------------------------------------------------------------------------------------
#--------------------------------| FURTHER EXPLANATION |----------------------------------
#-----------------------------------------------------------------------------------------

- The SHELL variable specifies the shell to use when commands are executed. 

`SHELL=/bin/bash`

- The MAILTO variable sets the email address to which cron job results will be sent. These emails can provide the status of backups, updates, or whatever, and consist of the output from the programs that you woiuld see if you ran them manually from the command line.

`MAILTO=root@example.com`

- The PATH variable sets up the PATH for this environment. Regardless of teh path set here, however, I always like to prepend the fully qualified path to each executable.

`PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin`
#------------------------------------------------------------------------------------------
#-------------------------------| CRONTAB FILES - ADVANCED CAPABILITIES |------------------
#------------------------------------------------------------------------------------------
`.`
#--------------------------- Script 1
My bash shell scripts, rsbu, to perform backups of all my systems.

- This line in /etc/crontab runs a script that performs daily backups for my systems.

`01 01 * * * /usr/local/bin/rsbu -vbd1 ; /usr/local/bin/rsbu -vbd2`

- This job is kicked off at 1 minute after 1 a.m. every day.

`01 01`

- The splat/star/asterisks (*) in positions 3, 4, and 5 of the time specification are like file globs for those time divisions;

`* * *`

- This line runs my backups twice; once to backup onto an internal dedicated backup hard drive, and once to backup onto an external USB hard drive that I can take to the safe deposit box.

`/usr/local/bin/rsbu -vbd1 ; /usr/local/bin/rsbu -vbd2`

#---------------------------- Script 2
- This line sets the hardware clock using the system time as the source.

`03 05 * * * /sbin/hwclock --systohc`

- This sets it to run at 3 minutes after 5 a.m. every day.

`03 05 * * *`

- This sets the hardware clock on the computer using the system clock as the source of an accurate time.

`/sbin/hwclock --systohc`

#---------------------------- Script 2
- This line performs our updates at 04:25 a.m. on the first day of each month.

`25 04 1 * * /usr/local/bin/doit`

- The cron service has no option for “The last day of the month,” so we use the first day of the following month.

`25 04 1 # #`








