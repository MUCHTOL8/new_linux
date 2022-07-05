# journalctl-info

> User Manual for journalctl.

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

