# vim-short

> Guide to using Vim commands efficiently.

- undo jump. (jump back to where your cursor just was up to 100 places back).

`Ctrl + o`

- redo jump.

`Ctrl + i`

- shows the last 100 jumps

`:jumps`

+ move to last line

`G`

+ move to first line

`gg`

+ moves back to the last positiion (before G or gg)

`''`

- moves to the next occurence of {char} in the line.

`Ctrl + f{char}`

- like f but moves backwards.

`Ctrl + F{char}`

- append at end of word

`ea`

- join line below to the current one

`J`

- change (replace) an entire line

`cc`

- change (replace to the end of word

`cw`

- change (replace) to the end of line

`c$`

- delete character at cursor and substitute text

`s`

- Insert at the beginning of the line

`I`

- delete line at cursor and substitute text (same as cc)

`S`

- transpose two letters (delete and paste, technically)

`xp`

- repeat last command

`.`

Visual Mode:

- move to other end of marked area

`o`

- start visual block mode

`Ctrl + v`

- move to Other corner of block

`O`

- mark a word

`aw`

- a() block (with braces)

`ab`

- a {} block (with brackets)

`aB`

- inner () block 

`ib`

- inner {} block

`iB `

Visual Commands:

- shift right

`>`

- shift left

`<`

- switch case

`~`

Cut and Paste:

- yank 2 lines

`2yy`

- yank to end of word

`yw`

- yank to end of line

`y$`

- put (paste) the clipboard after cursor

`p`

- put (paste) before cursor

`P`

- delete (cut) the current word

`dw`

- insert newline without entering insert mode (find blank line)

`yy`
`THEN`
`p`

- add the same text to multiple lines at once.

`ctrl + v`
`{{#}}j`
`I#`
`<esc>`

- save and quit

`ZZ`

- quit without saving

`ZQ`
