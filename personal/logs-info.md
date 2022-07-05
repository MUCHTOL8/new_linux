#logs-info

> Some quick commands for checking security.

Check: cron, dmesg, faillog, firewalld, lastlog.
Nearly all logs are in /var/log.
syslog gathers logs from all over, so view that.


- ufw - rsyslog must be running for UFW logging to work.

`less /var/log/ufw.log`

`to check rsyslog status`
`sudo service rsyslog status`
`sudo ufw status verbose`
`sudo ufw logging on`
`sudo ufw logging (off, low, medium, high, full)`

- last - provides a list of all users who have authenticated to this system.

`last`
`last displays the /var/log/wtmp which is a binary file.`

- lastlog - (Currently broke) Shows the last time each user was authenticated to the system.

'lastlog'
'lastlog displays /var/log/lastlog which is a binary file'

- journalctl - Show systemd logs which are a replacement for syslog logs. Often you'll start a service in a different terminal while watching journalctl -f on a different terminal.

'journalctl'
'journalctl displays /var/log/journal which is binary'
'journalctl -f'

- syslog - contains generic system activity logs 

`cat /var/log/syslog`

- bootstrap.log - logs actions taken during boot & errors/warnings encountered during boot.

`cat bootstrap.log`

- faillog - Show the number of attemps to login, by whom, and when.

`faillog -a`
`faillog -h to customize login delay or complete block after x # of attempts`


- Creates a log and sends to journal. Often used for troubleshooting.

'logger {{some message}}'



    utmp will give you complete picture of users logins at which terminals, logouts, system events and current status of the system, system boot time (used by uptime) etc.
    wtmp gives historical data of utmp.
    btmp records only failed login attempts.




The w and who commands pull information about who’s logged in and what they’re doing from the /var/run/utmp file.

`who`



The last command provides how they logged in, when they logged in and when they logged out etc info on the screen

'last'

We can also use the last command to read the content of the files wtmp, utmp and btmp as well.

`last -f /var/log/wtmp    ### To open wtmp file and view its content use blow command.`
`last -f /var/run/utmp    ### To see still logged in users view utmp file use last command.`
`last -f /var/log/btmp    ### To view btmp file use same command.`

You can review the current history of logged sessions contained within /var/run/btmp by typing:

`lastb`


utmpdump command for reading the binary log files.

`utmpdump {{/path/to/binary}}`

`utmpdump /var/run/utmp`
`utmpdump /var/log/wtmp`
`utmpdump /var/log/btmp`


dpkg.log shows what the package mangaers have been up to for the last week.

`cat /var/log/dpkg.log`



- Show processes that opened a local internet port.

`sudo lsof -i`
`if it has a * then is is accessible from the outside, otherwise it's viewable only locally`
`open web browser and see what the service is doing. Type in the ip address.`





`tail -f /var/log/auth.log`

`tail -f /ufw.log`


