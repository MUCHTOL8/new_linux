# apport-info

> Information about, and a guide to using, apport - a system crash data collection daemon.

Apport itself is running at all times because it collects crash data for whoopsie (see ErrorTracker). However, the crash interception component is still disabled. To enable it permanently, do:

sudo nano /etc/apport/crashdb.conf

... and add a hash symbol # in the beginning of the following line:

        'problem_types': ['Bug', 'Package'],

To disable crash reporting just remove the hash symbol. i


In order to keep the delay and CPU/IO impact as low as possible, /usr/share/apport/apport only collects data which has to be acquired while the crashed process still exists: information from /proc/pid, the core dump, the executable path, and the signal number. The report is written to /var/crash/executable_path.uid.crash. 

Full details are at the URL:
https://wiki.ubuntu.com/Apport
