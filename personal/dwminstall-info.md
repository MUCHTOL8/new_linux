#dwm install and config

> Guide to install, configure, and use suckless' window manager, dwm.

This Method installs dwm with an apt package manger.deb so apt can keep track of the package and update it (the source code) for you and then you can rebuild the package with the newer source at any time. 

- install apt-src so you can download source packages from whatever repos you have enabled.

`sudo apt install apt-src`

- Enable source repositories (GUI method on Ubuntu)

`1. Start Software & Updates app.`
`2. On the first tab tick the tab "source code".`
`3. Close window, click "Reload" and then put in your password`

- Log into terminal as super user

`su -`
`or`
`sudo su -`

- Make a directory to download your source code in and move into it.

`mkdir srcpackages (or whatever you want to call it)`
`cd srcpackages`
`-`
`(my prefered place to install)`
`mkdir /home/dv/Code/sourceCode/DownloadedSourceCode/dwm-6.1`
`cd /home/dv/Code/sourceCode/DownloadedSourceCode/dwm-6.1`

- Download the source using the apt package manager so it will keep track of it for you and update it for you. apt-src will download all of the dependencies you need to build and run the package.

`apt-src install dwm`

- Build the binary while still inside the dir dwm-6.1

`apt-src build dwm`

- Install the binary using dpkg

`dpkg --install ./dwm_6.1-5_amd64.deb`

- Log out and access it through the gear at bottom right of your display manager.

