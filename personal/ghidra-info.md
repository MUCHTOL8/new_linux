# ghidra-info

> ghidra download/install guide and user manual.

`.`
`.`
#---------------------------------------------------------------------------------------------
------------------------------  |DOWNLOADING AND INSTALLING|  --------------------------------
#---------------------------------------------------------------------------------------------

- Visit this site:

`https://github.com/NationalSecurityAgency/ghidra/releases`

- Right click on and copy the address of the file:

`ghidra_xx.x.x_PUBLIC_XXXXXXXXX.zip`

- Open a terminal and change directory to your desitination directory:

`CTRL + ALT + T (on Ubuntu)`
`cd ~/inPathBinaries`

- Download the ghidra file:

`wget {{https://github.com/NationalSecurityAgency/ghidra/releases}}`

- Unarchive the zip file.

`unzip {{ghidra_10.0.2_PUBLIC.zip}}`

- Download the latest OpenJDK version.

`sudo apt-get install {{openjdk-11-jdk}}`

- Check if $JAVA_HOME variable is set

`echo $JAVA_HOME`

- If nothing is returned, set the $JAVA_HOME variable:

`export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64`
`Change the java version as needed.`
`This puts the the javaruntime (java/java.exe) on the system PATH (I believe) (I don't know if this step is actually necessary or not, so you may want to try it without doing this first and update this document.)`

- cd into the unzipped {{ghidra_10.0.2_PUBLIC}}

`cd {{ghidra_10.0.2_PUBLIC}}`

- run the ghidraRun script

`sh ghidraRun`

Ghidra should now start running.
`.`
`.`
#---------------------------------------------------------------------------------------------
--------------------------------------  |GHIDRA USAGE| ---------------------------------------
#---------------------------------------------------------------------------------------------

- Add a shortcut to the ghidraRun script in .bash_aliases.

`vim ~/.bash_aliases`
`alias ghidra='sh {{path_to_ghidraRun}}`

- Change directory into the docs

`cd docs`

- Open the CheatSheet.html

`firefox CheatSheet.html`
