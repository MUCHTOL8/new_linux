# vimconfig-info

> VIM configuration instructions.


- Remap Escape to CapsLock

`setxkbmap -option <OPTION>`
`Where <OPTION> can be for example of:`
`caps:none          - Disables Caps Lock.`
`caps:super         - Caps Lock becomes an additional Ctrl.`
`caps:ctrl_modifier - Caps Lock becomes an additional Ctrl.`
`caps:numlock       - Caps Lock becomes an additional Num Lock.`
`caps:escape        - Caps Lock becomes an additional Escape.`
`caps:backspace     - Caps Lock becomes an additional Backspace.`
`for caps:backspace you'll need to enter this command after or it won't delete words: xset r 66`
`caps:swapescape    - Caps Lock becomes Escape, and Escape becomes Caps Lock.`
`Note Xmodmap is deprecated in favor of setxkbmap.`
`To return the keys back to default mappings use: setxkbmap -option`



- To make it persist between reboots:

`THIS METHOD DOESN'T PERSIST FOR ME ON UBUNTU EVEM AFTER A LOGOUT/LOGIN`
`edit etc/default/keyboard`
`Add the line XKBOPTIONS="ctrl:swapcaps" or switch swapcaps to whatever option above.`
`Below is a second worse option for persistence.` 
`Alt + F2 and enter gnome-session-properties`
`howtogeek.com has a good answer for key remapping on any OS.
`https://www.howtogeek.com/194705/how-to-disable-or-reassign-the-caps-lock-key-on-any-operating-system/`
`This website has the answer for persistents.`
`https://askubuntu.com/questions/1211307/persistent-remapping-of-keys-with-setxkbmap-or-xorg-configuration`

`.`
`--------------------------------------------------------------------------------------------`
`.`

Make .vimrc default instead of NeoVim's init.vim


- add the below lines to ~/.config/nvim/init.vim, or %LOCALAPPDATA%\nvim\init.vim

`set runtimepath^=~/.vim runtimepath+=~/.vim/after`
`let &packpath=&runtimepath`
`source ~/.vimrc`



