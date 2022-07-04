# easier to update apt repo to it's newest contents.
alias update='sudo apt update'

# ls outputs hidden contents, links, and ...., and it differentiates output types
# by color. Ex: blue=directory, teal=link, white=file. 
alias lscol='echo -e " 1.) blue   = directory \n 2.) white  = file \n 3.) teal   = symbolic path \n 4.) red    = broken symbolic path OR zipped directory \n 5.) purple = image data \n 6.) green  = ? \n"'
alias lss='ls -sS --classify --color=auto --almost-all'
alias lsize='ls -sS --classify --color=auto'
alias lst='ls -tr --classify --color=auto --almost-all' # ordered by most recent file access times
alias lt='ls -tr --reverse --classify --color=auto' # ordered by most recent file access times
alias lsa='ls -v --classify --size --color=auto --almost-all' # alphabetical order, block size of file/dir, hidden files, colorized.
alias la='ls -v --classify --size --color=auto' # alphabetical order, block size of file/dir, hidden files, colorized.

alias changeterminal='sudo update-alternatives --config x-terminal-emulator'

# pbcopy will copy selections from a file or an entire file into the X clipboard,
# which is the global clipboard.
##alias pbcopy='xclip -selection clipboard'
# pbpaste will paste whatever you've copied into the X clipboard onto the terminal
# or into a file.
##alias pbpaste='xclip -selection -o'


alias b='batcat --paging never --style=numbers'

alias f='firefox &'

alias su='amixer -D pulse sset Master 10%+'
alias sd='amixer -D pulse sset Master 10%-'

###########################################
###### --[ noteSystem Shortcuts ]-- #######
###########################################
alias 1='n -o assembly-info.md'
alias 2='n -o network-stack-info.md'
alias 3='n -o build-systems-info.md'


alias dv='n dv.md'
alias dv0='n dv0.md'
alias dv1='n dv1.md'
alias dv2='n dv2.md'
alias dv3='n dv3.md'
alias dv4='n dv4.md'
alias dv5='n dv5.md'
alias dv6='n dv6.md'
alias dv7='n dv7.md'
alias dv8='n dv8.md'
alias dv9='n dv9.md'
alias dvh='n dv-help.md'

alias n='noteSystem'
#alias nn='n /home/dv/.tldr/tldr/pages/personal/dv.md'
alias nn='n dv.md'
alias n0='n dv0.md'
alias n1='n dv1.md'
alias n2='n dv2.md'
alias n3='n dv3.md'
alias n4='n dv4.md'
alias n5='n dv5.md'
alias n6='n dv6.md'
alias n7='n dv7.md'
alias n8='n dv8.md'
alias n9='n dv9.md'
alias nh='n dv-help.md'
alias vi='n vim-info'
alias vs='n vim-short'


## Make it easier to clear the screen.
alias c='clear'
alias du='du -h'

alias src='source ~/.bash_aliases'
alias sxiv='sxiv -t'


###########################################
####### --[ Directory Shortcuts ]-- #######
###########################################

alias 1='cd ~/Documents/d_notes/'
alias 2='cd ~/Downloads/'
alias 3='cd ~/.tldr/tldr/pages/personal/'
alias 4='cd ~/.tldr/tldr/pages/linux/'
alias 5='cd ~/dscriptsInProgress_/'
alias 6='cd /usr/local/bin/scripts/'
#alias 6='cd ~/code/sourceCode/downloadedSourceCode/'
##alias 7='cd ~/ && ls' 
alias b='vim ~/.bash_aliases'
alias v='vim ~/.vimrc'

###########################################
########## --[ Miscellanious ]-- ##########
###########################################

export PATH=/usr/local/bin/scripts:$PATH


#shopt -s autocd
xrandr --output HDMI-1 --above LVDS-1
##feh --bg-fill /home/dv/Pictures/germanLanguage/vorbei/a12bwhite_blank.jpg
setxkbmap -option caps:escape
