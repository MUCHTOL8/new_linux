# systemd-info.md

> The pros and cons of systemd and some useful information on systemd.


***************Systemd: Navigating through the quagmire***************************************
Here's some background, and my take, on the new initialization daemon.

 Well, this might turn out to be a major mistake on my part. Look up the definition of quagmire, and you'll find something like this: 'an awkward, complex, or hazardous situation'.

That is an excellent description of the situation surrounding systemd. In the great Linux tradition of things generating far more heat than light, systemd could be the poster child.

It beats mono, KDE 4, and Gnome 3 hands-down. But why? Why is it so controversial, and why has it created such seismic faults in the ranks of Linux developers and Linux distributions? I think that boils down to just a few specific points:

    It doesn't follow the Linux (Unix) philosophy of creating small tools to do just one job.
    It was created primarily by/for a large company (Red Hat).
    It is continuing to expand, absorbing other utilities and creating new dependencies.
    It doesn't follow the Linux (Unix) philosophy of simple plain-text logs.
    There are some over-sized egos (and tempers) in the Linux community.
    Linux is slowly becoming Windows.

Honestly, even that list oversimplifies the situation, but I think that I can use it as a starting point to hit most of the high spots. As I said, once I am done and this is posted, I'm likely to regret having wandered into this morass (dictionary defintion: 'a complicated or confused situation'), so I had better hurry up and get it done before I have too many second thoughts.

1. It doesn't follow the Linux (Unix) philosophy of creating small tools to do just one job.

One of the earliest and most important concepts of Unix was that tools were kept small and simple, and focused on performing a single task. This was almost literally a mantra in the '80s, and a lot of us who are now 'old-timers' grew up with it. Focus. Strip. Reduce. Split. If you can remove a function and put it in a separate, standalone utility, do it. You never know when you might be able to use that same function in some other unexpected way, and tie it together with something else through a pipe.

The Unix/Linux startup/shutdown process followed this philosophy. All it did was start other processes, services, utilities, daemons, and such. It didn't worry about what those did, it just started them up at boot time, and stopped them at shutdown time. Even when we got the concept of 'service start/stop/restart/status,' this didn't go through the init process, it was implemented by writing custom shell scripts for each service or daemon, and each process would react to these commands in its own way (or not).
Read this
Hands-on with the Kano: The Linux kit that wants to help kids love coding

Hands-on with the Kano: The Linux kit that wants to help kids love coding

The Kano kit wants to make computing as easy as playing with Lego. Does it succeed?

Read More

The first really successful attempt to completely redesign and replace the 'init' process was Ubuntu's 'upstart ' utility. While it took a very different approach, and it addressed things like parallel rather than strictly sequential startup, and startup dependencies (don't start Y until X has been successfully started), it still pretty much maintained the same focus as init, dealing only with system startup and shutdown.

But now systemd comes along, and it certainly has not been restricted to startup and shutdown. It also takes over management of various dynamic services, thus replacing various other long established Unix/Linux utilities. Two very good examples of this are time-based initiation, starting specified tasks at specified times, which has been handled by the 'cron' utility, and socket-based initiation, starting specific tasks when a connection is accepted on specific ports or sockets, which has been handled by the 'inetd' utility.

Those who support systemd say that these kinds of things still fit with an expanded concept, rather than just "process start/stop at system boot and shutdown", it is "process start/stop in general", where system boot and shutdown is only one case, and there can be other triggers such as time, connection and others.

Those who oppose this point to the danger of integrating more diverse functionality into a single program. First, the program becomes more complex, and presumably potentially more prone to error or failure. Second, there is what I believe is a valid concern that integrating more functions into this kind of 'master program' actually can suppress creativity and continued development in the long term. Keeping to the examples already mentioned, there have been a lot of interesting developments and alternatives in both cron and inetd over the years. If these are now part of systemd, there is not going to be much independent work done to improve them.

2. It was created primarily by/for a large company (Red Hat).

There are a significant number of people in the Linux community who distrust large companies, period. No matter who the company is, no matter what they have done that is good or bad, no matter how much they have contributed. These people have their own reasons, some of them good, and some of them imagined.

On top of this, there are a lot of people in the Linux community who believe that Gnome 3 was already an example of Red Hat going too far, so when systemd came along they already had their knives out and sharpened.

Personally I don't belong to either of those groups. I have always had a lot of respect and even admiration for Red Hat, and that has actually increased as some of the best people I know in the Linux community have gone to work for them, and I have gotten to know some others as well.

What I think people who are rejecting Red Hat and anything they produce out of hand are overlooking is the very substantial contributions Red Hat has made over many years, in nearly every area of Linux, both technically and in the marketplace.

3. It is continuing to expand, absorbing other utilities and creating new dependencies.

I have mostly covered the "continuing to expand" topic above, with the examples of cron and inetd. But in addition to absorbing other functions and other utilities, there seems now to be a situation developing where some functions, although remaining separate from systemd, will actually depend on some part of systemd for their normal function - meaning that they won't work right, or won't work at all, without systemd.

I believe that this was the core of the dispute at Debian, which finally caused the split and the creation of the 'devuan' fork. Some of the Debian developers felt very strongly that no other parts of a Linux system should depend on the presence of systemd to function. Stated another way, they wanted Debian to take the position that different init systems could be selected on installation, and the overall system would still function.

There are two specific concerns in this area. The first is the impact that this kind of dependency could have on distributions which choose not to use systemd. The obvious example that is frequently used is the Network Manager package, which is certainly the most popular of its type in Linux today.

If Network Manager becomes dependent on systemd, then any distribution which doesn't want to use systemd then must also accept not being able to use Network Manager. Perhaps not a great example, because there are other good network management packages to choose from, but the point is clear.

The other concern is the danger that having various other functions incorporated into systemd which do not relate to startup and shutdown increases the chance that some unrelated problem or change might require a system reboot, or even cause a system crash. This actually goes back to the "keep it small, simple and focused" argument. The init process, whether it be initd or systemd or whatever else, is almost always process ID 1. (This is one of the few places I am tempted to say unconditionally always, but I think there are some weird and obscure situations where it could end up not being PID 1).

Anyone with Unix/Linux experience knows, if PID 1 dies, you are in deep trouble. Increasing the complexity and integrating more functionality increases the chance of something causing PID 1 exit, crash, hang or whatever.

4. It doesn't follow the Linux (Unix) philosophy of simple plain-text logs.

Linux (and Unix) logs have almost exclusively been kept in plain text files. This has a lot of advantages - you can read them and grep them very easily to find things being one of the biggest.

Systemd keeps its logs in binary format, and then provides utility programs to read and display them. How big of a problem is this? It clearly has an impact on convenience, and it might come back to bite us in areas like scanning across multiple different logs, looking for something that you aren't quite sure what/where it might be. But Linux admins who have had to wrestle with multi-gigabyte text files might not think this is such a bad idea, and it seems like a lot of the resistance on this specific point is more simple resistance to change per se rather than being specific to the text/binary file format.

5. There are some over-sized egos (and tempers) in the Linux community.

Not too much to say on this point. There has been more than enough name-calling, ranting, raving, swearing, holding of breath, and taking away toys and going home. All of these are part of the Linux world, but the degree and intensity has been exceptional. None of this contributes much that is useful to the discussion, but it seems unavoidable, especially when several of the points of contention that I listed above are based more on emotion than fact. My suggestion here is that if we can find a way to harness this, and turn it into renewable energy, it might at least contribute something to the world in general. Otherwise, keep a cork in it...

6. Linux is slowly becoming Windows.

I saw at least one comment that said, "Welcome to your Windows 8 Linux System". First, see the previous point. Playing the Windows card in Linux disputes is about as close as one can come to the 'nuclear option'. It's not going to happen. Linux will continue to develop, and be a good, solid, interesting environment, for a long time, either with or without systemd. I think it will be with systemd, based on nothing more than a look at the distributions which have adopted it already.

But I don't think it will become the only init package, I think development and support for alternatives will continue. If some of the most dire possibilities mentioned about inter-dependency, over-complication or instability turn out to be true, it will lose favor and be replaced again. One of the greatest strengths that we have in the Linux world is diversity and flexibility, and that should be comforting in these kinds of situations.

This dissertation has already gone on too long, and I have really glossed over or skipped entirely some pretty significant points. But I think that I hit most of the really big ones, and I hope that it explains answers the 'What is this really all about?' question for those who have not been following the situation very closely.

Please feel free to add comments, and point out issues both pro and con that I might have overlooked or left out. But let's try not to have this degenerate into yet another shouting, name-calling flame-fest, please?



