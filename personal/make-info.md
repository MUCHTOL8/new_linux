# make-info

> make command documentation and 'how to' guide

Reference:
================
An article on the various build-systems - it favors premake and cmake (but mostly premake).
https://julienjorge.medium.com/an-overview-of-build-systems-mostly-for-c-projects-ac9931494444
info make
man make
The online make manual (asthetically pleasing)
https://www.gnu.org/software/make/manual/


- You Have 4 methods to choose from:

`1. Old School: ./configure, make, make install - Section. 1`
`2. Apt or Yum Dependency Management ------------ Section. 2`
`3. Dpkg-buildpackage -b -uc -us ---------------- Section. 3`
`4. Git Download and Dependency Management ------ Section. 5`
`HIGHLY SUGGESTED STEP: ./configure -help ------- Section. 4`


---------------------------------------  |Section 1|  ----------------------------------------
#---------------------------------------------------------------------------------------------
-------------------------------  |OLD SCHOOL SOURCE INSTALL|  --------------------------------
#---------------------------------------------------------------------------------------------

 - Installing from source: download the source file, unpack it (with either zip or tar), change into the newly created directory, and then issue the commands:

`./configure`
`make`
`make install`

This works if the application was built with autoconf/automake. The dependencies are/were almost always outlined in a README file within the source. If you have the necessary dependencies installed the package will install.

- Ubuntu doesn’t ship with all the necessary tools to build from source. So, Install:

`sudo apt-get install autoconf build-essential build-dep`
`includes the gcc/g++ compilers and libraries as well as a few other necessary utilities`

- Or, for Fedora:

`sudo yum install yum-utils`
`The above command would install the yum-builddep package.`


---------------------------------------  |Section 2|  ----------------------------------------
#---------------------------------------------------------------------------------------------
----------------------  |MANAGING DEPENDENCIES WITH A PACKAGE MANAGER|  ----------------------
#---------------------------------------------------------------------------------------------

One way to install from source, but avoid the dependency nightmare, is to first work with the build-dep tool. Say you want to install {{audacity}} using build-dep; 

- You must first uncomment the two deb-src lines in 

`/etc/apt/sources.list. (Remove the leading #)`
 
 - Now update apt source repository list. Run:

`sudo apt-get update`

- First: use apt to install the necessary dependencies for {{Audacity}}. Use the command:

`sudo apt-get build-dep {{audacity}}`

- Second: Download the source package with the command:

`sudo apt-get source {{audacity}}`
`OR for Debian`
`sudo apt source {{audiacity}}`

- In your current working directory, you should see a new directory called {{audacity-XXX}} (where XXX is the release number). Change into that directory. Now issue the commands:

`./configure`
`make`
`sudo make install`


{{Audacity}} should now be installed and ready to use.


---------------------------------------  |Section 3|  ----------------------------------------
#---------------------------------------------------------------------------------------------
--------------------------------  |BUILD FAILED, USING DPKG|  --------------------------------
#---------------------------------------------------------------------------------------------

 - If the installation fails, you might have to revert to using the dpkg tool like so:

`sudo dpkg-buildpackage -b -uc -us`

 - The options above are as follows:

`b – build binary`
`uc – do not sign the .changes file`
`us – do not sign the source package`


---------------------------------------  |Section 4|  ----------------------------------------
#---------------------------------------------------------------------------------------------
--------------------------  |BUILD FAILED, USING ./CONFIGURE -HELP|  -------------------------
#---------------------------------------------------------------------------------------------

 - Why might a source package fail to install? 

`Beyond not having all of the necessary dependencies, the answer very well might lie in the ./configure command.`

 - From within the application source directory you’ve downloaded, issue the command: 

`./configure - help`
`You will be presented with a list of configuration options that can be used that are specific to that package.`

Make sure to issue ./configure –help before issuing ./config. because every application you attempt to install will display different options for the ./configure command.

- Possible configuration options include:

`    –prefix=PREFIX (install architecture-independent files in a non-standard location such as –prefix=/opt)`
`    –build=BUILD (configure for a specific system architecture)`
`    –host=HOST (the architecture of the system you want the file to run on, so you can compile the application on one machine and run it on another)`
`    –disable-FEATURE (this allows you to disable specific features of an application)`
`    –enable-FEATURE (this allows you to enable specific features of an application)`
`    –with-PACKAGE=yes (use a specific PACKAGE)`
`    –without-PACKAGE (do not use a specific PACKAGE)`

 - Once the configure script completes issue:

`make`
`make install`

The installatoin is complete.


---------------------------------------  |Section 5|  ----------------------------------------
#---------------------------------------------------------------------------------------------
----------------------------------  |BUILDING WITH GIT|  -------------------------------------
#---------------------------------------------------------------------------------------------

 - Ubuntu doesn’t ship with Git installed. Use command:

`sudo apt-get install git`

 - Pull down the source for the {{Clementine audio player}} with the command:

`git clone {{https://github.com/clementine-player/Clementine.git}}`

 - Change into the newly added directory with the command:

`cd {{Clementine}}`

 - Run the following commands to build {{the player}} from source:

`cd bin`
`cmake ..`
`make -j8`
`sudo make install`

If the installation complains about dependencies, you can scan back through the output to find out what all needs to be installed.

 - In many cases, you can pick up the dependencies with the command:

`sudo apt-get build-dep {{clementine}}`










