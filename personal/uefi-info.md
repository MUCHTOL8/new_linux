# uefi-info.md

> useful uefi info




*****************UEFI Boot with Korora/Fedora and Mint/Ubuntu, hands-on***********************
Installing multiple Linux distributions on a UEFI boot system - here are my experiences with Korora/Fedora and Mint/Ubuntu.


UEFI boot system is set up with a special disk partition where one or more boot images are stored. This is called the 'EFI Boot Partition' (how imaginative), and it is a FAT32 filesystem.

Within that partition there will be directories (folders) which contain the actual EFI boot files. If you are running Windows 8, two of those directories are very likely to be called 'Boot' and 'Microsoft'. If you install Linux on a UEFI system, it will mount the EFI boot partition on /boot/efi, and it will add a directory in that partition to hold its boot files.

There are several Linux distributions which already include support for installation with UEFI boot. The ones which I am familiar with, and have installed on the two UEFI boot systems I own are Debian GNU/Linux, OpenSuSE and Fedora. There are more Linux distributions which are derived from one of these UEFI-capable distributions, and thus basically "inherit" UEFI capability.

The distributions of this type which I am familiar with are Ubuntu (from Debian), Linux Mint (from Ubuntu) and Korora (from Fedora).

For the picky reader, please note that I said "Mint derived from Ubuntu", because at this time only the "numbered" Mint distributions (such as Mint 16) include UEFI support, while Linux Mint Debian Edition still did not, at least as of the last ISO images, although those were released a long time ago (March 2013) and I really hope that the next set of LMDE images will include UEFI support - they should be coming along pretty soon now.

The problem arises because of conflicts over the name of the directory that the Linux distribution creates in the EFI boot partition. The "first generation" distributions each chose their own directory names, so Debian uses "/boot/efi/EFI/debian", OpenSuSE uses "/boot/efi/EFI/opensuse" and Fedora uses "/boot/efi/EFI/fedora".  

The distributions which are derived from these generally chose not to change the name of this directory. The exception is Ubuntu, and I have a feeling that Ubuntu might have done the UEFI implementation themselves rather than using Debians, but I don't know that for sure.  

In any case, the specific cases that are of interest here are that Linux Mint 16 uses /boot/efi/EFI/ubuntu, and Korora uses /boot/efi/EFI/fedora. That leads to a very unfortunate situation where if you install both the "parent" and the "derived" distribution on the same UEFI system, the second one overwrites the UEFI boot information of the first. Ugh.

The first work-around that I tried for this problem was the obvious one - rename the directory before installing a conflicting distribution. So I would install Fedora, then rename /boot/efi/EFI/fedora to /boot/efi/EFI/fedora19, then install Korora which would create a new /boot/efi/EFI/fedora directory, and for safety I would also rename that one to /boot/efi/EFI/korora.  

This almost worked - it seemed to work at first, but then I realized that the problem was when there were updates which affected the EFI boot files, it got confused because the files weren't in the place it expected to find them. Of course I could change the name back to the original before installing updates, but remembering to do that is rather impractical, at least for me, and it sort of turns into a house of cards pretty quickly.

Then, when Ubuntu 13.10 and Linux Mint 16 came out, something had changed inside the UEFI boot setup which caused the renaming not to work anyway. The boot configuration seems to have /boot/efi/EFI/ubuntu hard wired in it somewhere, so when I renamed the directory it wouldn't boot any more: argh.  

That's the reason for my recent posts about it being impossible to install Ubuntu and Mint on the same UEFI boot system.

Over the weekend, while I was installing the new Korora 20 release, I realised that there is a much better, easier and more reliable solution for this problem.

I actually mentioned in my earlier posts that Fedora (Anaconda) by default wants to create a new EFI boot partition when it is installed. I don't like creating new partitions for something that already exists, as I consider it a waste of disk space, so I have made the effort to change the configuration and have it use the existing EFI boot partition.

I basically outsmarted myself in this case, because if I just shut up and leave it alone so that it creates the new partition, it will be the only thing in that partition and there can be no conflict. If you install both Fedora and Korora on the same system, each of them will create their own EFI partition and the world will be a very happy place.  

The only minor "problem" is that you will end up with two 500MB paritions, one of which contains about 10MB of data.  But considering today's disk sizes (even SSD disks), who really cares? Especially when it solves such a problem.

Unfortunately, I have not found a way to use this work-around to avoid the Ubuntu/Mint problem.  I can't find a way to specify the EFI boot partition to be used on installation, or to tell the Ubuntu installer that it should create a new partition rather than use the existing one.  
A bit more general discussion about my experience with Linux systems and UEFI boot: looking at it only from the perspective of a boot system configuration and operation, I like it - probably more than MBR boot now.  

I think it is cleaner, easier to see and understand, and certainly less fragile than embedding a boot block at the beginning of a disk or partition. I might be a special case in this context, because I have so many multi-boot systems around, but I still think that the basic advantages are significant, without even going into the details of why UEFI was developed, whether Secure Boot is a good thing or not, and so on.

Look at what is involved when I do a typical MBR multi-boot installation, with Linux (GRUB) as the bootloader. 

I generally want to be able to go back to the Windows bootloader, just in case, so the first thing I have to do is save the first 512 bytes from the raw disk. Not difficult, but not trivial either. Then, if I want to have multiple Linux parititions which are bootable, I have to embed the boot block in each of them, and I have to ignore the warning from 'grub2-install' about that not being a good idea.

Finally, if I want to see what I have done, or what the current boot configuration of an MBR disk is, well, that's just not easy. I can read the bootloader config files, if I have access to them, but even then there is no guarantee that the actual configuration on the disk agrees with what the files claim.

On the other hand, for a UEFI boot configuration everything is laid out in a normal filesystem (FAT32, but still), I can look at the directories and files and see what is really there. Because of this, it was relatively easy for me to see what had gone wrong when the distributions were overwriting each other, as described above.

What I have done on both of my UEFI systems is set up GRUB from openSuSE as the default bootloader, and then I put each of the other Linux distributions into the openSuSE grub.cfg file with 'chainloader' pointing to their EFI boot directory.  

Please note, this ONLY works with Secure Boot disabled, and it is NOT the way that GRUB sets up the configuration itself when you run 'grub2-mkconfig'.  

But it has the distinct advantage of keeping the boot configuration independent of kernel updates in the other Linux installations. If I use the default GRUB multi-boot configuration, and Fedora updates the kernel from 3.12.5 to 3.12.6, the openSuSE configuration would still boot the "old" Fedora kernel, unless I run 'grub2-mkconfig' to generate a new grub.cfg file.  

But if I am chainloading the Fedora GRUB, then it will always boot the latest kernel, because it gets updated when the Fedora update is installed.

Finally, my positive feelings about UEFI boot are based only on my use of GRUB and being able to configure it to do what I want.  

If I had to try to figure out how to configure the Windows 8 bootloader to do this, I would certainly feel differently - I know this, because I have tried and failed and gotten very frustrated over it.  Also, it does NOT take into consideration anything related to boot configuration in NVRAM, or the Linux 'efibootmgr' utility, because that it is completely vendor-specific, and while it is not bad on the Acer AO725, it is downright awful on the HP dm1-4310, and I still won't even try a Samsung UEFI system because of the problems with NVRAM changes causing the system to brick some time ago.

As I have said before, it seems increasingly unlikely that UEFI BIOS and boot are going to go away, no matter how much the Linux community disllikes them, complains about them, or tries to ignore or boycott them.  

In fact it seems unlikely that there will even be very significant changes to the installation and configuration in the future, at this point. I can see the advantages, I can learn to live with it and make the most of it, and I know only too well what the problems with MBR boot are. So why not just get over it, and move ahead with UEFI.







******************My experiments with multi-boot selection with UEFI boot manager*************
How I configured grub as the default bootloader on a UEFI Boot systems

I will start with a summary:

    The UEFI boot systems I have always boot the file bootmgfw.efi from the EFI Boot partition, come hell or high water.
    All of my attempts to change the configuration to get it to boot something else have eventually failed.
    The UEFI-compatible Linux systems I have installed include the grub2-efi boot loader. Getting the computer to boot this by default is the trick.
    The simplest way to permanently achieve this is to copy the Linux bootloader files to the default bootloader directory, and then rename the Linux bootloader to bootmgfw.efi

That's it, in a nutshell. All the gory details follow, bit I will say this as clearly as possible first. Mucking about with the boot process on your computer can be dangerous. If it all goes pear-shaped you may have to reload from scratch. 

The details and procedures which I present here are as complete and accurate as I could make them, and work on my HP and Acer systems, but there may be significant differences in UEFI implementation, so don't be surprised if things look different or work differently on your computer. 

Oh, and by the way, based on the information I have read about UEFI boot, Linux, and Samsung computers, even I would not try this on one of those, period.

So here come the details of my experiments.

If you have a UEFI Boot system, and you followed the details of either or both of my  preceding posts, when you rebooted your system after installing Linux you probably got a surprise - no sign of Linux. Just the same old ordinary Windows 8 boot. 

No Grub boot menu, no operating system selection, no Linux boot.  Just Windows. 

There are two related "problems" at work here - first, the whole theory of booting has changed with UEFI boot, and second the current state of UEFI Boot Managers is very poor (in my opinion, and based on my experience with HP and Acer UEFI systems). 

I will explain each of those problems in more detail separately.

The boot process has been radically changed with UEFI boot.  As I understand it, the process is now broken into two pieces, one is the "Boot Manager", which finds, presents and controls what can be booted, and the other is the "Boot Loader", which actually does the booting (load and run) of whatever is selected by the Boot Manager.

By the way, if I have this completely wrong, please feel free to correct me in the comments - I'm sure there will be plenty of "corrections" anyway, many of which will themselves be completely wrong, nothing new in that.

So when the computer is initially powered on, the Boot Manager looks around and decides what candidates for booting are available, and which one has first priority.  Unless it is interrupted (by you pressing the boot selection key) it will then try to pass control to whatever boot loader it decides comes first.

The Boot Manager which came on my HP and Acer systems is pretty grim, to be kind. 

It is difficult to configure, it is prone to tossing whatever configuration changes you might make and going back to its original default configuration, its on-screen presentation looks like something that came out of the original War Games movie from 1983, and well, it is just generally not very pleasant. The best that can be said for it is that it gets the job done, more or less. 

If you take the time to find and read the documentation for the UEFI boot system in general, and the Boot Manager in particular, it sounds like it could be a lot better than that.  It could have a Graphical User Interface, it could present wonderful classy menus of boot candidates, it could have a very spiffy configuration center, and so on. 

However, the ones I have experience with are really good at exactly one thing - starting the Windows Boot Loader.  Well, two things... they are also really good at throwing away everything I try to do to configure them, and returning to the first thing they are really good at.

I wrote not long ago about the rEFInd boot loader, which does a lot of the things which I just mentioned, but it has to be installed as a separate package ater installing Linux, and it is not easy to get working with Secure Boot enabled. My intention here is to show how I get dual-boot/multi-boot working with a minimum effort, using only what gets installed with a standard Linux distribution. So I will not go into any more detail here about rEFInd.

The Windows Boot Loader is also supposed to be capable of booting multiple operating systems. I have tried to get it to do this with Linux installed in addition to Windows, and I have failed miserably. I have read everything I can find on the Internet about configuring it, and I have tried to use my knowledge from configuring the boot loaders in Windows XP, Vista and Windows 7. 

I have tried using BCDedit and easyBCD, and I have never managed to get it to do anything other than boot Windows 8.  I have gotten it to present a graphical "selection" menu with pretty buttons to click for Windows 8 and whatever else I am trying to add, but none of the buttons other than Windows 8 ever actually works. 

Perhaps I am just too dense to understand it, and if anyone would like to enlighten me, with a complete and functioning example, please feel free to do so. Oh, make that a complete and functioning example which includes booting Linux, because being able to "multi-boot" several different versions of Windows is not interesting to me, and doesn't seem to be particularly difficult...

So, in my case there are only two ways to boot Linux - either interrupt the Boot Manager, by pressing whatever the Boot Selection key is on your computer (ESC, F9, F12 or some such), or install some other Boot Loader and convince the Boot Manager to start that by default instead of the Windows Boot Loader.  If you take the first course, and interrupt the Boot Manager, you get something like this:
UEFI Boot Manager
The UEFI Boot Manager Selection Menu

 

This screen shot was taken from one of the system where I have openSuSE and Fedora both installed in addition to Windows 8. I can move up and down with the arrow keys, and then press return when I am on the one I want to boot. I wrote something very similar to this in a shell script in about 1982, and I am shocked and disappointed to find it here...  If only I had thought to patent it at the time, I could be making a fortune today! Or not...

Well, whatever, it is what it is, and I find it to be unpleasant and inflexibie, so I need to figure out how to replace it with something I like better. To help me do that, I will use the Linux efibootmgr utility to list and edit the boot manager configuration. Here is the list from one of my systems:
efibootmgr-v
The UEFI Boot Manager Information

 The first few lines are what I am interested in, it is a list which corresponds to what the Boot Manager presented in the boot selection list. I am not going to spend a lot of time on things that I have learned the hard way don't work here, I will just say that there are a lot of options for the efibootmgr program which allow you to add and delete items and change the boot order (use the -? option to list them all), but most everything I did, which appeared to work when I listed them again, ended up being thrown away either during the next reboot, or the next time Windows was booted. 

So the only really important bit of information here is the path of the Windows Boot Loader, which is the object that the UEFI Boot Manager insists on booting by default - "\EFI\Microsoft\Boot\bootmgfw.efi". I'm hoping that if I replace that file with the boot loader of my choice, I will be able to trick the Boot Manager into doing what I want.

The paths used by the Boot Manager are relative to the EFI Boot Partition, which is /dev/sda2 on both of my systems, and which is mounted on /boot/efi under Linux - the actual partition may change, but the mount point will always be the same. Linux installations which are UEFI Boot compatible will create their own directory to contain their boot loader binary and configuration files, so on my system I have /boot/efi/EFI/opensuse and /boot/efi/EFI/fedora.  Their contents are:
ls /boot/efi/EFI
UEFI Boot Files for openSuSE and Fedora

 The important things there for my purpose are the grub EFI binaries, which you can boot directly if you don't have Secure Boot enabled, and the shim EFI binaries, which are what you have to boot if you do have Secure Boot enabled. Assuming that I want to boot the openSuSE version of grub by default, what I do next is copy the contents of this directory to /boot/efi/EFI/Microsoft/Boot/. Please note that I said copy, not move, because you don't want to destroy your existing boot configuration, so if things go wrong you can always recover by using the boot select key. Also, you don't absolutely have to copy everything, but it doesn't hurt to do so; if you have gotten this far and are still awake, you should be able to figure out which bits you don't need without too much difficulty, at least by trial-and-error if nothing else.

Once I have the openSuSE boot files in the default boot directory, all I have to do is rename things so that the boot manager runs grub rather than the Windows Boot Loader. I try to be careful and leave myself a way to recover from misunderstandings and mistakes, so I first rename the file for the Windows Boot Loader from bootmgfw.efi to something like bootmgfw.ms. 

Then I rename shim.efi to bootmgfw.efi and I am done. The shim file will boot whether Secure Boot is enabled or not, but if you know that you are going to have Secure Boot disabled, and you want to save one step and simplify the boot process a bit, you can rename grubx64.efi to bootmgfw.efi instead. 

But be aware, if you do this, and then later enable Secure Boot, the next time you try to boot the Boot Manager will notice that something is wrong. 

What it does seems to depend on the specific system on which it happens; it can range from just using a fall-back boot image which will start Windows 8, or dropping into the boot selection menu, or restoring a copy of the original boot files, or it can even go so far as to run what seems to be a very large and very complex Windows recovery procedure in order to get back to the factory boot configuration.

When you reboot after making these changes, you should get the openSuSE grub boot loader, which will give you a simple graphic menu where you can choose to boot either openSuSE or Windows 8.  Hooray! 

There are just a few loose ends that I would like to clean up.

For the vast majority of people, who are trying to set up a simple dual-boot configuration with Windows and Linux, this procedure will work equally well using either openSuSE or Fedora. In my case I want to set up a multi-boot configuration with several different Linux distributions, so I always use openSuSE as the base because I have found that its grub is more flexible, and at least with Secure Boot disabled it is able to boot other EFI images (such as Fedora and Ubuntu) and even non-EFI "traditional" boot distributions such as Linux Mint.

Please remember, mucking about with the boot configuration is dangerous. Make sure that you have complete backup and/or recovery media and procedures on hand before you try this. 

As I have mentioned a couple of times, there seem to be differences between vendors in the details of the implementation, checking and automatic "repair/recovery" procedures, so don't expect that I have covered all the possibilities here, and don't be surprised if at some point you try to boot and rather than starting grub your computer starts showing that blasted rotating circle of dots, indicating that Windows is doing something whether you want it to or not. 

If that happens, what I would do is not try to stop it, just let it finish, and you should be able to go back and "pick up the pieces" or just start over again.f





***************More experiments with Linux-only UEFI Secure Boot installation*****************
UEFI BIOS and Secure Boot work perfectly well with only Linux installed according to the experiments I have conducted on my own PC.

My recent series of posts concerning UEFI and Secure Boot technology has drawn several comments and questions about the possibility of installing only Linux on such a system. 

I have just had to completely reload my HP Pavilion dm1-4310 system (don't ask), so before reloading Windows 8, I decided to take the opportunity to do a bit of testing.  The results have been quite interesting and encouraging.

Before performing these installations, in order to ensure that there would be no "relics" left on the disk, I deleted all of the existing partitions. I also ensured that UEFI Boot and Secure Boot were enabled, and Legacy Support was disabled. 

I made the installations from the standard openSuSE 12.3 and Fedora 18 ISO images, both of which are compatible with UEFI Secure Boot. I decided to do the testing in four steps - first, I installed only Fedora to the empty disk; then I wiped the disk again, and installed only openSuSE to the empy disk; then I reduced the size of the openSuSE partition to free up some space, and installed Fedora alongside openSuSE; finally, I wiped the disk again and reinstalled Windows 8 using the HP Recovery USB stick.

Step One: Fedora 18 installation

I specifically tried to let anaconda make a "default" installation, the only significant change that I made was to select "Standard Partitions" rather than LVM disk management. 

Fedora was installed with five paritions; one was a FAT partition for EFI Boot, and the others were ext4 partitions for swap, root, home and boot. When I rebooted after the installation was complete, it booted Fedora with absolutely no problem, with UEFI Secure Boot still enabled. When I checked the UEFI boot configuration with efibootmgr, I found that it had cleared out all the old entries and made a single entry to boot Fedora via the shim EFI binary.

Step Two: openSuSE 12.3 installation

Once I was convinced that the Fedora 18 installation was working properly, I once again deleted all of the existing disk partitions, and installed openSuSE to the empty disk.  The only change that I made this time was to correct the bootloader installation, from "grub2" to "grub2-efi" (the necessity for this is described in my prevoius post about Installing openSuSE 12.3 with UEFI ).  This time the installer created four partitions (openSuSE does not create a separate /boot partition by default).

Once again the EFI boot configuration had been cleared but this time it had created two new entries, one for Secure Boot which pointed to the shim EFI binary, and the other pointed to a grub EFI binary, which could be used when Secure Boot is disabled.  When I rebooted after installation, with Secure Boot still enabled, openSuSE came up with no problem.

Step Three: Adding Fedora to the existing openSuSE installation

I reduced the size of the openSuSE home partition to make room for Fedora, then went through the normal Fedora installation.  I once again let anaconda make a default installation, chaning only to Standard Partitions. Interestingly, anaconda created new partitions for both EFI boot and swap, even though there were existing partitions for both of those. If I had been doing a "normal" installation, I would have directed it to use the existing partitions for both of those. 

When I checked the EFI Boot configuration, I saw that the installer had created an entry for Fedora, but the number was higher than the existing openSuSE entries. Sure enough, when I rebooted it came up with openSuSE so it was obviously booting the lowest numbered entry.  I then deleted the openSuSE boot entries, using efibootmgr, and when I rebooted it came up with Fedora.

At this point I decided to do some experimenting with UEFI boot configuration - prevoiusly, with the standard HP Windows 8 configuration, any changes I made to the UEFI boot configuration were very unpredicable - some worked, some didn't, and some appeared to work for a while but then would suddenly be removed and it would return to the default configuration. 

As a first small step, with the configuration containing only the Fedora boot information, I added a line for openSuSE with identification number 0000, so it became the first in the list. 

Then I rebooted, and openSuSE came up.  So far so good. 

Then I removed both of the boot entries, and created them again, this time with Fedora first at number 0001, and openSuSE at number 0002.  This also worked as I expected, when I rebooted it once again came up with Fedora.  Finally, I rebooted and pressed F9 (Boot Select), and I could then select to boot either openSuSE or Fedora.

This is all very good news, it means that the erratic behavior I had previously seen, with EFI Boot configuration changes getting lost is indeed a result of some sort of special handling set up either by HP or Microsoft. 

If I spent a lot more time experimenting and observing this I might be able to figure out specifically which one did it (or both), but I don't really care enough to fight with it any more. Suffice it to say, for those who want to know if Linux-only installation with UEFI boot is possible, the answer is yes.
Step Four: Restore the original Windows 8 from the HP recovery media 

I removed the existing disk partitions again, so it was starting with an empty disk, and then booted the USB stick that HP support had sent me. The difference in time required here was really astounding.  Installing either Fedora or openSuSE from scratch required less than 30 minutes, but the Windows 8 "recovery" has been running for over two hours now, and it is still not done.  It just finally asked me for the user name and password, so at least it is getting close.  Wow.

Finally, I got a bit more evidence that someone is "fiddling with the knobs in the back" when Windows is installed. After the Windows installation finally finished, I reduced the size of the C: partition and installed openSuSE into the free space. 

When that had finished, but before rebooting, I checked the EFI boot configuration again and as expected, I saw that it had added its usual two entries, one for Secure Boot and one for normal boot. 

Unexpectedly, though, the Windows installation had created the entry for its Boot Loader with number 0002 (no idea why it did this, there was nothing else in the list at that time), and now openSuSE had created the non-secure entry with number 0001 and the Secure Boot entry with number 0003. 

Hmmm.  If this works as I would expect it to, the system should now boot openSuSE. 

But of course it didn't, when I rebooted it came up with Windows 8.  I have no idea why - it certainly isn't because of the sequence of the numbers, and it isn't because of the BootOrder configuration, so there must be some kind of hidden priority for the Windows Boot Loader.  Sigh.





***********My experiments with installing Ubuntu 13.04 (pre-release) with UEFI Boot***********

This screen is where I think the Ubuntu installation with UEFI gets a bit confusing. It shows the EFI Boot partition, and has it correctly labeled as efi in the "type" column, but it gives absolutely no indication that it is actually going to do anything with that, or for that matter, it is not even obvious that it is going to make a UEFI-compatible installation at all. 

There is a column labeled "mount point", and it doesn't show that the efi partition will be mounted, but in fact, when the installation in complete, that is what will happen, and I don't need to do anything here about it. It just occurred to me that the same is true of the swap partition, it is labeled correctly, but there is no indication that it will be properly configured and used, but it will be.

Now we are back at the partitioner display, and it shows the selection for the root filesystem. 

Unfortunately, the UEFI Boot gets even more confusing here. It still doesn't show that it is going to do anything with the EFI partition (you can't see it here, but trust me, that part still looks exctly as it did two screens ago), and now it is still giving you a choice of the "Device for Bootloader installation". What the heck does that mean? 

If it is going to do a UEFI Boot installation, then it will install the bootloader to the efi partition, so why does it need you to select anything here? Or perhaps you are supposed to select the EFI parition? 

Or is it going to make new EFI partition for its own use, like Fedora does by default? 

Or is it going to install the legacy boot loader to wherever you select here?  I just don't understand what it wants. 

All I can tell you is that I am paranoid enough that I don't want to risk having it install the bootloader to the MBR (or turn the entire SDA device into one huge EFI boot partition? Ack!), so I always change the partition that will contain the root filesystem. 

To be honest, what I suspect is that when doing a UEFI Boot installation, this input field is ignored, but I have never seen that documented anywhere, so who really knows for sure?

On both of my UEFI systems, I got the same surprise with Ubuntu that I had already gotten with openSuSE and Fedora — reboot didn't bring up Ubuntu, it still brought up whatever was booted before I did any of this (in most cases, this will be Windows 8). 

Now, there may be other systems, from other manufacturers that do in fact get UEFI boot parameters set, stored and stable properly so that they boot Ubuntu, but that hasn't been my experience. Oh, and there is another even bigger problem...

If you still have Secure Boot enabled, which was the purpose of this exercise, then when you finally do try to boot Ubuntu (probably by pressing Boot Select), you are going to be very surprised to find that it doesn't boot. 

Seriously. 

At least, it didn't for me, on either one of my systems. What the heck is that about? 

The Live image on a USB stick worked just fine with Secure Boot enabled, but the installed system won't?  Really? I must be wrong about this. I must be confused. I must be doing something wrong. But I can't figure out what, and I have installed Ubuntu 13.04 quite a few times now over the past six weeks or so. 

I keep thinking this is some kind of pre-release problem, and they will get it sorted out before the final release, but time is running out.

Anyway, although I hope that they get this working, if they don't then you will have to disable Secure Boot for Ubuntu. Note that this means only secure boot, it works just fine with UEFI Boot then, you don't have to go all the way back to Legacy Boot.

Oh, and one last note for others who might have a system with the same Ralink 3290 wi-fi adapter my HP has. Although it doesn't work with Ubuntu 13.04 out of the box (at this stage), it actually has the correct kernal and drivers, all that is missing is the firmware file. I was able to "cheat" and copy the file /lib/firmware/rt3290.bin from either openSuSE 12.3 or Fedora 18, and then after rebooting, it works just fine. If you don't have one of those distributions, I believe that you can pick up the firmware file from the Rallink web page.










********************Experiments with my new laptop, Linux and UEFI****************************
Installing Fedora and Mageia has been easy - but configuring UEFI Boot has been a nightmare

The following are the highlights — and lowlights — of my adventures over the past 36 hours or so with the new Compaq 15 laptop which I picked up recently , Windows 8.1 and UEFI BIOS/boot.
Fedora and Korora

I started with Fedora: I found it installs with no problem, recognises all of the hardware, and works well. At the end of the previous post I had confirmed that the Fedora Live USB image booted and ran, and the critical hardware bits worked. 
Raspberry Pi add-ons: My experiments with camera and wi-fi
Raspberry Pi add-ons: My experiments with camera and wi-fi

Raspberry Pi add-ons: My experiments with camera and wi-fi

Adding a high-res camera and a USB wi-fi dongle for more fun with the Pi

Read More

In this context I use 'critical' to indicate the parts which sometimes give Linux difficulty, such as the graphic controller (ATI/AMD Radeon in this case), wi-fi adapter (Atheros) and such. Installation was absolutely routine, exactly as I have described several times before on several other UEFI systems.

I left Secure Boot enabled, and I had no problem booting the Live USB image. Fedora installed its own signed "shim" file, so the installed image also boots just fine with UEFI Secure Boot enabled — and, of course, also with Secure Boot disabled, duh. 

During the installation, it added Fedora to the UEFI boot list and it modified the UEFI boot sequence to place Fedora first; when I rebooted after installation, it booted up Grub (and then Fedora), exactly as it "should".  I was extremely pleased and impressed with this, and I started to think that perhaps HP had improved its UEFI BIOS operation (although it seems I was wrong).

Next up was Korora: I figured that if Fedora worked so well, and considering that I am basically a pretty lazy person, I might as well go ahead and install Korora so that I would have Fedora plus all the extra goodies, without having to install the extras individually myself.

It turned out that the Korora image that I had handy was the Cinnamon version, so that is what I installed. As expected, installation was a snooze, exactly the same as installing Fedora. In this case, because I am keeping both Fedora and Korora on this system, I made Fedora use the existing (Windows) EFI boot partition, but I let Korora create a new EFI partition for itself, to avoid the name conflict on the EFI directory.
Installing Mageia

At this point I was pretty much "on a roll", and I happened to have a Mageia Live USB stick handy, so I decided to try installing that as well. The interest here is in the fact that Mageia 4 doesn't have UEFI support, so I had to be a bit more creative to install it. 

I enabled 'Legacy Boot' support in the BIOS setup, then booted and installed Mageia that way. When it asked for the bootloader target, I told it to put it in the root filesystem (/), basically just to keep it out of the way (I didn't want it writing to the MBR of this GPT disk).

After the installation finished I disabled legacy boot again, and added Mageia to the Fedora Grub configuration file. Unfortunately that didn't work; Fedora's Grub can't boot non-UEFI images (openSuSE can do this which is why I had got into the habit of using this approach).

That left me unable to boot Mageia, so I needed a different bootloader. And that meant rEFInd to the rescue.

I wrote about this wonderful program the first time that I tried installing Linux on a UEFI system (rEFInd is an extremely flexible and powerful boot manager).

It is very small, installs to one directory in the EFI boot partition, and then will find, list and boot pretty much everything bootable on a UEFI system. I haven't written about it much recently, because I have been able to do everything I need with openSuSE Grub, but rEFInd is much more powerful and flexible than that. 

It took about 10 minutes to download, install and configure to boot it. There is no initial configuration required in rEFInd itself, the stock setup will find any of the "normal" bootable images including both EFI and Legacy boot images. In this case it found Fedora, Korora, Mgeia and Windows 8. Very good stuff.
My pain with UEFI

But as for UEFI: what a royal pain. For those who might not be personally familiar with UEFI boot yet, and especially for those who might be familiar with only one UEFI boot implementation, I'm going to include some more details here to explain and illustrate why it is, for me, such a pain.

The UEFI BIOS boot configuration is made up of two basic parts — a list of boot objects, and a sequence in which they should be attempted. When you get a new Windows 8 system, there is usually only one "real" item in the list, that being the Windows 8 Bootloader. 

There will probably also be some other "pseudo" items or "generic" items in the list which allow for CD/DVD and USB boot, for example. The boot sequence on the a new Windows 8 system will contain the Windows Boot item first, and then perhaps some or all of the pseudo/generic boot items.

This is the first place I saw something unexpected in this UEFI BIOS, because there were items included in the default sequence which don't even exist in the list of boot objects. Weird.

When you install another bootable operating system, such as Linux, it will add an item to the boot object list for itself, and that item will be placed at the front of the boot sequence list. 

This makes the new operating system the default boot object the next time you reboot the system — hopefully. 

You can check all of this when running Linux (even when running it from a Live image), by using the 'efibootmgr' command. In its simplest form, with no arguments, it gives a short list of the sequence and the names of the objects; if you add '-v' to the command, it gives a longer list with the complete object list information and some other details. If you are going to install Linux, try this command before and after installing to see how the UEFI BIOS boot configuration changes.
Fedora 20: Hands on with five different desktops
Fedora 20: Hands on with five different desktops

Fedora 20: Hands on with five different desktops

I've been exploring Fedora Heisenbug in five different guises - Gnome 3, KDE, Xfce, LXDE and MATE

Read More

That's all well and good, and as long as nothing else changes the boot configuration, everything works great. Unfortunately, the people at HP seem to think they are a lot smarter than you are (or than anyone else is), or else they think that they can channel Carnac the Magnificent, because every once in a while this machine will decide it doesn't like the boot configuration, and will change it back to the original sequence, with Windows first in the list. 

I have yet to figure out what triggers this, or even how to stop it short of actually wiping the disk and reinstalling only Linux.

In the specific case at hand, as I said above Fedora made the necessary changes to the boot configuration, and when I rebooted after installation it worked just fine and booted Linux, not Windows.

I worked with that for a while, rebooted several times, and it was all just fine.  I was pleased and impressed. Then I shut down (powered off) the system, and when I came back an hour or so later and turned it on again, it booted Windows.

Why the heck did that happen? What changed? Why did it change? Is it something to do with power cycling rather than just rebooting? I don't know. It took a good bit of fiddling about to get it back to booting Fedora again, and it was so obscure and unpredictable that I can't even tell you what finally got it to "stick" again.  But it finally did.

Then, after some more rebooting and even a power cycle or two (and it did not change back to Windows that time — but why?), I installed Mageia and then rEFInd. 

I saw that rEFInd made the changes to put itself in the boot object list and first in the boot sequence list, but when I rebooted it came up with Windows again (not rEFInd, and not even Fedora). Another long round of fiddling with the boot configuration until I finally got rEFInd to stick as the default boot. Again (still) I can't explain why it broke, and I can't explain what fixed it. I can only explain that it is extremely irritating and frustrating, as I'm pretty sure you can tell from this write-up.
My conclusions so far

So where does all this leave us? Linux works very well on this Compaq 15 h033sz, at least the three distributions I have installed so far. I actually also tried installing Debian GNU/Linux, but found that it includes an older X.org release which does not yet include support for the Radeon graphic controller in this system.

The Debian installation actually works, but when I boot the installed system the desktop doesn't come up. I can switch to a text console and login with no problem, but I haven't tried to sort out the display problem yet.

The thing which makes installing and running Linux on this system difficult seems to be the UEFI BIOS boot configuration, and that has nothing to do with Linux itself. If the blasted BIOS would just remain in the configuration it is given, everything would work smoothly.

Finally, I would like to point out to those who insist on going around and saying "UEFI Installation is easy, just use Ubuntu, or Linux Mint", or whatever particular distribution they happen to have tried and succeeded with.

To me it seems there are huge differences in UEFI BIOS implementations today: every OEM seems to do it differently. My Acer was a bit difficult at first, but I got a BIOS update from them a while back, and it has been pretty easy and stable since then.

My experience with HP has been painful as detailed above: so please, don't post comments saying how easy UEFI installation is — at least unless you have personal experience with the specific system in question.

There's more to do on this system. both with testing the Linux distributions I have already installed and also installing some other distributions to see how they handle this hardware. It should be interesting!








*******************Seven ways to set up multi-booting with Windows 8 and Linux****************
More trial and error attempts to set up multi-boot on my new laptop. Here's what I've learned to date.

A good bit of the feedback on my most recent post about installing Fedora on my new laptop was along the lines of "instead of telling us what doesn't work, please give us some information about what options we have which do work". 
Fedora 20: Hands on with five different desktops
Fedora 20: Hands on with five different desktops

Fedora 20: Hands on with five different desktops

I've been exploring Fedora Heisenbug in five different guises - Gnome 3, KDE, Xfce, LXDE and MATE

Read More

That's good advice, and I'm happy to follow it. If all we do is sit around and moan about dual-booting Linux on UEFI systems, it really is likely to discourage some people from trying it, and the simple truth is that there are options that will work, without a massive amount of effort.

First, though, I will repeat something I have said many times before. Every UEFI firmware implementation is different - and not just a little bit different, either . 

Some work really well with Linux installations, dual-booting with no problem right from the start. Others are difficult, unpredictable and downright maddening in their inconsitency, and seem to go out of their way to prevent Linux booting. So if you want to dual-boot Linux and Windows, try to find a description written by someone with the same system you are using, or at least a system from the same manufacturer.

Ok, so what are the possibilities? 
1. Install the Linux GRUB bootloader

Well, the first and certainly the simplest if it works properly, is to install the Linux GRUB bootloader as the default boot object, and have it control dual-booting with Windows. 

To do this, of course, you have to have a UEFI-compatible Linux distribution - the ones I have tried and can vouch for are openSuSE, Fedora, Linux Mint and Ubuntu, but there are others and there are more coming in the near future. 

If you have a UEFI Secure Boot compatible Linux distribution, you don't even have to change the UEFI configuration settings, although a lot of people will choose to disable Secure Boot anyway. 

When you install a UEFI-compatible Linux distribution, if everything works as it should and the UEFI firmware configuration works properly and does not get improperly "reset" (which I have seen happen far too often), then when you reboot after installation completes you will get the GRUB boot menu, and you will be able to choose either Linux (the default) or Windows 8 to boot from it. 

At that point you are almost home free - but be aware that I have personally seen (and personally own) systems which at some later point will suddenly reset the configuration to boot Windows for no particular reason. If this happens, you should consider using one of the other methods described below, because my experience has been that it doesn't happen just once.
2. Use the BIOS Boot Select Key

The second possibility is that you choose a UEFI-compatible Linux distribution, the installation goes along just fine, but when you reboot it comes up with Windows rather than Linux. This can be very disheartening, but it is actually not that difficult to work with. 

The important thing to remember is that the Linux installation will have added itself to the boot list: you just need to be able to get to that list to boot it. 

The simplest way to do that is to use the BIOS Boot Selection option, which is activated by pressing a special key during the power-on or reboot process. That "special key" varies between systems, I have seen Escape, F9 and F12 used on some of my systems, and I'm sure there are others. 

When you press it, the Windows boot process will be interrupted and you will get a list of available operating systems - probably Windows 8 and Linux. I personally don't care for this option because I don't like to have to "race" with the boot process to make sure that I press the Boot Select key in time, and if I am distracted or too slow then I have to go all the way through Windows boot and then just immediately reboot to get back to the Boot Selection menu. 

But a lot of people don't seem to mind it, and it certainly is an ption which requires a minimum of fiddling and fighting with stubborn BIOS configurations. One way that this can be made a bit easier is to go into the BIOS setup and choose a start-up delay, many systems will allow you to set anywhere from 5 to 30 seconds of delay before Windows actually boots, thus giving you a lot more time to press the magic key.
3. Enable 'Legacy Boot'

The third "simple" possibility is to enable 'Legacy Boot' in the BIOS configuration, and just ignore the whole UEFI issue. 

This is not an option that I personally prefer, in part because I am stubborn and in part because as Adam Williamson explained to me some time ago there are some functional advantages to UEFI boot. But it certainly is a viable option, and strictly in terms of getting Linux installed and booting it might actually be the absolute simplest solution. 
Experiments with my new laptop, Linux and UEFI
Experiments with my new laptop, Linux and UEFI

Experiments with my new laptop, Linux and UEFI

Installing Fedora and Mageia has been easy - but configuring UEFI Boot has been a nightmare

Read More

The only problem that I have seen with this option is that some systems make it difficult to enable Legacy Boot, either the option is well hidden in the BIOS configuration, or you actually have to set a BIOS password before they will let you change it. I have heard that there might be some systems which don't have Legacy Boot support at all, but I have never seen one like that.

Anyway, if you choose this route not only does it make things much simpler for installing and configuring dual-boot, it allows you to install pretty much any Linux distribution you want, without regard to UEFI compatbility. 

I have personally used this option to install non-UEFI Linux distributions, such as SolydXK, PCLinuxOS and Linux Mint Debian Edition in a multi-boot configuration with some other UEFI-compatible distribution. I can then go back and disable Legacy Boot, and just use the UEFI-compatible GRUB to boot the non-compatible Linux.
4. Try using the Windows bootloader

The fourth possibility should be to use the Windows bootloader to dual-boot with Linux. I say should be, because people keep posting comments which say "just use easyBCD to set it up", or even "use bcdedit", but try as I might I can't get it to work. 

I wrote about this a year or so ago, when I got my first UEFI system, and I assumed at that time that the problem was just that easyBCD was not completely adapted to support UEFI boot, but now I have tried it again, with the latest version of easyBCD that I could get from the NeoSmart web page and I still can't get it to boot Linux at all. 

Now, it may be that I am just too dense to figure it out, but if anyone is going to come along and post a comment that says "it works fine", then please be prepared to be very specific, and give exact details of what you did to get it to work. Because I have tried everything thing I can think of, and no matter what I do the only thing I get when I try to boot any Linux installation is a message that says "Windows Failed to Boot". 

I have also searched the web for more information, and the only concrete examples I can find are those who have failed, the same way that I have.  I can find lots of places that say "easyBCD works", and "use easyBCD to multi-boot Windows 8, 7, Vista, XP, MacOS and Linux", but not ONE which actually says "we did this with Windows 8 UEFI and LInux, it worked, and here is what you have to do".

What I did was the following.  I downloaded and installed easyBCD 2.2 on two different Windows 8 UEFI systems (the recently purchased HP Compaq, and my Acer Aspire One 725). When I then ran easyBCD (as administrator, of course), I was surprised that it came up with a list of operating system for its boot configuration. I know that the Windows bootloader had not been seeing or offering to boot anything other than Windows 8. It took me a minute to realize that what it was listing was everything which was in the BIOS boot list. 

That was exactly what was being offered if I used the Boot Selection option, as described above, but if I just let Windows boot normally there was no sign of these others. Even if I put a 30-second delay in Windows boot, using either bcdedit or easyBCD, it would stop and list only Windows 8.  So why was easyBCD listing all the others? I didn't understand, but I hoped that it might be a good sign, that easyBCD was at least finding the other options, and all I had to do now was add them to the normal WIndows bootloader menu.

I tried to do that, first by just marking one of the Linux distributions as the default boot object. easyBCD let me do that with no complaints, but when I rebooted it just came right back up with Windows. Bah.

Then I tried using the "Add" option in easyBCD, and gave all the information for one of the Linux partitions.  This time at least when I rebooted it showed the Linux option in the boot list, but when I tried to boot it I got the "Windows Boot Failed" message. I shouted at the blasted computer that I wasn't even trying to boot Windows, so how could that fail, but that didn't help either.

Then I saw that what easyBCD was actually setting up was an attempt to boot something called /NST/neogrub.efi (or some such thing close to that, I don't have the exact name in my head right now, and I am fed up with easyBCD and Windows, so I'm not going back to look again). 

So I tried putting various bootable files in with that name - first I tried the grubx64.efi image from one of the LInux distributions, then I tried copying the boot block (first 512 bytes) of the disk and/or Linux filesystem, as used to be done in order to dual-boot Windows XP and Linux, and then I got desperate and just put a Linux kernel under that name. Of course, none of those worked. 

I finally decided, based on my own experience and the lack of success stories or real configuration information on the web, that easyBCD is of no use whatsoever in setting up dual-boot Windows/Linux with UEFI boot enabled. It might be possible to use it if you enable Legacy Boot, and then set it up exactly the way that it used to be done on Windows XP, but if you're going to do that, then just use method three above, and save yourself a lot of trouble.

After fighing with easyBCD for a very long time, and finally surrendering, I decided to make a run at the bcdedit utility, which is the standard Windows approach to this kind of configuration. I am reasonably familiar with this program, as I have used it to set up dual-boot on Windows XP, so I wasn't exactly blundering around in the dark. 

But again, no matter what I tried it didn't boot. I could get the Linux item added to the Windows bootloader menu, and I could set all kinds of different things as the boot object, but none of them worked. Finally, just to prove to myself that I wasn't doing something just fundamentally wrong (or stupid), I just set the boot object of one of my Linux attempts to be Windows 8, and it booted right up. Grrrr.

So, my conclusion from all of this is that one of the major reasons that easyBCD is of no use in setting up Linux dual-boot is that it is basically impossible to use the Windows 8 bootloader to boot Linux with UEFI boot enabled. Again, it might be possible with Legacy Boot enabled, but I don't care enough at this point to find out. 

If you know that I wrong about this, and you have personally set up a Windows 8 system to boot Linux using the Windows bootloader, then please tell me this in the comments, and please, please be specific and tell me how you did it, because I would love to know.
5. Install a different Boot Manager

The fifth UEFI multi-boot option is to install a different Boot Manager, such as rEFInd from Roderick W. Smith. This has the advantage of being able to boot almost anything - Windows, Linux, MacOS - and it is very powerful and very flexible in automatically finding whatever might be on the disk and presenting you with a boot selection list. 

Unfortunately the one thing it doesn't solve is the "uncooperative/unpredictable BIOS configuration" problem described above. If Windows, or the boot process, or something else is monkeying around with the BIOS configuration and preventing you from permanently setting GRUB as the default bootloader, then it is almost certainly going to prevent you from setting rEFInd as well.
6. Try a workaround

The sixth option is not exactly a solution to the uncooperative/unpredictable BIOS configuration problem, it is more of an ugly workaround for it. 

It turns out that in addition to the normal "boot sequence" list in the UEFI boot configuration, there is also a "next boot" option, which specifices a one time boot configuration. 

This is normally null, so the system follows the boot sequence list, but if it is set the system will try to boot that item first, and will also clear that setting so that on the next boot it goes back to using the default boot sequence list. 

The next boot configuration can be set from Linux using efibootmgr -n XXXX, where XXXX is the item number from the boot list; to find out the number for your Linux installation(s), just use efibootmgr with no options (or efibootmgr -v if you want to see all the gory details): the number will be something like 0001 or 0002 in most cases. 

This "next boot" option could be turned into a semi-permanent work-around by adding the efibootmgr command to the Linux startup scripts, so every time you boot Linux it would reset the value so that it would boot Linux again the following time. I didn't say it was nice, or elegant, or even pretty, but does work, because I have tried it.
7. Trick the default boot process

Finally, the seventh option is to "trick" the default boot process by putting the Linux shim.efi (or grubx64.efi if you disable Secure Boot) image in the place where the Windows Boot Manager is normally located. 

On the systems I have tried, this is in the EFI boot partition (typically /dev/sda2 on Linux, mounted as /boot/efi), under the name /EFI/Microsoft/Boot/bootmgfw.efi.  I have had some success in doing this, but be warned that some systems (especially HP Compaq) are so aggressive about checking and resetting the default UEFI boot configuration that sometimes they will actually notice that it is not the "original" bootmgfw.efi program insttalled, and they will actually go and get a copy of the original and put it back in place, thus undoing your clever deception. You can probably imagine how irritating and frustrating it is when this happens...

So, there you have it.  Seven different options to set up multi-booting with Windows 8 and Linux. 

I suppose there are others that I have not thought about, or that I am not remembering right now, but these are what I think are the most obvious.

I have tried all of these at one time or another. The simplest and nicest of course is the first, just install and boot grub, if that works on your particular system. I also know some people who swear by the second option, just press Boot Select, and they think that I am just being lazy and stubborn by not using that.

Beyond those two, it would probably take more dedication, learning and trial and error to get the others working (some I still haven't gotten working). But in the long run, if you are determined to dual-boot LInux and Windows, you should be able to do it.







***************UEFI and Windows 8 Update on Windows/Linux dual-boot systems*******************
There have been recent reports of problems with Windows 8 Updates destroying Linux/Windows dual boot setups. My experience has been that, while there may be problems, they probably aren't as serious as some reports make them sound.



Over the past few days I have been installing Windows Updates on my two most recently acquired Windows 8 systems (see My New ASUS Laptop and My New Compaq Laptop ). I had read several news items and blogposts noting that recent Windows Updates were destroying the Linux portion of dual-boot Windows 8/Linux setups. After struggling with this for a while, I can finally report that yes, there is a problem — but it's generally not as serious as has been reported.

This post assumes a fair amount of knowledge of UEFI firmware configuration and boot setup. If you're unfamiliar with how a system with UEFI firmware is configured for dual-booting Windows and Linux, you might want to review a few of my previous posts describing that process (sometimes in painful detail).

This post also assumes that the system with UEFI firmware is NOT set up with Legacy Boot enabled. I don't care whether Secure Boot is enabled or not, as that would have no effect on the following description and operation. I haven't tested this in any way with Legacy Boot enabled, so I have no idea whether it would work the same, or if it might be more (or less) immune to problems.

To configure dual-boot Windows 8 and Linux, you have to add a Linux item to the UEFI boot object list, and then change the boot sequence so that Linux precedes Windows. Again, I have explained this in detail in several recent posts, so I will not go into any more depth than this. The important thing here is that this is the key to dual-booting Linux and Windows, because as far as I have been able to determine it's impossible to boot Linux from the Windows bootloader.

When I installed the latest Windows 8 updates on my two new laptops, both of them suddenly stopped booting Linux by default, and went back to booting Windows 8. This did not make me a happy person — I hate it when an update changes something like this without even giving a warning or notice, much less asking for permission or attempting to preserve the configuration that I have gone to a lot of trouble to set up.
Obvious and non-obvious changes

When I investigated exactly what had happened, I found two things — one rather obvious and not too surprising, and one not at all obvious and very surprising.

The obvious change is that something in the Windows Updates has altered the UEFI boot sequence configuration, and put Windows at the front of the list again. This is the reason that the computer suddenly starts booting Windows by default again, rather than Linux. The important thing to note here, though, is that (at least in my experience), the actual list of boot items has not been changed, so you can fix this problem by using whatever your Boot Select key is to interrupt the boot process, then select Linux to boot, and finally use the efibootmgr program under Linux to reset the boot sequence again, putting whatever Linux distribution you want to boot first in the list.

The non-obvious change is one that can make this situation a lot more difficult and confusing. I have mentioned before that Windows 8 has introduced a new 'feature' called Fast Startup, which a lot of laptop manufacturers have enabled by default. Under Fast Startup, when you instruct Windows to 'Shut down', it doesn't really 'shut down' in the way it always has before. Instead, it actually just goes into hibernation, saving the state of the system to the disk and then powering off, so that when you power on again it will come up and be ready to use much faster. I consider this to be more of a 'dirty trick' than a feature, because it's very poorly documented, if at all, and while it has the obvious effect of making Windows boot seem to be much faster than it really is, it has the much less obvious effect of not doing a real 'power on start up' when you turn the system on again after doing what you thought was a shutdown.

The reason this is so bad, and so deceptive, is actually well illustrated by these current UEFI Boot reset problems. Even if you realize what might have happened when your computer unexpectedly boots Windows instead of Linu after the updates have been installed, you then try to shut down and reboot to Linux so that you can check and repair the UEFI boot configuration. But after the shutdown has finished, you power on again and are madly pressing whatever the Boot Selection key is (Esc, F9, F12, whatever is right for your system), but it doesn't work, because this is NOT a 'boot' — it's a 'wake up from Hibernate'! You can't get back to Boot Select, so you can't boot Linux, so you can't fix whatever the update did to the boot configuration. I think that THIS is the reason for a lot of the recent posts claiming that the Windows Update "completely destroyed" their dual-boot configuration.
The solution

What you actually need to do is tell Windows to Restart, rather than 'Shut down'. That will force it all the way through a shutdown and restart; then pressing the Boot Select key will work, and you should be able to get back to Linux again. Whew. Then you can change the boot order back to Linux first (efibootmgr -o nnnn,mmmm,....) and the world will be a wonderful place again. Sort of.
Featured

    Trust, but verify: An in-depth analysis of ExpressVPN's terrible, horrible, no good, very bad week
    The iPhone 13 could smash sales expectations. Here's why
    Windows 11: Here's how to get Microsoft's free operating system update
    The best VPNs for iPhones, iPads, and iOS in 2021

The other thing that you could do to save yourself some future grief would be to disable the Windows Fast Startup option, so that you don't get fooled or stuck again the next time. This can be done by going to Power Options on the Control Panel — I find the easiest way to get there is to right-click on the battery icon in the Taskbar. Then select 'Choose what the power buttons do', and scroll all the way to the bottom of that list.  You should see an option that says 'Turn on fast startup', which you can then disable.

As I said, this information is based on my own experience with my two newest laptops. In fact, one of them had Fast Startup enabled by default and the other did not, so there are clearly differences between manufacturers on this.

While I found that I was able to 'fix' the loss of Linux dual-booting on both of my systems, I am NOT trying to say that everyone who has posted claims about dual-boot being 'destroyed' by Windows Update is wrong. I certainly have enough experience with UEFI boot configuration to know that all sorts of strange things are possible, and it may well be that some systems, with some configurations, really do get more seriously damaged by Windows Update than mine have. One very obvious example might be that the Linux items could get deleted from the boot object list. If that happened you would have to use efibootmgr to put them back again.

Anyway, after having repaired the UEFI boot configuration on my two laptops, they are both back to dual-booting with Linux GRUB as the default bootloader again. Whew.








********************Hands-On: Linux UEFI multi-boot, my way***********************************
How I set up multi-boot for Linux (and Windows) on systems with UEFI firmware.

Let's start by clearly stating what this post is, and what it isn't. It is a description of how I set up multi-boot for Linux systems, sometimes including Windows, using the GRUB bootloader.

It is not intended to be a complete guide to Linux on UEFI firmware. There are certainly other ways to configure UEFI multi-boot - this is simply the way that I have found most useful and reliable to do it. OK? Good, here we go...

The UEFI boot process and disk layout

In order to boot a UEFI firmware system, there has to be an EFI boot partition on the disk. This is a relatively small (100MB or so is enough) FAT partition where various boot files are stored. Exactly what is there depends on the specific operating system. Some Linux distributions put nothing but a single GRUB executable image there; most also put a 'shim' executable which enables UEFI secure boot; and some also put a variety of other configuration and support files there. (Windows puts a lot more cruft in this partition, and various OEMs add even more on top of that.)
Enterprise Software

    Windows 10: My five favorite free utilities
    The fastest VPNs in 2021: NordVPN, Hotspot Shield, and ExpressVPN compared
    Best video conferencing services for business: Zoom, WebEx, AnyMeeting, Slack, and more
    How to boost your company's SEO (ZDNet YouTube)
    Software as a Service: A cheat sheet (TechRepublic)

An EFI boot partition will always have a top-level directory named '/EFI' (no bonus points for originality in this area). Beneath that directory, each operating system or distribution will have its own sub-directory, with a name that (hopefully) indicates what distribution it is used for, and which is (hopefully) unique to that distribution.

For example, when you install openSuSE, it creates /EFI/opensuse/, when you install Fedora it creates /EFI/fedora, when you install Ubuntu it creates /EFI/ubuntu/, and when you install Linux Mint it creates /EFI/ubuntu/. Uh-oh, yes, you read that correctly - there is a name conflict between Ubuntu and Linux Mint. The second post in this series will have information on getting around this.

If you have Windows installed, there will also be /EFI/Boot/ and /EFI/Microsoft/, and depending on the OEM there may also be something like /EFI/ASUS/ or /EFI/HP/. Ugh. Yeah, it can get a bit crowded and a bit messy in there...

If you are creating a Linux-only system, this EFI partition is all you will need beyond the normal Linux partitions you choose to deal with (root, var, home, swap and such). If you install a UEFI-compatible Linux distribution from scratch on a blank disk, it will create the necessary partitions, including the EFI boot partition.

The only thing you will have to watch out for, if you want to create a multi-boot system, is to reduce the partition sizes because most Linux installers will use all of the free disk space available - which means the entire disk, if you are installing from scratch. I generally set the root partition to 8GB, and then size /home and/or /var according to what I am planning to use the specific installation for.

In the simplest case, if I am only testing a distribution to see if it installs and runs properly, and I don't intend to use it for anything significant, I don't even bother with var or home. I just set up EFI, root and swap. This takes second place on the 'completely lame and mindless disk partitioning' competition; if you want to win first prize, don't bother with a swap partition - or set up Windows with nothing but a 1TB C: partition.

If you are starting with a UEFI system which already has Windows installed, there will be quite a few more partitions already created. Once again, the details vary by OEM, but this ASUS system I was using right now is pretty typical, and in addition to the EFI partition (type FAT32) it has a 'Recovery' partition (type NTFS), a 'Microsoft Reserved' partition (type unknown), an 'OS' partition (type NTFS), an unlabeled partition (type NTFS), and a 'Restore' partition (type NTFS). In order to create your Linux multi-boot system, you will haveto make room on the disk for the LInux root, var, home, whatever... but you can share the existing EFI boot partition with Windows if you want.

The most common way to make space is by shrinking the Windows 'C:' partition. Most of the Linux disk/partition management programs are able to shrink an NTFS partition, but I am rather paranoid about this, so I prefer to use the Windows disk management utility.

One other option, if you are very lucky, is that the Windows system might already have the disk partitioned into C: and D: drives, and the C: partition is not ridiculously large. In this case you can simply delete the D: partition and create your Linux installations in the resulting free space. Do I need to say here, make sure that there is nothing you want/need in D: before deleting it?

Installing Linux on UEFI systems

For purposes of this discussion, I am going to assume that UEFI Secure Boot is disabled. This is primarily because trying to manage a Secure/Multi-Boot setup is way more complicated than I want to get into here, and second because I consider UEFI Secure Boot to be the most massive overkill implementation of a ridiculously complex solution to a problem which is in fact vanishingly small in the real world. But that last part is just my opinion.

The first step in Linux UEFI installation is to determine whether the distribution you want to install supports UEFI firmware (duh). The release announcement or release notes generally mention this, but believe me, saying that they have UEFI support and actually being able to boot and install on a UEFI system are two very different things. The most reliable way that I know to find out is to just create the installation media (CD/DVD/USB) and try to boot it. If the Live system or Installer comes up, you're in business; if it refuses to boot, go find another distribution to try.

The next step is actually dealing with the necessary EFI disk partitioning. Any Linux distribution which supports UEFI installation will be able to read and analyze the disk partitioning, and will in some way handle the EFI boot partition requirement. Exactly how they do that, and what they tell you about it during the installation process, varies quite a lot between distributions. Here are a few examples:

    openSuSE will find the EFI boot partition (or the first such partition if there is more than one on the disk), and will show you that it will be mounted as /boot/efi/ automatically.
    Fedora will create a new FAT32 partition, even if there is already one, and set that to be mounted as /boot/efi/ automatically.
    Ubuntu (and Mint) will find and use an existing EFI boot partition, but they will not tell or show you anything about it, and they will still display the old dialog that says GRUB will be installed on /dev/sda (or whatever disk). Well, I guess that is technically correct, it is going to be installed somewhere on that disk, but giving a bit of a hint that it is really going to the EFI boot partition, not to the old MBR location, would make for a lot less uncertainty and worry during installation.

Both openSuSE and Fedora will allow you to modify the layout, and either use an existing EFI boot partition you want, or create a new FAT partition to use for EFI boot. The new LMDE 2 (Betsy) RC release also tries to let you change the EFI partition, but then it insists that the 'boot' flag be set on that partition, which is pretty silly and might require you to go back to the expert partitioning utility and set that flag. But it's progress.

Partitioning for Multi-Boot

Other than getting the EFI boot partition right, you are pretty much on your own as far as the rest of the disk partitioning goes - as is usual with Linux installations. If your intent is to set up Linux multi-boot, you just have to make sure that you leave enough room for however many distributions you want to install. For 'trivial' installations, such as a I mentioned above, I have found that an 8GB partition is usually enough. There are a few very large distributions which require more (Makulu is an extreme case).

One of my netbooks has a 128GB SSD, and I am able to make one 'useful' Linux installation along with at least eight or nine 'trivial' installations on that disk. You can figure this out as you go - remember, installing Linux from scratch takes something like 15 minutes, so if you find you don't have enough space, just do it over.

One other thing about disk partitioning - sharing partitions between multiple distributions. It can be done, and it isn't even all that difficult. But there are a number of different ways to do it, depending on what you want to share, and who you want to share it with. The part which causes the most trouble is getting the permissions right.

One thing I would specifically recommend not to do is try to actually 'mount' the same /home partition for on multiple distributions. First, this is dangerous because if you reinstall one of the distributions which is mounting that home partition, it might get formatted during the installation. And if you are sharing files with another distribution, that can be... unfortunate.

Perhaps one of the simplest ways to share is to create an independent partition, which is not part of the initial installation of any of the distributions which will be sharing it. Then after each distribution is installed, add that partition to /etc/fstab with some new mount point (/shared or /data are common choices). You can then access that partition explicitly, or if you want it to be a bit easier or more transparent, you can add symlinks from your home directory to whatever directories you want in that partition.

If you want to share a partition with Windows, it will have to be a FAT format (duh). Then, again, mount it to some new directory (believe me, you really, really don't want a FAT partition for your /home), and either access it explicitly or symlink to it. Personally I would recommend against linking to it, because that can tend to 'hide' the fact that you are really working with a Windows/FAT partition, and that is something that I always want to be aware of.

Summary (and preview)

So far we have just gotten the basics out of the way, so we can all start the discussion in the next article from approximately the same point. To recap:

    Booting UEFI systems requires an EFI partition on the disk.
    One EFI partition can be shared by multiple operating systems.
    Multiple EFI partitions can be created on the same system.
    Loading multiple operating systems on the same disk requires making sufficient free space for each one (duh).
    Sharing data between multiple operating systems is possible, but don't try to literally share the /home partition.

In the next post, I will look at the details of configuring GRUB for multi-boot, both for Linux-only installations and for mixed Linux/Windows installations.

I will not discuss attempting to use the Windows bootloader or boot manager to multi-boot with Linux, and I will not discuss multi-boot with UEFI Secure Boot. I will look at some unusual/difficult situations (such as Ubuntu and Linux Mint together), and I will look at adding non-UEFI Linux distributions alongside an existing UEFI-compatible Linux distribution. 








**********************Hands-On: Linux UEFI multi-boot, part two*******************************
I covered the general layout and operation of UEFI boot in my part one. Now it's time to get down to brass tacks, and see what my multi-boot configuration looks like.

 I'm going to start this post by saying something that a lot of people will find surprising.

There are a lot of things that I like about UEFI firmware and the UEFI boot process.

I think it is an improvement over the old MBR boot system in some very useful and practical ways. Unfortunately Microsoft has turned it into yet another way to make things significantly more difficult for those who want to boot any non-Microsoft operating system.

But it hasn't been entirely successful, at least yet, so I am writing these articles to show how I set up multi-boot UEFI systems.
Enterprise Software

    Windows 10: My five favorite free utilities
    The fastest VPNs in 2021: NordVPN, Hotspot Shield, and ExpressVPN compared
    Best video conferencing services for business: Zoom, WebEx, AnyMeeting, Slack, and more
    How to boost your company's SEO (ZDNet YouTube)
    Software as a Service: A cheat sheet (TechRepublic)

Just to be absolutely clear upfront again, I am not dealing with UEFI Secure Boot in these articles. I am assuming that Secure Boot has been disabled in the BIOS configuration.

In my previous post I gave some general information about UEFI boot and disk partitioning. If you haven't read that, and you aren't familiar with that information already, it would probably be worthwhile to read it before continuing here, because I am going to use that information as a basis for this discussion.

Simple Linux-only UEFI boot

The simplest possible configuration, which I want to look at here to serve as a soft of 'basic reference point', is a single Linux-only system. As I explained in more detail in the previous post, when you install Linux on a system like this it will create a small FAT-format 'EFI Boot' partition in addition to whatever usual Linux partitions you choose (root, boot, home, var, swap and such).

The exact contents of the EFI Boot partition vary between distributions, but in general it contains a few executables which are needed to perform the EFI boot process, and it may also contain some configuration files and other utility programs intended to support administration of the UEFI boot system. In the absolute minimum case (Debian, for example), it will contain only grubx64.efi, which is an EFI executable of the GRUB bootloader.

The other thing the Linux installer does is make an entry in the UEFI firmware boot configuration list. This list contains the name and location of each installed bootable system on the disk, and another list that specifies the sequence in which they should be tried.

When you boot a UEFI system, it checks the boot sequence list to determine what to try first, then it finds the executable file specified for that entry (grubx64 in our case), and tries to boot it. If it succeeds, that program will take control of the startup process, and continues according to the parameters and instructions contained in the GRUB configuration file (grub.cfg).

The configuration file is used to tell the GRUB program a few simple things:

    How to read the disk partition table (GPT or MBR)
    How to read the partition where the boot object is located (FAT, ext, etc)
    Which partition contains the boot object (by number or UUID)
    What to do with the boot object

Normally that last bit is very simple and obvious, it just loads the Linux kernel and runs it. But it can also be told that the boot object is in fact another boot manager or boot loader, and it should replace itself with that new program and then restart the boot process. This is the part that we are interested in, as you are about to see.

Stated in simplified pseudo-code, the configuration for the system I am currently writing this on is:

insmod part_gpt

insmod ext2

set root="hd0,gpt3"

linuxefi /boot/vmlinuz

initrdefi /boot/initrd

So to summarize this part, the first two lines tell GRUB how to read the disk and the partition, the third line tells it where to look for the boot target, and the last two lines tell it exactly what files to boot, and what to do with them.

Multi-boot Linux

If you set up a Linux multi-boot sstem, the GRUB configuration utility will add information to the end of the configuration file which is similar to that above:

insmod part_gpt

insmod btrfs

set root="hd0,gpt4"

linuxefi /boot/vmlinuz

initrdefi /boot/initrd

The differences here are that the root (or boot) filesystem has been loaded in the next disk partition, and it uses the btrfs filesystem rather than ext as in the first example.

Multi-boot Linux and Windows

If you install Linux alongside an existing Windows UEFI system, the installer will notice the Windows installation, and it will set up the GRUB configuration file to include that. The first part of the configuration file (for Linux) will be the same as it was above, then on the end it will add something like this:

insmod part_gpt

insmod fat

set root="hd0,gpt2"

chainloader /EFI/Windows/Boot/bootmgfw.efi

Aha, now we are finally getting to the heart of the matter: there are a couple of important differences in this configuration. First the filesystem type is FAT rather than one of the Linux types, but more importantly, the command used to load the operating system is different too. A simple way of looking at this is to say that GRUB knows how to boot a Linux kernel so it just uses an EFI-adapted command to do that, but it doesn't know how to boot Windows, so it replaces itself with another task which presumably should know how to do that.

Fly in the ointment

So far this is all still pretty straight forward. A UEFI Linux system uses GRUB as the boot manager and boot loader; when GRUB starts, its config file points it to the Linux kernel, which GRUB then loads and runs. A multi-boot Linux installation adds nothing more than pointers to other Linux filesystems and kernels, the boot process is still the same. When Windows is added to the multiboot setup, GRUB basically says, 'I don't know how to load Windows, so I will back up one step and tell the system to load the Windows bootloader'.

There are a couple of problems with this. First, some Linux distributions have had trouble with the linuxefi command. This was especially common in the early days of Linux on UEFI systems, and while it is not so common now, it still happens sometimes. Fedora was the best known example of this, because although they were one of the first to get UEFI boot working for their own installation, you couldn't get it to boot any other Linux installation - but it would boot Windows!

That initially made me mad - multi-booting Windows, but not Linux? Grrr. But then it got me wondering, why can't I use the same mechanism that works for Windows to get it to boot other Linux systems? After a bit of experimentation I found that I could do just that. It's not even very hard, and you'll be glad to hear that this is the reason that I included all that tedious stuff above about disk partitioning, filesystems, and boot loaders.

Shoo fly, shoo!

Looking at everything that has been said above, and in the previous post, about how the disk is partitioned and how GRUB works for booting Linux and Windows, what would be needed to get it to boot Linux using the mechanism it normally uses for Windows?

Well, unless I haven't told you something significant (and I wouldn't do that), you would need to tell it about the different filesystem (FAT instead of ext), point it to the EFI boot partition instead of the Linux root or boot partition, and then tell it exactly which efi executable to load. In fact, we can copy almost everything from the Windows boot configuration, and just change the name of the efi file to be booted:

insmod part_gpt

insmod fat

set root="hd0,gpt2"

chainloader /debian/grubx64.efi

Zowie, that's not so hard! And it even works! What happens when you do this is that on initial boot you get the GRUB boot menu for whatever Linux installation is first in the UEFI boot sequence. If you don't do anything, after a short delay the system boots that installation. But if you select some other installation from the list, and the one you select is set up in the GRUB configuration file as shown here, you will actually see GRUB restart, and you will get a new GRUB boot menu from the installation you selected. Cool!

I know there will be some people who slog through all of this, finally get to this point and say, 'So what?, especially because using linuxefi today generally works, and it will be set up that way automatically during multi-boot installation. Still others will say, 'It's too difficult, too complicated'.

As I said at the beginning, this is my way of handling multi-boot. It's not the only way, and in some cases it might not even be the best way. But I have been using it for quite some time now (two years or so? time flies when you're having fun...). These are my reasons:

    When I first started trying to set up Linux EFI multi-boot, the linuxefi function didn't work in most distributions. Necessity is the mother of invention...
    When you use the linuxefi command, the entire kernel command line, including the executable name and all options and arguments are included in the grub.cfg file of the system which is handling the multi-boot (i.e. the initial boot system). This means that if anything changes on the target system (new Linux kernel version, different command line arguments, etc), the system which is handling the boot process will not know about those changes unless you update (or recreate) the grub.cfg file yourself. But when you use the chainloader command, and actually run GRUB from the target installation, it will look at its own configuration file, which presumably has been updated when whatever changes were made, so it will get the boot right.

Preserving the changes

There's only one more important thing to talk about on this. I promise. So far I have been talking about modifying the grub.cfg file. But that's actually not a particularly good idea, not only because it says in block letters at the top of the file "DO NOT EDIT THIS FILE". I mean, there's no enforcement of that directive, the Linux Police are not going to come around and take away your birthday if you edit it... but the problem is, that file is automatically generated, and whenever something happens (usually during update installation) which might cause something related to that config file to change, the file will be automatically recreated, and all your lovely editing will be lost.

Of course, you would notice the difference the next time you booted, and you could then go back and re-edit the config file, but that approach is likely to end up with you cursing me for having talked you into all of this. Fortunately, GRUB has a special provision for making additions to its configuration. Once you have a the configuration for a specific Linux installation the way you want it, you can copy that part of the grub.cfg file and add it to the end of /etc/grub.d/40_custom. The contents of that file are automatically added to the end of grub.cfg whenever it is (re-)created, so your changes will survive intact. Hooray!

Summary

That's enough for this post. My fingers are getting tired, and most readers' eyes are probably starting to glaze over. This completes the general description of how I set up multi-boot on my UEFI firmware systems.

There is one more post on this subject still to come, where I will discuss a few special cases, such as Ubuntu/Mint on the same system and handling non-EFI compatible distributions. If there are other specific questions or issues that I haven't covered, get them into the comments and I might be able to add something.








****************Hands-On: Linux UEFI multi-boot part three, problem solving*******************
A look at special cases and uncooperative distributions - problem solving in Linux UEFI Multi-Boot

We're in the home stretch now. In the first post of this series I looked at the general characteristics of Linux installations on systems with UEFI firmware - specifically how the disk is partitioned, and how multi-boot installations interact with each other.

In the second post I looked at some details of the boot process, and how the GRUB configuration file was set up, first for a simple Linux-only installation and then for multi-boot with Linux only and Linux/Windows combinations. Whew. That's a good bit of territory to cover, and I congratulate those who are still with me at this point.

Now I want to look at a couple of exceptions, unusual or uncooperative situations.
Enterprise Software

    Windows 10: My five favorite free utilities
    The fastest VPNs in 2021: NordVPN, Hotspot Shield, and ExpressVPN compared
    Best video conferencing services for business: Zoom, WebEx, AnyMeeting, Slack, and more
    How to boost your company's SEO (ZDNet YouTube)
    Software as a Service: A cheat sheet (TechRepublic)

One common case is installing both Ubuntu and Linux Mint on the same system. I consider this an 'uncooperative' situation, for several reasons. It starts out with the fact that Linux Mint uses an EFI boot directory named ubuntu, which obviously conflicts with what Ubuntu itself uses (duh). But you are not likely to notice that the first time you try to install these two together, because neither of them actually tells you what they are going to do for UEFI installation, or where they are going to do it.

So the typical scenario is: you install one of these two on your UEFI system, and it works great. You're just sitting back and thinking about how easy it was, and what a wonderful world this is, when you install the other one (the order doesn't matter, by the way). The second installation completes normally, with no errors or warnings, and it boots and runs just fine. Now you're really pleased... until you try to boot the first one you installed, and what actually comes up is the second one. Uh-oh.

Wat has happened is that because of the name conflict, the second one you installed overwrote the EFI boot configuration of the first. Unfortunately, neither Ubuntu nor Linux Mint lets you choose the EFI boot partition during installation, so you can't avoid this problem. In fact, you can't even see it coming because as I mentioned above, neither of them even tells you what it is going to do, nor warns you that there is something already in place which is going to be overwritten.

Note: I was hoping that this situation would improve with newer releases. But I have tried the latest Ubuntu 15.04 Beta, and it still gives no information and no flexibility/configurability on UEFI installation. The beta release of Linux Mint Debian Edition 2 looks better - it at least tries to let you select the EFI boot directory - but it is not at all clear that the 'normal' Mint distribution will switch from the Ubuntu Ubiquity installer to the :MDE installer.

The easiest and most reliable way I have found to avoid this problem is to intervene between the two installations, and move the first EFI boot directory out of the way. The obvious way to do that is to simply rename it, for example install Mint first, and then rename /boot/efi/EFI/ubuntu to /boot/efi/EFI/mint. Unfortunately that doesn't work either, because both distributions appear to have something hard-coded in the EFI GRUB programs that reference the name ubuntu. Bleah.

The workaround that I use is to create another EFI boot partition. Just use gparted or whatever disk/partition manager you prefer, and create a small FAT32 partition (128MB or so). Then mount that filesystem somewhere convenient, create a /EFI directory on it, then copy (or move) the /boot/efi/EFI/ubuntu directory to it, and then unmount it. You also need to edit /etc/fstab so that it mounts this new EFI boot partition to /boot/efi the next time you boot.

Finally, you need to configure something to actually use this new EFI boot partition. If you are using the GRUB configuration that I described in the previous post, then you have to modify the root value; if you want to use the BIOS Boot Select function (F12 or whatever), then you have to use the Linux efibootmgr command to make a new entry in the boot list, something like:

efibootmgr -c -b 0000 -l "\EFI\ubuntu\grubx64.efi" -L Mint -p 9

The -b 0000 will have to be a unique number in your boot order - don't worry, you'll get an error if you try to use one that is already defined. The -p 9 is the number of the new EFI partition you created.

There is a much simpler approach to moving/recreating the EFI boot directory to avoid this conflict, using the Linux grub-install command. To use this you have to specify on the command line the EFI architecture required (basically i386 or x86_64), the location where it should create the EFI directory (almost always /boot/efi) and the name to be used for the EFI boot directory (something other than ubuntu):

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=mint

Unfortunately, this still doesn't solve the problem in the Ubuntu/Mint case, because as I mentioned above, there appears to be something hard-coded that points to the name 'ubuntu'. What actually happens is that it appears to work, meaning that the new EFI boot directory is created, and it looks like it contains the right files... and in fact, when you change the boot configuration to point to this new directory, the system looks like it works.

But if you then delete the old ubuntu EFI directory, the next time you try to boot it fails, which means that the boot process is still looking for something under the old name. If you subsequently install the other distribution, which once again creates the /boot/efi/EFI/ubuntu directory, and then you try to boot the original one which you changed in this way, what actually ends up booting is once again the new distribution. Ugh.

Yeah, I know, that's kind of confusing and very messy, but I'm not the one who decided to have Mint use the Ubuntu name. It's kind of irritating, actually, because the first Mint release which had UEFI support didn't do this, but then something went wrong and the Mint developers decided that the only way they could fix it was to use the Ubuntu name. Even more irritating, LMDE (Mint Debian) does not use this name, it installs to /boot/efi/EFI/linuxmint, so they obviously know how to avoid this conflict. I wonder if the problem they can't get around has something to do with using the Ubuntu installer rather than the Mint installer.

Anyway, that's one problem out of the way. Another one which often crops up is trying to install a Linux distribution which doesn't have UEFI support onto a Linux UEFI multi-boot system.

Whenever I start to explain this to people, they always want to stop me and say "just enable Legacy Boot". Fair enough, in some cases, but there are a number of situations where this is not possible, or not the best choice - for example, you might already have several other UEFI-compatible distributions installed, and you prefer to continue on that path rather than switch to Legacy Boot (MBR) for all of them.

In this case, you have to enable Legacy Boot in the system BIOS at least long enough to install the non-UEFI compatible distribution. Then what I prefer to do while installing it is to either embed the MBR boot info into its own root partition, or just not install a bootloader at all. Either or both of these are usually options with most Linux installers, but in the worst case if you don't have either one available, you can go ahead and let it install to the MBR of the disk drive.

Once the installation is complete, you can switch back to UEFI boot, and then in whatever you choose to use as the primary boot installation, you can either run the grub-mkconfig command, or manually set up the grub.cfg file as I described and illustrated in the previous post, using linuxefi and initrdefi to load the new operating system.

I have done this a number of times to get Kali Linux and Manjaro Linux installed on UEFI systems, and it works OK. Not great, but OK. It has exactly the disadvantage that I described in the previous post, that kernel updates in the target distribution are not automatically picked up by the boot configuration.

The final situation I want to look at here is installing a non-UEFI Linux distribution, and then adding UEFI boot capability to it. This also turns out not to be too difficult, but you have to at least be able to get an EFI-compatible version on GRUB, along with a couple of support packages from the distribution repositories:

grub-efi (or grub2-efi, the name can vary)

efibootmgr

dosfstools

Then as before, create an EFI boot partition (FAT filesystem), and mount it on /boot/efi. Remember that this has to be mounted on every boot, so it will have to be added to /etc/fstab. Then use the grub-install command as described above to create the EFI boot directory and its contents. I have used this on Manjaro Linux, for example, and the command looked like:

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=manjaro

Next, use the grub-mkconfig command to create the appropriate grub.cfg file. That gets Linux itself ready for UEFI boot. The final step is to add an entry to the BIOS boot configuration for this distribution using the efibootmgr command. We've seen this before as well:

efibootmgr -c -b 0000 -l "\EFI\manjaro\grubx64.efi" -L Manjaro -p 2

Remember, the boot sequence number specified with the -b option has to be unique; you can use efibootmgr -v to check the existing configuration and see what numbers are already used. The -p flag has to specify the partition number of the EFI boot partition.

OK, that's enough.

Summary: I started out showing how the disks are partitioned for UEFI boot, and how the boot process itself works. I then showed how I set up multi-boot on my systems, in a way that I find the most reliable. Finally, I have looked at the most common causes of problems and confusion in multi-boot systems, and some possible ways around those problems. I hope that all of this information proves to be more useful than confusing to those who are trying to deal with UEFI firmware today.










*****************Hands-On: Adding UEFI boot to Tanglu Linux 4.0 Alpha************************
The Tanglu Linux 4.0 Alpha release does not include UEFI Boot support. Here's how I added it.

Despite the fact that I always have openSuSE, Debian, Fedora, and Linux Mint installed on my systems, I am quite interested in some of the 'smaller' Linux distributions I have come across.

One such distribution is Tanglu GNU/Linux, an independent distribution based on Debian which offers KDE, Gnome, and Core (no GUI desktop) versions.

When I saw that Tanglu had announced an Alpha release of their next version (4.0 Dasyatis kuhlii), I decided to take a look at it, specifically to see how they are doing with UEFI firmware support. They have been struggling with UEFI until now, with preliminary support showing up in one of the previous releases, but never working quite right and then disappearing again.

I was initially disappointed to see that there is no mention of UEFI support in the release announcement, and even more so when I found that the Live ISO image doesn't include UEFI boot capability. Normally I would have given up at this point, and just installed it on my few remaining MBR systems, but this has turned out to be a slow week because the Fedora 23 final release has been postponed, so I decided to poke around in the Tanglu Alpha a bit more.

First I did a 'Legacy Boot' (MBR) installation on one of my UEFI systems. To do that I had to go into the BIOS setup and change the boot mode from UEFI to Legacy, then boot the Live USB stick that I had created from the Tanglu download. From the Live image I ran the calamares installer, and made a normal installation. In the 'Expert' disk partitioning, I told it to install the bootloader to the root partition (/) rather than the MBR -- not strictly necessary, but I like to keep the disk as orderly as possible, and I plan to make this a UEFI boot, not an MBR boot.
Enterprise Software

    Windows 10: My five favorite free utilities
    The fastest VPNs in 2021: NordVPN, Hotspot Shield, and ExpressVPN compared
    Best video conferencing services for business: Zoom, WebEx, AnyMeeting, Slack, and more
    How to boost your company's SEO (ZDNet YouTube)
    Software as a Service: A cheat sheet (TechRepublic)

On rebooting after the installation completed, I went directly back to the BIOS setup and changed the boot mode back to UEFI. You have to pay attention here, because there may be some side effects of this change, depending on the specific system, BIOS, and bootloader(s) you have installed. Don't be surprised if the UEFI boot doesn't default to the same installation that it was before you changed to Legacy and back, you might have to reset the boot contents and sequence using efibootmgr after you reboot.

After I reset the BIOS configuration and booted openSuSE (always the default on my systems), I ran the grub2-mkconfig utility to generate a new boot configuration file, and that found and configured the new Tanglu installation. At this point I could have stopped, because I could now successfully multi-boot Tanglu along with the other Linux installations. However, openSuSE performs the actual boot of Tanglu using linuxefi and initrdefi directives, and I still can't boot Tanglu 'standalone' in UEFI boot mode.

The next step was to go ahead and boot the Tanglu installation. Remember, I interrupted the initial boot after installation so that I could change the BIOS setting back to UEFI boot, so this was actually the first time the installed Tanglu has been booted. I was pleased that it came up with no problem.

Once it was up and running, I poked around a bit and saw that it was a normal-looking MBR (non-EFI) installation. It had grub2 installed, which is the standard package, it did not have the efibootmgr utility installed, and of course there was no /boot/efi directory nor was the EFI boot partition mounted anywhere. At this point I still wasn't sure that I would succeed, because I remember that manually configuring the GRUB EFI boot installation used to be pretty nasty.

I created a /boot/efi directory, and then added an entry in /etc/fstab to automount the EFI boot partition. This is the only part which can be a bit tedious/tricky, if you don't have a running EFIboot Linux system to copy this from, the line should look like this:

UUID=23C1-7413 /boot/efi vfat umask=0002,utf8=true 0 0

Of course, the UUID would have to be adjusted to match whatever is on your system. Otherwise that is a pretty standard command to mount a FAT32 filesystem on Linux.

With that done, and the EFI boot partition actually mounted (mount -a or mount /boot/efi as root), the next step was to install the EFI boot packages. Since Tanglu is derived from Debian, this can be done with the apt-get utility. There are 32-bit and 64-bit specific versions, so the command that I had to use was:

apt-get install grub-efi-amd64

As it turns out, because of dependencies and exclusions, this command does several interesting and useful things. It not only installs the grub-efi package, it also installs the efibootmgr utility, which is indispensable on a UEFI boot Linux system, and it removes the grub-pc and grub2 packages so there will be no conflicts. All of this only takes a minute or so. Nice.

Once the packages have been installed, you're basically set to go. As I mentioned above, the command to actually install and configure GRUB UEFI booting was rather complicated, as you had to specify various paths, names and architectures on the command line. This seems to have been simplified in recent versions, because all I had to do was type:

grub-install /dev/sda

Zowie! It doesn't get much easier than that... and in fact, that is exactly the same syntax that has been used with grub2 for a default installation on an MBR system. The command reported that "no errors were detected", and I poked around a bit to see exactly what it had done.

There was now a new directory /boot/efi/EFI/tanglu, and it contained a grubx64.efi file, which is the GRUB boot image. There was also a file /boot/grub/grub.cfg, which contained the information necessary to actually boot. Using the newly installed efibootmgr I could see that it had also added a boot line for Tanglu, and that line was listed first in the boot sequence.

It really looked like everything was done, and it was ready to boot. So I rebooted and -- hooray -- Tanglu came right up, using EFI boot! I am pleased, and surprised, and a bit amazed that it was as easy as that.

I have just a bit more work to do on this, because I will put it back to booting openSuSE Tumbleweed by default and then add Tanglu as an EFI chainloader option. But all of that is very routine and will certainly not present any problems.

As this is a very early pre-release of Tanglu 4, I don't have anything to say about it in detail. I will only observe that it looks very good, amazingly stable for an Alpha release. I am very much looking forward to the final release. 








******************The never-ending saga of EFI Boot and GPT partitioning*********************
My previous post on LMDE uncovered a lot of confusion. Here's an explanation of how to get around the problems.



My previous post on Linux Mint Debian Edition 201303 has obviously uncovered a lot of confusion about EFI booting and GPT partition tables.  I hope that I can explain it all a bit more, with a couple of examples, to remove some of the confusion. 

Linux Mint Debian Edition 201303 says specifically in its release notes that it does not support EFI Boot or GPT disks.  It doesn't say exactly what the problems are, though, and the devil is in the details...

There are a number of ways to get around the EFI Boot problem, but none of them address the GPT partitioning problem:

    Most EFI/UEFI BIOS systems have configuration settings which allow you use 'Legacy Boot', which means booting from MBR-style boot records.
    LMDE, being a Debian derivative, can be configured with the 'grub-efi' package, to enable EFI Boot. Note that this can only be done after it has been installed, so it will almost certainly require the previous step, at least to get it to boot the installation media, because the LMDE Live media does not have EFI Boot capability.
    If you have another EFI-compatible Linux distribution already installed, and that distribution has a Grub which is able to boot other Linux distributions, you can set that up to boot LMDE. This works with openSuSE 12.3 , but it doesn't work with Fedora 18, and I have not tried it with Ubuntu 13.04 yet.
    If you install another boot manager, such as rEFInd, you can set that up to boot LMDE.

However, none of these solves the GPT problem. Here's the lowdown on that.
Read this
A look at Linux Mint Debian Edition (LMDE) 201303

A look at Linux Mint Debian Edition (LMDE) 201303

Here's what you need to know and the latest LMDE roll-up release, and where you need to pay attention.

Read More

The LMDE release notes specifically say that it does not support GPT partitioned disks. Unfortunately it doesn't say that they can't be read (they can), and it doesn't say what will happen if you try to install to one (it can be catastrophic).

What actually happens is that it interprets the GPT partition table incorrectly, and that causes it to get confused about what is where on the disk. In my case with LMDE, what it did was write the wrong partition information to the Grub configuration file, so it then tried to boot from the wrong partition, and it failed to boot. Not so catastrophic — it just didn't work.

However, a few weeks ago I tried to install PCLinuxOS (also based on Debian Testing, and also without GPT support), on another GPT-based system (my HP dm1-4310 ).  In that case the disk partitions were a bit more complicated, because I had left the Windows Recovery partition in place, which meant a lower-numbered partition was at the end of the disk. PCLOS interpreted the partition table incorrectly, and the results were much more damaging.

First, rather than use the existing swap partition, it wiped another existing Linux installation partition and used that for swap. Second, rather than installing to a new partition I had created for it, it wiped another (different) exiting Linux installation, and installed there. Not nice.

So, here is the summary. LMDE does not support EFI Boot out of the box, but there are ways to get around that. It also does not support GPT partition tables, and there is no way around this other than wiping the disk and changing it to DOS BIOS/MBR partitioning. I'm quite sure this is what Clem meant when he wrote in the FAQ "you could do it but it would require wiping the disk".  There is actually a slim chance that you could install successfully to a GPT disk, but that would require simple partitioning and a good bit of luck.

I hope this clears things up a bit. Feel free to post questions and comments, as always...









******************Installing Linux on a PC with UEFI firmware: A refresher*******************
Practically all new systems have come with UEFI firmware for some time now. Here is a brief overview of the current situation with installing and using Linux on such systems.

It has been some time since I have written about installing Linux on systems with UEFI firmware, and I have recently gotten several questions about how to do this. So I think this is a good time for a brief refresher on this topic.

In my opinion, the state of UEFI firmware configuration today is still pretty chaotic - as far as I can tell every OEM has their own peculiar way of handling UEFI configuration, and the differences between them are anything but trivial.
Installing Linux on your PC is super easy - here's how to do it

Installing Linux on your PC is super easy - here's how to do it

I will show that it's possible to install, configure, and use this Linux distribution with absolutely no command-line access.

Read More

Even worse, in some cases in my own direct experience, different systems from the same OEM have completely different UEFI configuration procedures. So if you have come here looking for simple answers and cookbook procedures, you're going to be disappointed.

The first level of UEFI configuration is the basic choice of whether you want UEFI Secure Boot enabled or not.

Secure Boot is supposed to be one of the major reasons for the existence of UEFI firmware - but in my opinion it is a ridiculously complex solution for a problem that the vast majority of PC users would never be faced with. The idea is to certify the boot image(s) on your computer, so that evil-doers can not corrupt or replace them, and thereby penetrate your system.

What this means is that if you have UEFI Secure Boot enabled, you can only boot a certified signed image - and at least in the original UEFI specification, the only signing authority was Microsoft. I will leave the debate about the wisdom of that decision to others. All I will say here is that this decision had the effect of making installing Linux on UEFI firmware systems much more difficult.

Some OEMs (and their firmware suppliers) have put considerable effort into providing an alternate means for installing keys, certificates and signed images so that their users have at least some slim hope of regaining control of their computers. But in my opinion so far these have been difficult to understand and difficult to use, at best.

On the other hand, some Linux distributions have tried to adapt to UEFI firmware with Secure Boot by including a signed image in their installation. Off the top of my head, I think openSUSE and Ubuntu do this, and I suppose there are some others. They can do it either by getting their own boot images signed by Microsoft, or by producing a complete alternate signing authority, and getting the UEFI firmware to accept that authority and its signed images.

Although this might provide an adequate solution for the few distributions which are willing and have the resources to do it, it doesn't help the vast majority of distributions who don't have the time, resources or interest to get it done.

Therefore my personal choice is to simply disable UEFI Secure Boot. Note carefully, I am saying I disable Secure Boot only - not disable UEFI boot entirely, or return to Legacy (MBR) boot. I actually like working with the implementation of UEFI boot in general, I find it to be more flexible and considerably more robust than the old MBR boot process.

So the first question that I want to address here is how to disable Secure Boot in the UEFI firmware configuration. Unfortunately, as I alluded to above, the answer to this question is neither simple nor consistent.

The first step is fairly easy, and is almost always the same on all systems. To get into UEFI firmware configuration, you press F2 (or sometimes ESC) during the boot sequence. This is the same as it has generally been for Legacy BIOS configuration.

Once you get into UEFI/BIOS configuration, you will see a menu with a number of options such as "Main Advanced Boot Security Save & Exit". Following are two examples of such menus, from systems that I have here on hand:
imgp0003.jpg

ASUS R414S UEFI Configuration Menu
Image: J.A. Watson
imgp0004.jpg

Acer Aspire V3 UEFI Configuration Menu
Image: .A. Watson

Other OEMs will certainly have somewhat different configuration menus, so keep an open mind when looking at these.

Within these menus, you want to find something about "Secure Boot", "Secure Boot Processing" or something similar to that. It is typically in either the Boot menu or the Security menu. When you find it, you want to select it and set it to Disabled or Off.

If you have an Acer computer, when you try to do this you will probably get your first surprise. You can't change the Secure Boot setting, at least at first -- it simply won't be possible to select it for editing. It turns out that you must have a "Supervisor Password" set in the UEFI configuration in order to change the Secure Boot mode. But it doesn't actually tell you this anywhere. Sigh. In this case, once you set a password you will then be able to change Secure Boot from Enabled to Disabled.

Once you have disabled Secure Boot, you are halfway home in getting Linux installed and working. You should now be able to boot the installation media for any Linux distribution which supports UEFI firmware (which is just about all of them now).

Although I mentioned this briefly above, I didn't explain it in much detail.

Most Linux distributions today support UEFI installation, but not Secure Boot. What that means in practical terms is that if you have a UEFI firmware system with Secure Boot enabled, and you try to boot the installation CD/DVD/USB media of a Linux distributions that does not support Secure Boot, what will happen is that your installation media will simply not be listed in the boot menu. Once you disable Secure Boot in the UEFI configuration, your installation media will then be listed.

Once your installation media is recognized and listed in the boot menu, you should be able to go through the installation process for whatever distribution you are using without much trouble. The next trick comes when you try to reboot to the installed system.

The problem here relates to how the boot sequence list gets modified. That list specifies what order the various boot objects should be tried, until one which meets the boot requirements is found and is successfully booted. I have seen three different situations in this area:

    The boot priority list can be modified by software, as it should be, and everything just works with no fuss. Current Linux installers assume that this is the case, and they do what is necessary to set up the installed Linux system as the primary boot object, and any other installed operating systems (such as Windows or other Linux distributions) as dual-boot / multi-boot options.
    The UEFI firmware ignores attempts at modifying the boot priority list by software. In this case, the Linux installation appears to work normally, but when you have finished and you try to reboot to the installed system, it just boot Windows again, the same as it always has. There is usually a temporary work-around for this, you can try pressing the "boot selection" key - if you can figure out which one it is. On my Acer systems it is F12; on my ASUS systems it is ESC, and I believe on the HP systems I used to have it was something like F9 or F10. Whatever. If you find the correct key, you should be presented with a list of bootable objects on your computer; if the problem is simply that Linux wasn't able to change the boot sequence, then you will see a Linux installation listed there, and you can select it in order to boot Linux.
    The boot priority list can be modified by software, so it appears that the installation works and you might even be able to boot the installed Linux system the first time you try. But at some point after that, the OEMs boot software will decide to "help you", by correcting the "mistake" that you made in changing the default boot to anything other than Windows. When this happens your computer will suddenly start booting Windows by default, for no apparent reason, and you will have to go back to point 2 above for the temporary solution to boot Linux again. I have seen HP laptops do this many, many times, and this is the main reason (almost the only reason) that I quit buying HP computers altogether.

If you have situation number 1 above, you are a happy person and the world is a wonderful place, so you can stop reading this long-winded article now. If you have situation two or three (or some other that I haven't seen yet, but which also is causing Linux installation/boot not to work), then you need a solution. Read on.

The most common solution/work-around for either case two or three is that the OEM and/or UEFI firmware supplier have provided a means in the UEFI configuration menus for you to manually specify the boot objects, priorities and/or sequence. To accomplish this, you have to get to the UEFI/BIOS configuration menu again, by pressing F2 during boot.

In the Configuration menus, look for the BOOT page, where you should find a list of boot object something like these:
imgp0005.jpg

ASUS UEFI BOOT Menu
Image: J.A. Watson
imgp0008.jpg

Acer UEFI BOOT Menu
Image: J.A. Watson

The important thing to notice in these pictures is that there is a list of boot objects, which will be tried in the order that they are listed, and that there are instructions on the right side of the screen about how to modify this list.

These two systems illustrate the most common methods I have seen so far.

On the ASUS, it lists every bootable operating system that is currently defined and present, and you can simply move items up and down the list to alter the priority, or to change which one will be booted by default.

On the Acer it only lists one "object" of each type - something to boot from the hard drive, the built-in CD/DVD, the Network, the USB ports and so on. To change the priority of different operating systems on the hard drive, you have to first select Hard Drive Priority, which will then bring up a new view that shows all of the known operating systems installed on the hard drive:
imgp0009.jpg

Acer UEFI Hard Disk Boot Priority Menu
Image: J.A. Watson

In this screen you can change the order of the operating systems, which then sets to sequence in which they will be tried until one of them boots.

The last thing I want to mention, briefly, is that there is also a Linux CLI command which should be able to set the UEFI boot sequence, called efibootmgr. First, for those who are either allergic to or terrified of the command line, I want to stress that it is not necessary to use this command, this is an optional approach.

If you have a system which matches case 1 above, meaning that the UEFI boot table and sequence can be successfully and permanently set by software, then this command can be quite useful - especially if you are setting up a dual-boot or multi-boot system. Using it, you can quickly and easily change what operating system boots by default, for example.

If you have a system which is case two or three above, you still might be able to use this command to configure your UEFI boot sequence - but I would recommend trying to do it via the UEFI configuration menu as I just described.

I can tell you from experience that it is very frustrating to spend the time getting the boot list just the way you want it with this command, and then reboot the system and find that nothing you did really had any effect anyway.

There is one final case that I should mention. When you are installing a Linux distribution as the only operating system on your UEFI-firmware system, in my experience it is very likely to work properly, the first time, without requiring any additional manual configuration.

So, that's a brief overview of UEFI and Linux as I deal with it today. I apologize again for it being so vague, but that is exactly the way things are on my computers today.

If you are very lucky, when you install Linux the UEFI boot sequence will just work as it should, and you won't have to worry about any of this. If you are not lucky, then the most important thing when you try to solve the problem is to keep an open mind, look carefully at the UEFI configuration options, and read the Help/Information text found at the right side of most items carefully.

Good luck!








********Linux on your laptop: Here's what you need to know about UEFI firmware***************
Understanding UEFI firmware, and the Linux utilities to manage it, can save you a lot of time and trouble.

This will be my last foray into UEFI firmware for quite a while. For those who are already tired of my writing about it, I apologize in advance; for those who have asked for more, here it is.  

For the rest of you, I hope that you can find a few interesting and helpful tips and tricks in the following information.
UEFI Firmware configuration

There have been several questions and comments on my previous posts about UEFI boot. Let me start with a description of what I do with the BIOS configuration on all of the laptops I have with UEFI firmware.

SEE: 20 quick tips to make Linux networking easier (free PDF)    

While there are significant differences in the specifics of BIOS configuration utilities between laptop manufacturers, there are a few critical things which are common to all of them. One of those things is the choice between UEFI or Legacy boot modes. On every system I have (or have ever had), there are three possibilities:

    UEFI Secure Boot: This is almost always the default mode on a new laptop. It requires that any and all bootable objects and firmware be signed with a recognized SSL certificate. The stated purpose of this kind of boot is to protect you from booting or otherwise using firmware images which have been maliciously modified. As I have said many times, my personal opinion is that this is a vastly over-complicated solution for a virtually non-existent problem.
    UEFI Boot (Secure Boot Disabled): Every system I have used which has UEFI firmware has had the possibility to disable Secure Boot, but still use EFI boot. By doing this you get the benefits of the new firmware design over the old (very old) BIOS firmware, and of course the new boot configuration management structure, as I described in the previous post. This is the way that I have all of my UEFI firmware systems configured, and it is what I recommend to others who ask for my opinion.
    Legacy Boot: This effectively returns the system to the old BIOS/MBR setup. In my opinion (and experience), the biggest problem with this is that it goes back to using the "magic" Master Boot Record configuration, which is much less flexible and much less robust, especially for multi-boot systems.

When UEFI boot configuration fails, changes or gets lost

I frequently hear from people who have installed Linux as a second operating system on a Windows laptop with UEFI firmware, and one of three things has happened:

    After the installation apparently completes successfully, the laptop reboots and Windows starts with no sign of Linux having been installed.
    Linux has been installed and booted successfully, and the world seems to be a wonderful place, but some time later, usually when Windows updates are installed, or a laptop firmware update is installed, it goes back to booting Windows again.
    Linux has been installed, as in the previous point, but suddenly, without installing, changing or updating anything, it goes back to booting Windows. This one is actually a variant of the previous point, but it is particularly baffling because you literally didn't do anything at all, you just shut the laptop down and sometime later turned it back on again. In some cases this is accompanied by a message about Windows "repairing the startup configuration" for you, but often not even that.

As I mentioned when this was described in a comment to my previous post, what almost always happened in all three of these cases is that the UEFI boot priority list has been changed or "reset" by something, without your knowledge or permission. People tend to assume that their Linux installation has been wiped out or is otherwise no longer available, but that is generally not the case. The first thing to do when this happens is remember Douglas Adams' invaluable advice - Don't Panic!

When this happens, you will most likely be able to recover using some or all of the following actions:

    First, check to see if it really is just that the boot sequence has been changed. One way to do that is to hit the "Boot Select" key while the system is starting up. Of cours this requites that you know (or are able to figure out) what key that is, because it is different for almost every manufacturer, and sometimes it is even different for various systems from the same manufacturer. Yes, that is frustrating. The ones that I know off the top of my head are F12 for Acer, F9 for HP, and ESC for ASUS. It used to be F5 for very old IBM Thinkpads, but I don't know if that is still true since Lenovo took over Thinkpads from IBM. Anyone who knows for sure what this key is for other manufacturers is very welcome to post that information in the comments. Thanks.
    If you are able to hit the Boot Select key, you will be presented with the boot list, and if Linux appears in that list, then you are probably in good shape and will be able to recover the boot configuration you want. You have to keep an open mind when you read this list - just because you installed Linux distribution "xyzzy" (Debian, Mint, Ubuntu, whatever), doesn't mean that it will appear in the boot list with exactly that name. Believe it or not, my recently acquired HP laptop insists on calling one of the Linux installations "Linpus". (Yes, I know what Linpus Linux is, and no, I have never installed it on that HP, or any other system in the past 5 years or more). Anyway, if there is a Linux entry in the Boot Select menu, go ahead and boot it and make sure your Linux system comes up normally. If it does, you're not out of the woods yet because you still need to fix the boot priority list (as described in the next point), but at least you know you haven't lost your Linux installation. If it doesn't boot Linux... well, maybe the worst scenario really has happened, and Windows update, or Windows Recovery, or some other "helpful" utility has wiped your Linux system and restored Windows to the entire disk. In this case I can't offer you much other than sympathy, because I've been there.
    Another alternative is to hit the BIOS Configuration key while the system is starting. This is usually F2, but can also be something else - it is often stated at the bottom of the boot screen with something like "Press F2 for Configuration". Again, every manufacturer's BIOS configuration utility is different so I can't give specific instructions here. Look for Boot in the top-level menu, and there you should find a priority-ordered list of bootable objects. This should include Windows and (hopefully) your Linux system, along with various things like USB drives, Network boot, and a few system still even list Floppy disks. If you're at this point because your system is mysteriously booting Windows instead of Linux, what you need to do is move the line for Linux back to the top of the list. This may involve the F5/F6 keys to move items Up/Down the list, or it might require selecting the list and going one level deeper into the BIOS configuration to reorder things. Whatever the procedure, once you get Linux to the top of the list, your problem should be fixed, so Save-and-Exit, and try booting again.
    There is one other way to display and modify the EFI boot list, using Linux utilities, which I will describe below. This used to be my "go-to fixit procedure", because like most Linux utilities it is powerful and flexible, but more and more systems have firmware today which either ignore changes you make this way, or restore the old boot configuration the next time the system is rebooted. More on this command below.

Linux EFI Boot Management Utilities

Linux includes several utilities specifically for managing the EFI boot configuration, and of course for actually booting the system. These are administrative commands, so they can only be run as root, or using "sudo".

    efibootmgr: This is the utility I was referring to in the last point above. It can be used to display the current EFI boot configuration, and to add, modify or delete items in the boot priority list. If you are in the situation I mentioned above, where your computer has suddenly changed from booting Linux to booting Windows, and you are able to bring up Linux again via the Boot Select key, then you can use efibootmgr to see what has happened to the boot sequence. A simplified example of such a boot list might look like this:

    # efibootmgr

    BootCurrent: 0000

    Timeout: 0

    BootOrder: 0001,0000,0002

    Boot0000* openSUSE Tumbleweed

    Boot0001*  Windows

    Boot0002*  openpensuse-secureboot

This shows that openSUSE Linux and Windows are both installed, and openSUSE has two boot images, one that is signed for use when UEFI Secure Boot is enabled, and one that is not signed. Unfortunately, the BootOrder shows that this system will boot Windows by default, so during a normal start you would never know that Linux was installed.

    You can change the boot priority using the "-n" option with efibootmgr, so in this simple case to make openSUSE the default boot the command would be:

    # efibootmgr -n 0000,0002,0001

    Keep in mind, though, that this might not work, even though you might have confirmed that the change was properly made by printing the boot list again. As I said above, the current trend in UEFI firmware is that any changes not made using the BIOS configuration utility are discarded on the next boot.
    gparted.png

    J.A. Watson
    gparted (or any of a variety of other Linux disk management utilities): Disk management utilities are crucial to your understanding and managing UEFI multi-boot systems. The screen shot shown here is from my HP laptop, which has several different Linux distributions installed, but not Windows (although there are a couple of small relic partitions that I haven't cleaned up yet). The important thing to notice here is that the first partition is an EFI Boot partition (this is the one that was originally created by the pre-installed Windows), and partition 11 is also an EFI Boot partition, which I created to facilitate the installation of both Linux Mint and Ubuntu on this system.
    Although Linux installers are capable of taking care of disk partitioning for you during installation, I prefer to use gparted to do it myself before running the installer, usually by booting a Live USB stick for a distribution which included gparted. That allows me to create the number and size of partitions I want, and is particularly important if I am installing a distribution for which I plan to use a separate EFI Boot partition.
    grub2 and associated utilities: grub2 is the bootloader that comes with nearly all current Linux distributions. The grub2 management utilities are used during installation to identify all installed operating systems and create a boot configuration file. The latest versions are amazingly good at this.
    grub.cfg: This is the boot configuration file. It is a "plain text" file, which means you can read it to see what has been set up on your computer, but it is not advised to modify it because this file will often be automatically overwritten with a new version during installation of various updates (Linux kernel, boot support files and such). If you look at it, you will see that it uses two different mechanisms to actually boot an operating system; for Linux systems it uses linuxefi (and probably initrdefi), while for Windows it uses chainloader. I mentioned in a previous post that I would at least briefly explain the way I use grub2 on EFI multi-boot systems; this is it. If you are experienced enough, confident enough and careful enough to undertake modifying grub.cfg yourself, you can change the linuxefi/initrdefi commands for other Linux distributions to chainloader. You can see the reason for this if you look closely at the automatically generated grub.cfg file; the linuxefi commands include the explicit name of the kernel image file, which generally also includes the kernel version number. That means if you update one of the other distributions, and the kernel version changes, the auto-generated grub.cfg will then fail to boot that distribution. If you use chainloader to boot the other Linux distributions, it goes through the EFI boot process again, and uses the boot configuration files for the distribution you are booting, and those get updated as part of the Linux update process, so that will always work no matter how much or how many times the distribution has been updated.
    Whew, that's quite a bit to digest, so let me say again, this is absolutely optional, and not recommended unless you are quite experienced and very careful. If you do it, make sure you keep a copy of the new grub.cfg file, because that will be overwritten on the next update, and you'll have to fix it again. This is just me being a stubborn old geek, so if you don't understand it, or don't think it's worthwhile, that's fine too.
    grub2-mkconfig: This is the Linux utility which actually scans the disk and creates the grub.cfg file. One bit of good news is that in the current versions of Linux this utility will do the right thing and put it in the right place when you run it with only the disk name on the command line - it doesn't require info about distributions, versions, partitions or anything else, it figures it all out on its own. So if there is something wrong with your boot configuration file, just run "sudo grub2-mkconfig /dev/sdX", where "X" is replaced by your disk name, and it will make a new config file. Also, if you just want to create a config file that you can look at for some reason, you can use "sudo grub2-mkconfig -o grub.new".

In summary, I think it should be clear from what has been said above that one of the most difficult issues in dealing with UEFI firmware systems and Linux is the variation between different UEFI implementations. Of course they all implement the same functionality in terms of booting the computer, but the way in which they are managed, the tools which are used to manage them - especially the BIOS configuration software - are very different. So you sometimes have to feel you way through, just keeping your objective in mind and looking for the correct path to reach that objective, and at the same time the way they interact with the Linux UEFI administration tools, down to the level of whether or not they even accept and retain changes made be the Linux tools, make this a difficult and tricky area.

I hope that I have given enough information, and examples, in this post to be useful in helping others find a way to deal with UEFI and Linux successfully.e














SOME OLD BIOS/MBR STUFF


First, for very old historical reasons, a PC disk drive can only have four partitions. However, one of those partitions can optionally be an "Extended" partition, which is then able to contain a lot more "Logical" partitions. This means that in the simplest case your disk drive can be one huge partition - which many/most Windows systems were until fairly recently, with one huge C: drive - and in the most complex case it can have three "Primary" partitions and one "Extended" partition, and the extended can contain some more "Logical" partitions. Again for very old historical reasons, I don't create more than 15 partitions in total, but with most Linux distributions today you can have more than that. Great, so what does that all mean? Well, new PCs today typically come with at least one partition allocated to Windows, for the C: drive, and sometimes with a second Windows partition for the D: drive, and you might even be given the opportunity to set the relative sizes between those two. In addition there might be a "Recovery" partition containing the Windows installation image, and a "bootloader" partition (you can tell this one because it is very small, something like 100MB). Finally, if you are very unlucky, there might even be a vendor-specific "Tools" partition - HP is particularly known for this one, but they are not the only ones who do it. I have found the Windows "disk management utility" to be worse than useless in this regard, because it is often actually misleading. It seems that Microsoft has decided that there are some partitions that you don't need to know about, so they don't bother showing them. So I use one of the Linux disk/partition management programs; something like "Parted Magic" on a Live CD/USB, or a disk management recovery distributions. Ubuntu and most of it derivatives, such as Linux Mint, always have the gparted utility on their Live image. Once the change has fininshed boot Windows right away - it will complain that someone has been messing with the disk drive, but it should run checkdsk and cleanup whatever it doesn't like, then everything will be fine.  Then go back to the Live media, run gparted again, and make yourself some Linux partitions. 
If you are willing to let a Grub2 system be the primary bootloader, everything will be pretty simple because the update-grub utility will generally figure out the other installed systems. But if you want a Legacy Grub system to be the primary bootloader, you'll have some work to do to get it to work with Grub2 partitions. The simplest solution that I have found is to install Grub2 to the root partition of the other installations, and then "chainload" from Legacy Grub to those, so Grub2 will still take care of actually booting them.  Let's suppose that you have a Grub2 system already installed (such as Ubuntu), and you want to install a Legacy Grub system (such as openSuSE) and set up multi-booting. What you need to do, before installing the new system, is set up Grub2 in the root partition of the existing installation. That is done with the command:

sudo grub-install --force /dev/sda1

You have to replace sda1 in this command with whatever your root partition might be. This will install the Grub2 bootloader, and will caution you that this is not a particularly good idea. Once this is done, you can go ahead and install the additional distribution, and let it install Legacy Grub to the MBR of the disk, thus making itself the primary bootloader. When that is done, you need to add three lines to /boot/grub/menu.lst:

title Ubuntu 10.10 root (hd0,0) chainloader +1 

If you start from the opposite end, with a Legacy Grub distribution already installed, the procedure is pretty much the same. In fact, when installing most Grub2 distributions you will usually have the opportunity to tell it to install the bootloader to the root partition rather than the MBR, but since this option is often buried in some obscure place, or it works in some way that I don't quite understand or expect, I always choose to just let it install itself normally and take over as the primary bootloader - it will see the existing Linux installation, and will add it to the Grub2 configuration. Once the installation is done, I log in and run grub-install as described above, then reboot again. When the boot menu comes up, this time I select the original (Legacy Grub) installation. I then login to that, edit the menu.lst file as desribed above to add the new Grub2 installation, and then restore Legacy Grub as the primary bootloader with these commands:

# grub root (hd0,2) setup (hd0)

Once again, this assumes that the Grub2 distribution is on /dev/sda3, you should adjust the partition number as necessary.

As I said at the beginning, this is just the way that I handle Grub co-existance. There are certainly other ways to do it, I pretty much figured this out on my own. It works pretty well for me, although it can get fouled up and require repair if another distribution is installed.


