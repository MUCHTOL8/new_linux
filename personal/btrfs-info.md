# btrfs-info

> info on the btrfs file system; features and details.

btrfs wiki for more info:
https://btrfs.wiki.kernel.org/index.php/Main_Page

btrfs is a modern copy on write (CoW) filesystem for Linux aimed at implementing advanced features while also focusing on fault tolerance, repair and easy administration. Its main features and benefits are:

    Snapshots which do not make the full copy of files
    RAID - support for software-based RAID 0, RAID 1, RAID 10
    Self-healing - checksums for data and metadata, automatic detection of silent data corruptions 

Development of Btrfs started in 2007.
Btrfs is licensed under the GPL and open for contribution from anyone.




BTRFS's 2 biggest reasons for being created:

Other file systems don't handle scaling to large storage subsystems that are common in today's data centers. BTRFS can scale in it's ability to address and manage large storage.
Other file systems struggle to detect, repair, and tolerate errors in the data stored on disk.

 Major Features Currently Implemented

    Extent based file storage
    2^64 byte == 16 EiB maximum file size (practical limit is 8 EiB due to Linux VFS)
    Space-efficient packing of small files
    Space-efficient indexed directories
    Dynamic inode allocation
    Writable snapshots, read-only snapshots
    Subvolumes (separate internal filesystem roots)
    Checksums on data and metadata (crc32c, xxhash, sha256, blake2b)
    Compression (ZLIB, LZO, ZSTD), heuristics
    Integrated multiple device support
        File Striping
        File Mirroring
        File Striping+Mirroring
        Single and Dual Parity implementations (experimental, not production-ready) 
    SSD (flash storage) awareness (TRIM/Discard for reporting free blocks for reuse) and optimizations (e.g. avoiding unnecessary seek optimizations, sending writes in clusters, even if they are from unrelated files. This results in larger write operations and faster write throughput)
    Efficient incremental backup
    Background scrub process for finding and repairing errors of files with redundant copies
    Online filesystem defragmentation
    Offline filesystem check
    In-place conversion of existing ext2/3/4 and reiserfs file systems
    Seed devices. Create a (readonly) filesystem that acts as a template to seed other Btrfs filesystems. The original filesystem and devices are included as a readonly starting point for the new filesystem. Using copy on write, all modifications are stored on different devices; the original is unchanged.
    Subvolume-aware quota support
    Send/receive of subvolume changes
        Efficient incremental filesystem mirroring 
    Batch, or out-of-band deduplication (happens after writes, not during)
    Swapfile support
    Tree-checker, post-read and pre-write metadata verification
    Zoned mode support (SMR/ZBC/ZNS friendly allocation) 

 Features Currently in Development or Planned for Future Implementation

    DAX/persistent memory support
    The file/directory -level encryption support (fscrypt)
    fsverity integration 



***************Btrfs hands on: My first experiments with a new Linux file system**************
Variously called "B-Tree" or "Better" or even "Butter", here's what I found when I started to explore this 'fast-moving target' of a file system.


Variously called "B-Tree" or "Better" or even "Butter". 
Some features: It is possible to dynamically resize mounted filesystems, filesystems can span physical volumes, with optional RAID support, physical volumes can be added to and removed from mounted filesystems, compression option, snapshots (including read-only and read-write) and seeds.
So the first step is to get some kind of btrfs filesystem.  There are two ways to do this — create one (duh), or convert one (huh? really? cool!).  The simplest example would be creating a new btrfs filesystem within a specified disk partition, for example:

    mkfs.btrfs /dev/sda16

    Of course, this is the "old school" CLI approach, and the same thing can be done using most of the modern GUI disk management utilities, such as gparted:

    Alternatively, one can convert an existing ext3 or ext4 filesystem to btrfs.

    Important! There are a variety of limitations and restrictions on using btrfs for the root (/) and/or boot (/boot) filesystems. 

Do not go charging off and convert these kinds of critical filesystems to btrfs, because you will almost certainly be disappointed with the consequences. The kinds of things one might want to convert to btrfs are your home, work, data and other such additional filesystems.

It's possible to convert an existing ext3/ext4 filesystem to btrfs. The filesystem has to be unmounted, and should be checked (fsck) first.  The conversion command is simple:

    btrfs-convert /dev/sdXX

Replace the XX in the example above with the partition to convert


    When you talk about a distribution "including btrfs support", there are three very general levels possible:

    
    Include the btrfs-tools package.  This will give you the ability to create, convert, examine and manipulate btrfs filesystems.

    Include support for btrfs in the operating system installer utility.  This means that the root filesystem can be btrfs, and the installer takes responsibility for making sure that you can boot it somehow (see the next point)

    Include support for btrfs in the bootloader (grub, lilo or whatever). This means that your entire system can be btrfs all the way through, but it is not strictly necessary; as we have learned when other new filesystems have come along, you can keep a separate /boot partition of type ext4 (or less), and use that with non-btrfs compatible bootloaders while having everything else (including the root filesystem) btrfs.

change the Partition Scheme from the default LVM to BTRFS.

It all looks, feels and works like your typical Linux system.  It takes a bit of investigation to see the differences.  For example, you can use the mount command, and mixed in with a bunch of other lines you will see this:

    /dev/sda15 on / type btrfs (rw,realtime,space_cache)

Aha.  Now that we know the name of the root partition, we can use the btrfs utility to examine it:

    linux-6569:/home/jw # btrfs filesystem show /dev/sda15

        Label: 'openSuSE_btrfs'  uuid: 00e10875-995a-4bc6-a36b-7c823474cc85

        Total devices 1 FS bytes used 4.76GiB

        devid    1 size 16.00GiB used 7.04GiB path /dev/sda15

    Btrfs v0.20-rc1+20131031

the openSuSE installer actions said that it was going to create a bunch of subvolumes within the btrfs filesystem.  So see those, we can use the btrfs subvolumes command:

    btrfs subvolume list /home

ID 256 gen 40 top level 5 path boot/grub2/x86_64-efi

    ID 258 gen 145 top level 5 path home

    ID 259 gen 19 top level 5 path opt

    ID 260 gen 20 top level 5 path srv

    ID 261 gen 142 top level 5 path tmp

    ID 262 gen 49 top level 5 path usr/local

    ID 263 gen 29 top level 5 path var/crash

    ID 264 gen 144 top level 5 path var/log

    ID 265 gen 30 top level 5 path var/opt

    ID 266 gen 145 top level 5 path var/spool

    ID 267 gen 144 top level 5 path var/tmp

    ID 272 gen 94 top level 5 path .snapshots

    ID 273 gen 50 top level 5 path .snapshots/1/snapshot

    ID 274 gen 51 top level 5 path .snapshots/2/snapshot

    ID 275 gen 61 top level 5 path .snapshots/3/snapshot

    ID 276 gen 62 top level 5 path .snapshots/4/snapshot

    ID 278 gen 76 top level 5 path .snapshots/5/snapshot

    ID 279 gen 80 top level 5 path .snapshots/6/snapshot

    ID 280 gen 84 top level 5 path .snapshots/7/snapshot

    ID 281 gen 93 top level 5 path .snapshots/8/snapshot

Ah, there they all are... and a few extras at the end, which appear to be automatic snapshots that have been made along the way.



*********************Btrfs hands on: An extremely cool file system****************************
Resizing, Adding Partitions, Adding Disk Drives, Snapshots - all while the btrfs filesystem is still mounted!


For Linux users, the most common use of this partitioning is to load multiple operating systems on a single disk drive (such as Windows and Linux), or perhaps to segregate files into different groups, such as operating system files, boot files, user data files and such. 

The important characteristic of partitioning for this discussion is that the disk controller and driver enforce the partition boundaries. More advanced users or system administrators might have dealt with unpartitioned disk drives, usually in the context of a RAID system where the entire disk (multiple disks, actually) are given to the RAID controller for management. As we will see below, btrfs filesystems introduce some interesting new twists on this concept.

So, let's jump right in with a partitioning example (issue). Use command:

mkfs.btrfs /dev/sda16

That command assumes that the partition /dev/sda16 already exists, but then I quickly skirted that issue by saying that you could do the same thing with gparted — the important difference is that gparted will create the partition for you, and then create the btrfs filesystem within that partition.

btrfs filesystem show /dev/sda16

        Label: 'btest'  uuid: a8a0ea98-5746-4d34-92b7-cfd447af9ddf

        Total devices 1 FS bytes used 28.00KiB

        devid    1 size 16.00GiB used 2.04GiB path /dev/sda16

Now, one of the really interesting things about btrfs filesystems is that you can resize them "on the fly" — while they are still mounted. 

That is just wonderful — how many times over the years have I had a filesystem fill up, and I had to create a whole new filesystem and then copy everything over — or worse yet, copy everything from the full filesystem to tape, then delete that filesystem and recreate it larger, then copy it all back again.

The command for this is btrfs filesystem resize size <fs>. The size value may be given in absolute terms, with all sorts of human-friendly abbreviations (K or kilobytes, M or megabytes, G or gigabytes), and <fs> is where the filesystem is mounted. In use, to expand our filesystem to 20 Gigabytes, if I have it mounted on /mnt, it would be:

    btrfs filesystem resize 20G /mnt

        Resize '/mnt' of '20G'

        ERROR: unable to resize '/mnt' — File too large

Whoops. "File too large" — you didn't think I included that whole discussion above about partitioning for nothing, did you?  The partition that I created (well, gparted created) is 16GB, so I can't tell btrfs to make the filesystem any larger than that — in logical terms, my "disk" is full.  I could take the easy way out here, and go back to gparted to increase the size, of course. But that is not the point right now. So rather than increase the filesystem size, we will start by decreasing it:



    btrfs filesystem resize -4G /mnt

        Resize '/mnt' of '-4G

This shows a different notation, instead of giving the absolute size I have told it to reduce the size by 4GB.  That looks like more promising results, and we can check that it really worked: (note: the actual resizing of the filesystem will take a little bit of time, exactly how long depends on how fast or slow your system is, so don't be surprised if the result doesn't show up instantly)

     btrfs filesystem show /dev/sda16

        Label: 'btest'  uuid: a8a0ea98-5746-4d34-92b7-cfd447af9ddf

        Total devices 1 FS bytes used 284.00KiB

        devid    1 size 12.00GiB used 2.04GiB path /dev/sda16

Well, that is just extremely cool!  Other than being a generally useless example, since shrinking a filesystem is not something you want/need to do very often, but wow, it did it, while the filesystem was mounted!

Now that we have (artificially) created some free space within the partition, we can look at the other, more useful example — increasing the size of a filesystem. Again, the size can be given either as an increment (with "+" before the number), or as an absolute size:

    btrfs filesystem resize 14G /mnt

        Resize '/mnt' of '14G'

Finally, before this bit gets too boring, there is one more key word that can be used, to expand the filesystem to fill whatever its boundaries are:

    btrfs filesystem resize max /mnt

        Resize '/mnt' of 'max'

    btrfs filesystem show /dev/sda16

        Label: 'btest'  uuid: a8a0ea98-5746-4d34-92b7-cfd447af9ddf

        Total devices 1 FS bytes used 284.00KiB

        devid    1 size 16.00GiB used 2.04GiB path /dev/sda16

Hooray!  If had been able to do this many years ago, it would have saved me a lot of long nights and weekends moving files around and changing filesystems.

Oh, and there is one other way to keep this from getting boring... some of the documentation I read mentioned that if you needed to expand a filesystem in a partition that was already full, one option was to use fdisk to delete the partition and the create a new larger one — and be sure to use the same starting cylinder.

Well, let me tell you, if you are brave enough to delete and recreate a partition around a live filesystem, then ZOWIE, my hat is off to you!  Personally, I'll stick with gparted and its equivalents for that, thank you...

Ok, so now I can change filesystem sizes, within the bounds of the partition or disk drive that contains it.  Hmm... but that last bit can turn out to be a problem, because what if there is no more space available on the disk drive, or no adjacent space to expand the partition?  This is where the btrfs ability to span filesystems or even span devices is invaluable. (Note: at this point I am still only discussing simple files systems, I am not yet going to address RAID capabilities.)

For purposes of this illustration, I have created a new unformatted partition (/dev/sda17).  In the real world, this new partition is most likely to be on a different disk drive, but the key here is that as far as btrfs is conderned, it doesn't care where it is, it's just another partition. 

o add the new partition to the existing btrfs filesystem, I just use the btrfs command again.  To do this, the original btrfs filesystem has to be mounted, and you have to give the device name of the partition to be added, followed by the mount point of the original filesystem, like this:

    btrfs device add /dev/sda17 /mnt

This command produces no output — old Unix/Linux hands will be comfortable with the "no news is good news" philosophy, but if you want to be sure that it worked, you can check it again:

    btrfs filesystem show /dev/sda16

        Label: 'btest'  uuid: a8a0ea98-5746-4d34-92b7-cfd447af9ddf

        Total devices 2 FS bytes used 284.00KiB

        devid    2 size 16.00GiB used 0.00 path /dev/sda17

        devid    1 size 16.00GiB used 2.04GiB path /dev/sda16

Hey, cool, there it is, it worked!  Two devices listed, each with 16GB capacity.  Another way to check this would be to look at the total size of the mounted filesystem — remember, we originally created it as one 16GB partition:

    df -h /mnt

        Filesystem      Size  Used Avail Use% Mounted on

        /dev/sda16       32G  312K   30G   1% /mnt

Yes indeed, it is now 32GB! Very nice. Within that filesystem mounted on /mnt there is no distinction between the two devices, and we can use it completely normally.  The operating system will use the space from both parts as necessasry. We can check the distribution of data between the two parts with the btrfs command above. One other interesting note here, if I had done this because the existing filesystem was full, then after adding the new device I could redistribute the data evenly across the two partitions like this:

    btrfs filesystem balance /mnt

This is a one-time action command, it balances the current content across all of the devices within the filesystem; once it is done, distribution of subsequent data will be done normally again, not necessarily maintaining the balanced state.

Ok, I would like to cover just a couple more housekeeping commands before wrapping up.  First, if you are dealing with relatively large files and you want to cleanup whatever fragmentation of the file might have crept in over time, you can use the command:

    btrfs filesystem defragment <filename>

Oh my. Just think about that, defragmenting a single, specific file. To be honest, whenever someone starts talking about defragmenting, I immediately think about the old Dilbert comic strip, where Dogbert is working in Customer Support, and he says to someone on the phone: "Well, I could give you some false hope and tell you to try defragmenting your disk". 

But in this case, when I can specify a particular file which I know is large and would benefit, this could be very good indeed.  There are a number of options to this command, so you can specify file and fragment sizes, but the best one is — are you ready for this — you can also tell btrfs to turn on compression of the file contents as it defragments it! 

So, I have a large file, which has become scattered on the disk over time, and now I have a command which will gather the pieces and make them contiguous again, and at the same time it will compress the contents so that I can recover disk space at the same time?  I think I must have died and gone to heaven...

I haven't mentioned it until now, but another very important characteristic of btrfs is that it keeps checksums on data (and metadata, such as the directory structures).  These can help in identifying and possibly recovering corrupted data. Those of us who remember "alternate super blocks" in Unix filesystems might turn a bit green when we first learn about this. 

The btrfs utility includes a feature to use these checksums to verify data integrity, either of an entire filesystem or of individual devices or partitions within the filesystem:

    btrfs scrub start <path|device>

In its simplest form, this starts a scrub on the specified mount point or device, and the scrub will run in the background so that it doesn't tie up your terminal for what could be a rather long time.  What it actually does is read all of the data, and compare the cheksums to validate it.  If it finds an error it will attempt to fix it. In this simplest case, when it is run in the background, you will have to use the status command to get the results:

    btrfs scrub status <path|device>

If the scrub is still running, this will tell you what is happening; if it has finished it will give you the results.  Hmmm. Maybe this sounds a bit confusing, so a real example might help. On my completely trivial btrfs filesystem, it looks like this:

    # btrfs scrub start /mnt

    scrub started on /mnt, fsid a8a0ea98-5746-4d34-92b7-cfd447af9ddf (pid=3414)

 Some time later:

    # btrfs scrub status /mnt

    scrub status for a8a0ea98-5746-4d34-92b7-cfd447af9ddf

        scrub started at Fri Nov 29 09:58:44 2013 and finished after 1 seconds

        total bytes scrubbed: 312.00KiB with 0 errors

There are options for this command to set the priority it runs at, keep it from going into the background, make it more or less verbose, and even disable repair and simply report errors. So nice.

Ok, enough is enough.  This has been a lot of information, and my fingers are tired.  For the next post I will drag out an old deskside server which has two disk drives, and things will get even more interesting, with RAID, subvolumes and snapshots.  I hope it is becoming clear why btrfs is such an interesting and important development in Linux.




*********************Btrfs hands on: Exploring RAID and redundancy****************************
A look at the RAID capabilities of the btrfs Linux filesystem


This time I want to take a look at the RAID capabilities of btrfs. To do this, I need to depart from my usual test systems, which are a variety of laptops and netbooks, because in general terms RAID is most interesting when you have more than one physical disk to distribute and replicate data. 

For this purpose I dragged out an old Dell Dimension E521 desktop system, simply because it happens to have two disk drives already installed (one 250GB and one 750GB). 

It has a dual-core AMD Sempron CPU and 4GB of memory, and originally came with Windows XP loaded — I believe it was also possible to upgrade to Vista, but that was the end of the road for Windows on it. 

I have reloaded it with openSuSE 13.1, since that was what I was using in the first two posts. As usual, Linux installed and runs without a hitch, and in the interest of keeping consistency here I configured it as a pure-btrfs system. No worries.

I set it up on the 750GB disk drive with a 32GB root and 64GB /home, which leaves a bit less than 600GB on that drive, and of course there is about 232GB of usable space on the second drive. I then created two unformatted 128GB partitions, one on each disk drive — CLI users can do this with fdisk, and those who prefer a GUI can use gparted or the like.  Shown graphically, what I ended up with was this:
sda
The system disk
sdb
The second disk

Please excuse me for this being such a totally lame configuration, my intention here is to show the simplicity of the btrfs commands, not to get into a long dissertation about optimal disk configurations. Also, please keep in mind that btrfs is perfectly happy to use an entire unpartitioned disk drive (and in many situations this will be the preferred approach).

For those who are not familiar with RAID terminology or levels, here is a quick-and-dirty summary:

     RAID0: No redundancy, data is "striped" (distributed evenly across multiple devices)
     RAID1: Data is "mirrored" (copied identically to two devices)
     RAID10: Also known as RAID1+0, combines the previous two, requires at least 4 disks

Featured

    Trust, but verify: An in-depth analysis of ExpressVPN's terrible, horrible, no good, very bad week
    The iPhone 13 could smash sales expectations. Here's why
    Windows 11: Here's how to get Microsoft's free operating system update
    The best VPNs for iPhones, iPads, and iOS in 2021

So, with my two partitions ready for use, all I have to do is create a filesystem that spans both of them:

    mkfs.btrfs /dev/sda4 /dev/sdb1

     WARNING! - Btrfs v0.20-rc1+20131031 IS EXPERIMENTAL

    WARNING! - see http://btrfs.wiki.kernel.org before using

    adding device /dev/sdb1 id 2

    Turning on extended refs (higher hardlink limit)

    fs created label (null) on /dev/sda4

        nodesize 4096 leafsize 4096 sectorsize 4096 size 256.00GiB

    Btrfs v0.20-rc1+20131031

After the device has been created, I can mount it:

    mount /dev/sda4 /mnt

Note that for the btrfs utilities, the names of the partitions which make up the filesystem are equivalent, so I could just as easily have said:

    mount /dev/sdb1 /mnt

Once the filesystem is mounted, I can check the structure of it.  The command in this case must be given the pathname of a mounted btrfs filesystem:

    btrfs filesystem df /mnt

        Data, RAID0: total=2.00GiB, used=0.00

        Data: total=8.00MiB, used=0.00

        System, RAID1: total=8.00MiB, used=4.00KiB

        System: total=4.00MiB, used=0.00

        Metadata, RAID1: total=1.00GiB, used=24.00KiB

        Metadata: total=8.00MiB, used=0.00

What has happened here, by default, is that it created a filesystem which spans two partitions, on two physical devices, and it has made the data RAID0, so that it will simply be distributed as evenly as possible between the two devices, but there is no redundancy, while the system and metadata are RAID1, meaning it will be duplicated on both devices. 

I could can force higher or lower levels of redundancy (RAID levels) with command line options to the command; "-d xxxx" to set the RAID level for data, and "-m XXXX" for the metadata. The options range from single, which disables all RAID function and gives a filesystem which simply spans partitions and/or devices, to RAID10, which gives striping (balancing) and duplication, but which requires a minimum of four devices.

If I wanted to force duplication of your data, I could add "-d raid1" to the original command to create the filesystem:

    mkfs.btrfs -d raid1 /dev/sda4 /dev/sdb1

Then mount it, and check the structure:

    btrfs filesystem df /mnt

        Data, RAID1: total=1.00GiB, used=0.00

        Data: total=8.00MiB, used=0.00

        System, RAID1: total=8.00MiB, used=4.00KiB

        System: total=4.00MiB, used=0.00

        Metadata, RAID1: total=1.00GiB, used=24.00KiB

        Metadata: total=8.00MiB, used=0.00

For comparison with what was done and to fill in a few details about what actually happening in the first two posts on this subject,  I went back and created a simple btrfs filesystem using only one partition.  When I check the structure of that, it is:

    btrfs filesystem df /mnt

        Data: total=8.00MiB, used=256.00KiB

        System, DUP: total=8.00MiB, used=4.00KiB

        System: total=4.00MiB, used=0.00

        Metadata, DUP: total=1.00GiB, used=24.00KiB

        Metadata: total=8.00MiB, used=0.00

The important thing to note here is that the system and metadata show DUP, which means that they will be duplicated within the filesystem even though they cannot be distributed across different devices. If I subsequently add a second partition or device to this filesystem, these characteristics will remain the same.

OK, let's summarise all of this in regards to multi-partition/multi-device btrfs filesystems.  At one extreme, I can create a btrfs filesystem which does nothing more than span two or more partitions or devices, with no redundancy or balancing of data - I can use the "-d single" and "-m single" command line options to force this configuration.  Next, if I have at least two separate disk drives I can have RAID0 "striping" or balanced distribution across multiple devices, or I can have RAID1 "mirroring" or duplication across multiple devices - but if I want both of these, that would be RAID10 (or RAID1+0), you have to have at least four separate disk drives.

Btrfs also supports RAID5 and RAID6, which use parity data to increase data robustness, reliability and recoverability.  I have chosen not to include those levels in this brief overview, because they are much less commonly used in desktop systems and by casual users.

So, after three posts that's about it for the creation and management of btrfs filesystems.  Still to come is (hopefully) just one more post, concerning subvolumes and snapshots.






*************Btrfs: Exploring its powerful filesystem subvolumes and snapshots****************
My hands-on experiments with some advanced Btrfs capabilities show why it's such a useful tool for Linux administrators.


There is one more aspect of btrfs filesystem creation and structure that I would like to discuss - subvolumes. 

But where to begin with subvolumes, that's a bit of a problem. Please bear with me in what follows, because I am struggling to find a clear and effective way to present this.

I've tried writing it with CLI examples, but that turns it into a long jumpy sequence of commands and explanations. 

I've tried writing it with GUI screenshots, but that comes out looking contrived and wasting huge amount of space to present very little information in a way that isn't terribly clear anyway. So I've finally decided that best way is to just write a description with a few blocks of CLI command sequences.  Fingers crossed... (hard to type that way!).

One thing is almost certain - btrfs subvolumes are sort of like a lot of things that you have worked with before, but they aren't really like anything you have worked with before.  

I find it useful to think of them is as "alternate restricted views" into a filesystem. Every btrfs subvolume has a corresponding directory in its parent filesystem, which is created when you create the subvolume itself.

You can copy things into that directory (which thus puts them into that subvolume), you can create other directories under that subvolume directory, and you can even create other subvolumes under it. The key here is that it looks and acts almost exactly like a "normal" directory. (Hint: try to remove a subvolume directory it with rmdir.)

Of course, there's not much interesting about some complicated new way to just make a directory, and fortunately that's not all there is to subvolumes. You can actually mount a subvolume in basically the same way that you have always mounted entire fillesystems, all you have to do is add "-o subvol=name" or "-o subvolid=ID" to the mount command or /etc/fstab. When you do this, the directory associated with the subvolume will be the top level of the mounted filesystem. That's what I mean by "restricted view" above.

Let's try a quick example to show what I mean.  I am starting here with a simple btrfs filesystem mounted on /mnt. 

    # mount /dev/sda4 /mnt

    # btrfs subvolume create /mnt/svol

    # btrfs subvolume list /mnt

        ID 256 gen 5 top level 5 path svol

    # ls -l /mnt

        total 0

        drwxr-xr-x 2 root users 4096 Dec  4 21:38 svol

    # cp /etc/motd /mnt/svol

    # ls -l /mnt/svol

        total 4

        -rw-r--r-- 1 root users 21 Dec  4 21:40 motd

    # umount /mnt

    # mount -o subvol=svol /dev/sda4 /mnt

    # ls -l /mnt

        total 4

        -rw-r--r-- 1 root users 21 Dec  4 21:40 motd

Do you see what happened there?  When I had the entire btrfs filesystem mounted, I could see the subvolume directory and I copied a file into that directory. 

But when I unmounted it, and then mounted the subvolume, that file was then visible at the top level, because the directory associated with the subvolume had been assigned to the mount point.  Equally important, but impossible to show here, is the fact that there is now no way for me to see or access anything above that subvolume directory. So I have an "alternate restricted view" of the btrfs filesystem.

Ok, while you're scratching your head over that, let me throw one more thing at you.  I can actually still mount the entire filesystem as well, and everything that is happening in this subvolume will be visible there, as well.  Check it out:

    # mount /dev/sda4 /data

    # ls -Rl /data

        /data:

        total 0

        drwxr-xr-x 2 root users 4096 Dec  4 21:38 svol

        /data/svol:

        total 4

        -rw-r--r-- 1 root users 21 Dec  4 21:40 motd

Now, I'm not going to waste a lot of time on the rest of the manipulation, but I can add, modify or delete files in either one of these mount points, and the changes will immediately be visible in the other one. That's pretty impressive. 

At this point, I hope that experienced Linux administrators are starting to realize how useful and powerful this can be.

I would also point out that this is of course not limited to just one subvolume; as a trivial example you could just as easily create several more subvolumes, perhaps named as sv2, sv3, sv4 and so on, and mount each of them in different places, for different uses, but then still have the entire filesystem mounted as well, so that you could monitor and manage the contents of all the different subvolumes from one place.

Ok, so much for the basics of creating and mounting subvolumes. But there's more, and it's even better. One of the most useful features is the ability to take snapshots of subvolumes.  The command is amazingly simple:

    # btrfs subvolume snapshot /mnt/svol /mnt/snap

This will create a snapshot of the contents of subvolume svol, in a new directory called snap. In fact, it turns out that snap itself is a new subvolume. If you add a "-r" to that command, it will create a read-only snapshot of the subvolume.  Oh, and because btrfs is a Copy-on-Write filesystem, the snapshot initially consumes no additional disk space, and will only start to use space if/when its files are modified, or new files are created. Zowie!

Ok, one last thing before we finish with subvolumes. Another extremely useful feature, subvolume quotas. You can have quotas defined for subvolumes and groups of subvolumes, so you can ensure that one or more subvolumes do not consume all of the available space in a btrfs filesystem.

Well, I hope that wasn't too dense or too boring. Subvolumes really are one of the absolute key features of btrfs filesystems, and learning to use and manage them effectively is the key to getting some real benefits from btrfs.  Sorry that there weren't any pretty pictures this time...


