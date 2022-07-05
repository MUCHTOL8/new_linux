# bash_aliases-info

> A backup of .bash_aliases in case of an emergency.


------------------------------COPY BELOW THIS LINE-------------------------------------------


 #                        ( LOCAL) .BASH_ALIASES


#				Section.1
#---------------------------------------------------------------------
#                           |SHELL FUNCTION|
#---------------------------------------------------------------------

#used a bash function because the alias wouldn't work with taking user input and a doing a second command after the first was completed.
cddcdd() {
#     cd "$1" && ls -lhtra;
     cd "$1" && ls -a --color=auto;
}

cddedd() {
     cd "$1" && ls -a --color=auto;
}


#				Section.2
#---------------------------------------------------------------------
#                      |CD TO A FREQUENT LOCATION|
#---------------------------------------------------------------------

alias 1='cd ~/Documents/notes/'
alias 2='cd ~/Downloads/'
alias 3='cd ~/.tldr/tldr/pages/linux/'
alias 4='cd ~/code/sourceCode/myOwnCode/projects/'
alias 5='cd ~/code/sourceCode/downloadedSourceCode/'
alias 6='cd /var/log/'
alias d='cddedd ~'


#				Section.3
#---------------------------------------------------------------------
#               |SHORTENED A FREQUENT OR DIFFICULT COMMAND|
#---------------------------------------------------------------------

alias c='clear'  # Clear screen.
alias update='sudo apt update' # Update apt package list from repos.
alias cd='cddcdd'
alias f='cddcdd ..'
alias changeterminal='sudo update=alternatives --config x-terminal-emulator' # ??????? obviously changes terminals. But how exactly?

#				Section.4
#---------------------------------------------------------------------
#                        |ADDED SPECIFIC FLAGS|
#---------------------------------------------------------------------

alias du='du -h --max-depth=1'  # Hard drive use of 1 dir & contents.
alias df='df -h'  # System disk space available in Megabytes.
alias ls='ls -a --color=auto'  # Colorize ls output.
alias free='free -h'
#				Section.5
#---------------------------------------------------------------------
#                        |OPENED FILE WITH VIM|
#---------------------------------------------------------------------

alias vdv-help='vim ~/.tldr/tldr/pages/linux/dv-help.md'
alias vdv='vim ~/.tldr/tldr/pages/linux/dv.md'
alias vdv0='vim ~/.tldr/tldr/pages/linux/dv0.md'
alias vdv1='vim ~/.tldr/tldr/pages/linux/dv1.md'
alias vdv2='vim ~/.tldr/tldr/pages/linux/dv2.md'
alias vdv3='vim ~/.tldr/tldr/pages/linux/dv3.md'
alias vdv4='vim ~/.tldr/tldr/pages/linux/dv4.md'
alias vdv5='vim ~/.tldr/tldr/pages/linux/dv5.md'
alias vdv6='vim ~/.tldr/tldr/pages/linux/dv6.md'
alias vdv7='vim ~/.tldr/tldr/pages/linux/dv7.md'
alias vdv8='vim ~/.tldr/tldr/pages/linux/dv8.md'
alias vdv9='vim ~/.tldr/tldr/pages/linux/dv9.md'
alias v='vim ~/.vimrc'
alias b='vim ~/.bash_aliases'


#				Section.6
#---------------------------------------------------------------------
#                       |SHORTCUT TO NOTES (TLDR)|
#---------------------------------------------------------------------

alias dv-help='tldr "dv-help"'
alias dv='tldr dv'
alias dv0='tldr dv0'
alias dv1='tldr dv1'
alias dv2='tldr dv2'
alias dv3='tldr dv3'
alias dv4='tldr dv4'
alias dv5='tldr dv5'
alias dv6='tldr dv6'
alias dv7='tldr dv7'
alias dv8='tldr dv8'
alias dv9='tldr dv9'
alias vv='tldr vim-info'
alias vs='tldr vim-short'


#				Section.7
#---------------------------------------------------------------------
#              |ANYWHERE ACCESS TO SCRIPTS IN LOCAL DIRECTORIES|
#---------------------------------------------------------------------

alias ghidra='sh ~/inPathBinaries/ghidra_10.0.2_PUBLIC/ghidraRun'

#				Section.8
#---------------------------------------------------------------------
#                           |RETIRED ALIASES|
#---------------------------------------------------------------------

# pbcopy will copy selections from a file or an entire file into the X clipboard,
# which is the global clipboard.
##alias pbcopy='xclip -selection clipboard'
# pbpaste will paste whatever you've copied into the X clipboard onto the terminal
# or into a file.
##alias pbpaste='xclip -selection -o'

# ls outputs hidden contents, links, and ...., and it differentiates output types
# by color. Ex: blue=directory, teal=link, white=file. 
##alias ls='ls -atr --color=auto'
# ls same as ls -a but with most recently touched files and directories in reverse
# order.
##alias lsr='ls -atr --color=auto'

