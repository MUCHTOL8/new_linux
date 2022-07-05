# shell-info

> Information on the various linux shells and how to change to them.

see which shells are installed
cat /etc/shells

Installing Another Shell
sudo apt-get install {{shell}}

The $SHELL environment variable holds the name of your current shell. echo $SHELL

Start a shell by typing it's name
${{shell_name}}

When you launch a new shell (or any other program), it inherits the environment of the parent shell.

chsh command allows you to change your default shell.
It allows you to change both the default login and default interactive shells. You might want to change one or the other, or both.

To set your login shell, use chsh with no parameters:
chsh

You’re prompted for your password. Then, you must type the path to the new shell and hit Enter.

To change your interactive shell use chsh with the -s (shell) option.
chsh -s /usr/bin/fish

You need to log out and back in for the change to take effect. 

Changing Another User Account’s Shell
sudo chsh -s /usr/bin/fish mary




1. Bourne - 1979 -  Stephen Bourne at Bell Labs - Fast but not interactive and lacks features.`

`$sh`

2. Bash - 1988 - Brian Fox for the GNU project - very compatible with the bourne shell + some improvements such as job control, command-line editing, unlimited size command histroy, etc

`$bash`

3. C - 1970 - Bill Joy - Has C style syntax

`$csh`

4. TENEX C - very compatible with the c shell + improvments such as command-line editing, command-line completion, job control.

`$tcsh`

5. Korn - 1980 - David Korn - incorporates features from the C shell and Tenex C shell. Faster than the C shell, and is a powerful high-level programming langauge.

`$ksh`

6. Z - - - is an extension to bourne shell. Combines features form Bash, ksh, and tcsh. Plugin and theme support, Filename generation, concept index, functions index, spelling correction and approximate completion, automatic cd, login/logout watching.

`$zsh`

7. Fish - 2005 - Not based on bourne shell or c shell. Auto suggestions, has web-based configurations, supports 256 terminal technology, tab completion abbreviations, wait for command: which waits for background processes, variables can also be used as commands.

`$fish`

rbash
This Restricted bash shell provides minimal functionality to the person or script running in it.

ash
The Almquist shell is a lighter version of bash.

dash
The Debian Alquist Shell is the default shell script in Ubuntu. While bash is the default login and interactive shell, dash is used to run system processes because it’s much lighter than bash.





-----------------------------------------------------EXPLANATIONS---------------------------------------------

- 1.) Bourne Shell

`XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx`
`xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
`- xxxxxxxxxxxxxx`
`- xxxxxxxxxxxxxx`


- 2.) Bash Shell 

`Brian Fox developed Bash in 1988 for the GNU project as a free version of the Bourne Shell.`
`The name is an acronym for the "Bourne-Again SHell"`
`One reason Bash is considered so powerful is because it is scriptable.`
`A shell script is a list of commands, segregated, in order to optimize the efficiency of any task.`
`In other words, anything you can type into Bash manually you can also list in a plain-text file and have Bash run it for you.`
`Some features of Bash are:`
`- Directory manipulation`
`- Job control`
`- Brace expansion`
`- Tilde expansion`
`- Aliases`
`- Command history`
`- Key bindings`
`- Integrated programming features`
`- Control structures`
`- Dynamic loading of built-ins`

- 3.) C Shell

`xxxxxxxxxxxxxxxxxxxxxxxxxxxx`
`xxxxxxxxxxxxxxxxxxxxxxxxxxxx`
`- xxxxxxxxxxxxxxxxxxxxxxxxxx`
`- xxxxxxxxxxxxxxxxxxxxxxxxxx`



- 4.) TENEX C Shell

`TENEX C shell was developed by Ken Greer at Carnegie Mellon University in 1979.`
`The "T" comes from the TENEX operating system developed in 1969 by BBN for the PDP-10 mainframe computer family.`
`Tcsh is an enhanced but completely compatible version of the Berkley UNIX C Shell`
`Early versions of the MacOS X shipped with tcsh as the default shell.`
`Tcsh is the default root shell of FreeBSD`
'Some features of TENEX C are:`
`- Programmable command completion`
`- Command-line editing`


- 5.) Korn Shell

`David Korn developed Ksh at AT&T Bell Laboratories in 1986.`
`The Korn shell has released different version such as pdksh, mksh, ksh88, and the most recent ksh93.`
`It is a reimplementation of the Bourne shell.`
`The Korn shell's command-line editing modes are the feature that tend to attract people to it at first;`
`Korn shell's command editor interface enables the quick correcction of typing errors, easy recall, and reuse of command history.`
`It provides filename completion but not command completion.`
`Job control is provided for interactive users.`
`Ksh allows developers to create new shell commands when needed.`
`Some features of Korn are:`
`- Job control`
`- Aliases`
`- Functions`
`- Command History`
`- Command-line editing`
`- Integrated programming features`
`- Control structures`
`- Debugging primitives`
`- Regular expressions`
`- Advanced I/O features`


- 6.) Z Shell

`Paul Fastad developed Zsh in 1990`
`The name Zsh comes form Yale professor Zong Shao.`
`Zsh is the default shell of MacOS X.`
`Zsh and Bash both share a similar and impressive array of features, but also have their own distinct tools as well.`
`If your're looking for extensibility, greater customization and advanced features not found in bash, then zsh shell is an excellent chioce.`
`Customizing the terminal is very easy with "Oh My Zsh", a framework for managing Zsh configuration. You can also try Prezto, Zgen, or Antigen.`
`Some features of Zsh are:`
`- Tab completion`
`- Clever history`
`- Remote file expansion`
`- Command auto-completion`
`- Improved variable handling`
`- Spelling correction`
`- Shared command history`
`- Kill tab completion`
`- Environment variable easy setup`
`- Customization`

- 7.) Fish Shell

`???????? developed Fish in 2005`
`Fast with powerful features.`
`Ready to be used immediately, without requiring extensive configuration.`
`Performs syntax highlighting as you are typing.`
`Shows a line as red unless/until it becomes a valid command at which time the line turns blue.`
`Inline auto-suggestions based on history work ot of the box. Using your history Fish suggests possibilities to complete the command.`
`Configuring the look of the shell is easy as running fish_config opens a web-based GUI where you can select the color them and look of the shell.
`Some features of Fish are:`
`- Inline auto-suggestion`
`- Superb tab completion`
`- Syntax highlighting`
`- Intuitive wildcard support`
`- Web-based configuration`
`- Sane scripting`

- 8.) Rbash Shell

- 9.) Ash Shell

- 10.) Dash Shell












