# osimodel-explanation

> An exlplanation of OSI (Open Systems Interconnect) model of networking.


===============================================
============== OSI Introduction ===============
===============================================

A protocol is a set of instructions that should be strcitly followed when carrying out a task. If the instructions are absolutely adhered to then successful completion of the task should be the result. In the world of networking there are many tasks that must be completed in order for two seperate machines to share resources (such as data, processing power, storage space, graphics displays, etc) or for even basic communication. These protocols each have their own number and are refered to as RFCs (Request For Comment). By searching for a specific RFC number you can find the very detailed explanation of steps to be followed when creating any sort of networking hardware (device) or software designed to interact with a networking device.
The OSI model groups/categorizes protocols by their functionality. Therefore you can know which layer of the OSI model a protocol belongs in by it's purpose (ie file sharing). These protocols can have layer overlap. In other words, one protocol can have functionalitiy that falls into one layer and another functionality that falls into another (usually adjecent) layer. By this we can see that the OSI networking model's isn't meant to be a perfect grouping of protocols but rather has the intent of grouping protocols for (1.)easier communication about the protocols and (2.)faster memorization of the protocols and the types of functionalities they provide.


===============================================
====== Where and When Protocols are used ======
===============================================

    Layer 5, 6, & 7 protocol functionality is built into user-space applications. These protocols specify how to program the interfaces (APIs) needed to connect one feature with another. Which protocols are used (referenced) depends on what capabilities you would like your application to have as well as what network resources you'd like to access or make available over a network.
    Layer 2.5, 3, & 4 protocol functionality is built into operating systems on personal computers.
    Layer 1, & 2 are usually referenced when a manufacture is building a wifi adapter / Network Interface Card (NIC). 
  

===============================================
======= OSI Protocol Layer Descriptions =======
===============================================

>     Layer 7 
      - Applications will also control end-user interaction, such as security checks (for example, MFA), identification of two participants, initiation of an exchange of information.
      - They all facilitate the communication of information
      - Isn't as narrowly defined as the other layers but could be summarized as any functionality that allows applications to access or give acccess to system resources over a network. This could be someting like reading/writing/copying/deleting a file, shell access such as through a terminal eulator, keyboard/mouse/graphics sharing, etc. 
    - A note: if a protocol doesn't seem to fit into any other layer then it likely belongs in layer 7.
    - Here are some Layer 7 problems to watch out for:
    All issues on previous layers
    Incorrectly configured software applications
    User error (... we’ve all been there) 

>    Layer 6
    - Takes care that the data is sent in such a way that the receiver 
    - (1)  will understand the information (data) (encoding)
    - and (2) will be able to use the data efficiently and effectively (syntax).

    - Encodes from the user-dependent format into a standardized format and back again.
    There are three data formatting methods to be aware of:

    American Standard Code for Information Interchange (ASCII): this 7-bit encoding technique is the most widely used standard for character encoding. One superset is ISO-8859-1, which provides most of the characters necessary for languages spoken in Western Europe.
    Extended Binary-Coded Decimal Interchange Code (EBDCIC): designed by IBM for mainframe usage. This encoding is incompatible with other character encoding methods.
    Unicode: character encodings can be done with 32-, 16-, or 8-bit characters and attempts to accommodate every known, written alphabet.

    - Compression/decompression to save bandwidth and increase data throughput.
    - Character code translation
    - Data conversion, provides interoperability between systems with different encoding methods (windows/mac).
    - Encryption and Decryption
    - This functionality is not always implemented in a network protocol.
    SSL or TLS encryption protocols.
    -  Here are some Layer 6 problems to watch out for:
    Non-existent or corrupted drivers
    Incorrect OS user access level


 >   Layer 5 
    - From here on out (layer 5 and up), networks are focused on ways of making connections to end-user applications and displaying data to the user.
    - A session is a mutually agreed upon connection that is established between two network applications. Not two nodes! Nope, we’ve moved on from nodes. They were so Layer 4. 
    - Starts, stops, provides error recovery at the application level via checkpoints (tags)
    - Prevents simultaneous attempts of critical operations via tokens
    - synchronizes information from different sources
    - controls multiple connections for each-end user application
    - and cleans up after sessions BETWEEN END-USER APPLICATIONS.
    - Is usually a part of the applications themselves and uses remote procedure calls (RPCs).
    - Here are some Layer 5 problems to watch out for:
    Servers are unavailable
    Servers are incorrectly configured, for example Apache or PHP configs
    Session failure - disconnect, timeout, and so on.

>    Layer 4 
    - Packet error correction and detection.

>    Layer 3 
    - Inter-network packet path selection.
    - Inter-network device discovery.

>    Layer 2 
    - Chunks data into smaller consistent size groupings.
    - Tags and checks LAN addressing.
    - LAN device discovery.

>    Layer 1 
    - Specifies codes for electrical/radio wave transmissions, as well as mechanical and electrical device specs.

>    Layer Dependencies 
    - Higher layers are ALWAYS reliant upon lower layers, both when sending and receiving. 
    -  Lower layers can do with or without higher layers depending on the purpose of the network connection.

