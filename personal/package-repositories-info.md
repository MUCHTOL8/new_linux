# package-repositories-info

> An explanation of how to use, add, delete repos and how they work.

This page explains repos and how to use them quite well:
https://linuxize.com/post/how-to-add-apt-repository-in-ubuntu/

Install the package: software-properties-common.
Now you have the tools needed to add/remove repos and their authentication keys.
EXAMPLE USAGE
1. Import the repository public key:
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
2. Add the MongoDB repository:
## add-apt-repository [options] repository
add-apt-repository 'deb [arch=amd64] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse'
The repository will be appended to sources.list file.
You can now install any of the packages from the newly enabled repository:
3. Remove the MongoDB repository.
add-apt-repository --remove 'deb [arch=amd64] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse'

================================
PPAs (Personal Package Archives)
================================
A PPA is a service that allows users to upload Ubuntu source packages that are built and published with Launchpad as an apt repository.
When adding a PPA repository the add-apt-repository command creates a new file under the /etc/apt/sources.list.d/ directory.

=======================================
Public Repositories: Creating and Using
=======================================


==============================
Ubuntu Repository Descriptions
==============================
Main = Canonical-supported free and open-source software.
Universe = Community-maintained free and open-source software.
Restricted = Proprietary drivers for devices.
Multiverse = Software restricted by copyright or legal issues.

===============================
The general syntax of the /etc/apt/sources.list file takes the following format:
===============================

Example: (1)deb (2)http://repo.tld/ubuntu (3)distro (4)component...

1. The first entry in the line defines the type of the archive. The archive type can be either deb or deb-src. Deb implies that the repository contains .deb packages while deb-src implies source packages.
2. The second entry is the repository URL.
3. The third entry specifies the distribution code name, such as beaver, xenial and so on.
4. The last entries are the repository components or categories. The default Ubuntu repositories are split into four components - main, restricted, universe and multiverse. Generally, third-party repositories have only one category.

The format for the files under the /etc/apt/sources.list.d/ directory is the same as for the regular sources.list file.

Most repositories are providing a public key to authenticate downloaded packages which need to be downloaded and imported.

================================
LTS (Long-Term Support) has ended (3-5 years usually), so package manager has stopped working.
=================================
Enabling the old-releases repos for Ubuntu. When an LTS distro is marked as EOL (End of Life) the mainline repos are moved to an alternate location where they are preserved for historical purposes. These repos are then no longer maintained.
1. First created a backup of the /etc/apt/sources.list
2. Replace the contents of sources.list to point to the old-relases repos.
3. Refresh the package index from their sources by running: 'apt-get update'

Below is a copy of the updated sources.list contents but you can also search for it on the web:
# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.

deb http://old-releases.ubuntu.com/ubuntu/ lucid main restricted
deb-src http://old-releases.ubuntu.com/ubuntu/ lucid main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://old-releases.ubuntu.com/ubuntu/ lucid-updates main restricted
deb-src http://old-releases.ubuntu.com/ubuntu/ lucid-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://old-releases.ubuntu.com/ubuntu/ lucid universe
deb-src http://old-releases.ubuntu.com/ubuntu/ lucid universe
deb http://old-releases.ubuntu.com/ubuntu/ lucid-updates universe
deb-src http://old-releases.ubuntu.com/ubuntu/ lucid-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://old-releases.ubuntu.com/ubuntu/ lucid multiverse
deb-src http://old-releases.ubuntu.com/ubuntu/ lucid multiverse
deb http://old-releases.ubuntu.com/ubuntu/ lucid-updates multiverse
deb-src http://old-releases.ubuntu.com/ubuntu/ lucid-updates multiverse

## Uncomment the following two lines to add software from the 'backports'
## repository.
## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
# deb http://old-releases.ubuntu.com/ubuntu/ lucid-backports main restricted universe multiverse
# deb-src http://old-releases.ubuntu.com/ubuntu/ lucid-backports main restricted universe multiverse

## Uncomment the following two lines to add software from Canonical's
## 'partner' repository.
## This software is not part of Ubuntu, but is offered by Canonical and the
## respective vendors as a service to Ubuntu users.
# deb http://old-releases.ubuntu.com/ubuntu lucid partner
# deb-src http://old-releases.ubuntu.com/ubuntu lucid partner

deb http://old-releases.ubuntu.com/ubuntu lucid-security main restricted
deb-src http://old-releases.ubuntu.com/ubuntu lucid-security main restricted
deb http://old-releases.ubuntu.com/ubuntu lucid-security universe
deb-src http://old-releases.ubuntu.com/ubuntu lucid-security universe
deb http://old-releases.ubuntu.com/ubuntu lucid-security multiverse
deb-src http://old-releases.ubuntu.com/ubuntu lucid-security multiverse

