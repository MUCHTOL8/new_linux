# wireshark-info.md

> dv0: Setting up and configuring wireshark filters and columns.

Wireshark's default columns are:

    No. -Frame number from the beginning of the pcap. The first frame is always 1.
    Time - Seconds broken down to the nanosecond from the first frame of the pcap. The first frame is always 0.000000.
    Source - Source address, commonly an IPv4, IPv6, or Ethernet address.
    Destination - Destination address, commonly an IPv4, IPv6, or Ethernet address.
    Protocol - Protocol used in the Ethernet frame, IP packet, or TCP segment (ARP, DNS, TCP, HTTP, etc.).
    Length - Length of the frame in bytes.


In my day-to-day work, I require the following columns in my Wireshark display:

    Date & time in UTC
    Source IP and source port
    Destination IP and destination port
    HTTP host
    HTTPS server
    Info

Hiding Columns
We can easily hide columns in case we need them later. Right-click on any of the column headers to bring up the column header menu. Then left-click any of the listed columns to uncheck them. Figure 2 shows the No., Protocol, and Length columns unchecked and hidden.


Removing Columns
Because I never use the No., Protocol, or Length columns, I completely remove them. To remove columns, right-click on the column headers you want to remove. Then select "Remove this Column..." from the column header menu.


Adding Columns
To add columns in Wireshark, use the Column Preferences menu. Right-click on any of the column headers, then select "Column Preferences..."
The Column Preferences menu lists all columns, viewed or hidden. Near the bottom left side of the Column Preferences menu are two buttons. One has a plus sign to add columns. The other has a minus sign to remove columns. Left-click on the plus sign. An entry titled "New Column" should appear at the bottom of the column list.
Double-click on the "New Column" and rename it as "Source Port." The column type for any new columns always shows "Number." Double-click on "Number" to bring up a menu, then scroll to "Src port (unresolved)" and select that for the column type.
Our new column is now named "Source Port" with a column type of "Src port (unresolved)." Left-click on that entry and drag it to a position immediately after the source address.
After the source port has been, add another column titled "Destination Port" with the column type "Dest port (unresolved)."
Like we did with the source port column, drag the destination port to place it immediately after the Destination address.  When you finish, your columns should appear as shown in Figure 10.
After adding the source and destination port columns, click the "OK" button to apply the changes. These new columns are automatically aligned to the right, so right-click on each column header to align them to the left, so they match the other columns.
In my day-to-day work, I often hide the source address and source port columns until I need them.



Changing Time to UTC
To change the time display format, go the "View" menu, maneuver to "Time Display Format," and change the value from "Seconds Since Beginning of Capture" to "UTC Date and Time of Day." Use the same menu path to change the resolution from "Automatic" to "Seconds." Figure 13 shows the menu paths for these options.



Adding Custom Columns
While we can add several different types of columns through the column preferences menu, we cannot add every conceivable value. Fortunately, Wireshark allows us to add custom columns based on almost any value found in the frame details window. This is how we add domain names used in HTTP and HTTPS traffic to our Wireshark column display.
To quickly find domains used in HTTP traffic, use the Wireshark filter http.request and examine the frame details window.
In the frame details window, expand the line titled "Hypertext Transfer Protocol" by left clicking on the arrow that looks like a greater than sign to make it point down. This reveals several additional lines. Scroll down to the line starting with "Host:" to see the HTTP host name. Left click on this line to select it. Right click on the line to bring up a menu. Near the top of this menu, select "Apply as Column." This should create a new column with the HTTP host name.a
To find domains used in encrypted HTTPS traffic, use the Wireshark filter ssl.handshake.type == 1 and examine the frame details window.
In the frame details window, expand the line titled "Secure Sockets Layer." Then expand the line for the TLS Record Layer. Below that expand another line titled "Handshake Protocol: Client Hello."
Below the "Handshake Protocol: Client Hello" line, expand the line that starts with "Extension: server_name." Under that is "Server Name Indication extension" which contains several Server Name value types when expanded. Select the line that starts with "Server Name:" and apply it as a column. Figure 18 shows an example.
With this customization, we can filter on http.request or ssl.handshake.type == 1 as shown in Figure 20. This gives us a much better idea of web traffic in a pcap than using the default column display in Wireshark.



Summary
This tutorial covered the following areas:

    Web traffic and the default Wireshark column display
    Hiding columns
    Removing columns
    Adding columns
    Changing time to UTC
    Custom columns





Display Filters Setup:
Type in the filter into the bar and then click the "+" button to the right of the filter bar.
Then add a name for the filter in the label box and click save.
You can add a comment so you know what the filter should be used for.
A button will be saved to the right of the filter bar that you can click to enable that filter. Only the most recent button you have clicked will be enabled.
Keep in mind the Wireshark display filter is case-sensitive.

- basic

`(http.request or ssl.handshake.type == 1) and !(udp.port eq 1900)`

- basic +

`(http.request or ssl.handshake.type == 1 or tcp.flags eq 0x0002) and !(udp.port eq 1900)`

- basic+DNS

`(http.request or ssl.handshake.type == 1 or tcp.flags eq 0x0002 or dns) and !(udp.port eq 1900)`






    Equals: == or eq
    And: && or and
    Or: || (double pipe) or or

Examples of these filter expressions follow:

    ip.addr eq 192.168.10.195 and ip.addr == 192.168.10.1
    http.request && ip.addr == 192.168.10.195
    http.request || http.response
    dns.qry.name contains microsoft or dns.qry.name contains windows

When specifying a value exclude, do not use != in your filter expression. For example, if you want to specify all traffic that does not include IP address 192.168.10.1, use !(ip.addr eq 192.168.10.1) instead of ip.addr != 192.168.10.1 because that second filter expression will not work properly.



Some infection traffic uses common protocols that can easily be decoded by Wireshark.

Figure 11 shows post-infection traffic caused by this malware executable that generates FTP traffic.

Realizing this is FTP traffic, you can pivot on ftp for your display filter as shown in Figure 12. When filtering on ftp for this pcap, we find the infected Windows host logged into an FTP account at totallyanonymous.com and retrieved files named fc32.exe and o32.exe. Scroll down to later FTP traffic as shown in Figure 13, and you will find a file named 6R7MELYD6 sent to the FTP server approximately every minute. Further investigation would reveal 6R7MELYD6 contains password data stolen from the infected Windows host.


In addition to FTP, malware can use other common protocols for malicious traffic. Spambot malware can turn an infected host into a spambot designed to send dozens to hundreds of email messages every minute. This is characterized by several DNS requests to various mail servers followed by SMTP traffic on TCP ports 25, 465, 587, or other TCP ports associated with email traffic.

- If you use smtp as a filter expression, you'll find several results. In cases where you find STARTTLS, this will likely be encrypted SMTP traffic, and you will not be able to see the email data.

`smtp`

- When viewing spambot traffic, you'll find DNS queries to mail servers and TCP traffic to SMTP-related ports as previously described.

- Using the filter: (http.request or ssl.handshake.type == 1 or tcp.flags eq 0x0002 or dns) an    d !(udp.port eq 1900)

`Wireshark filtered on spambot traffic to show DNS queries for various mail servers and TCP SYN packets to TCP ports 465 and 587 related to SMTP traffic.`

- In recent years, email traffic from spambots is most likely encrypted SMTP.  However, you might find unencrypted SMTP traffic by searching for strin
gs in common email header lines like:
`smtp contains "From: "`
`smtp contains "Message-ID: "`
`smtp contains "Subject: "`

