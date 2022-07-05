# vim-info

> User manual for vim.

Also Reference:
vim-short.md
vimrc-info.md
vimconfig-info.md



- For a backup of your .vimrc view:

`tldr vimrc-info.md`


> Useful Search Terms: clipboard, window, split, buffer, tab, (select) block, mark (word), shift (text), swap (case), visual (modes), switch (buffer).


- Look into:
- Vim WorkSpaces
- Vim macros
- Setup git with vim
- spellcheck
- visualblock mode
- word and line completion

`Completion is also context aware: start with Ctrl-P and continue with Ctrl-N Ctrl-P. Repeat until you have everything you typed previously. Ctrl-X Ctrl-L works with entire lines.`

- everything in this youtube video AND the comments!
- https://www.youtube.com/watch?v=B-EPvfxcgl0
- create a vim-config.md and add the key remapping to that and a good .vimrc config (check what you have on your other computers as they had some good stuff).`
- :qa

`quits all windows and buffers.`

- folding

` Folding is another one good one to know, ie: zf, zfap, zfip, etc. etc. ` 

- File Explorers in Vimm

` :Explorer :Lex :Sex :somethingelse... and FZF but that's a seperate program.`
`  @hogstudio  I don't need fzf actually.`
`I have`
`set path=.,** `
`set wildmenu`
`set wildmode=longest:list,full`
`In my vimrc file.`
`Then i navigate to workspace folder on terminal and open vim there .`
`After that just do `
`:find namepattern<tab>`
`I try to use less plugins and try to use more vim features.`






- Same as hitting Esc

`ctrl + [

--- Vim Macros
Macros are used to repeat a sequence of key strokes exactly.
To see the contents of your buffers type: 
- :reg

To make a macro:
- press q 
- press a key which will then be used as a holding buffer (ex. 9,k,$).
- Every button you push from this point will be recorded as your macro.
- press q again to end the recording.
- To use the recording:

` @{{buffer character}} + [Enter]`
`you can add a number in front of the @ to do it more than once`

--- Basic Vim Commands
- Performs a search of help documentation for whatever keyword you enter.

`:help [keyword]`

- Opens a file, where [file] is the name of the file you want opened.

`:e [file]`

- Saves the file you are working on.

`:w`

- Allows you to save your file with the name you've defined.

`:w [filename]`

- Save your file and close Vim.

`:wq`

- Quit without first saving the file you were working on.

`:q!`

--- Vim Commands for Movement

- Puts the cursor at the top of the screen.

`H`

- Puts the cursor in the middle of the screen.

`M`

- Puts the cursor at the bottom of the screen.

`L`

- Puts the cursor at the start of the next word.

`w`

- Puts the cursor at the start of the previous word.

`b`

- Puts the cursor at the end of a word.

`e`

- Places the cursor at the beginning of a line.

`0`

- Places the cursor at the end of a line.

`$`

- Takes you to the start of the next sentence.

`)`

- Takes you to the start of the previous sentence.

`(`

- Takes you to the start of the next paragraph or block of text.

`}`

- Takes you to the start of the previous paragraph or block of text.

`{`

- Takes you one page forward.

`Ctrl + f`

- Takes you one page back.

`Ctrl + b`

- Places the cursor at the start of the file.

`gg`

- Places the cursor at the end of the file.

`G`

- Where # is the number of a line, this command takes you to the line specified.

`#`


--- Vim Commands for Editing.

- Copies a line.

`yy`

- Copies a word.

`yw`

- Copies from where your cursor is to the end of a line.

`y$`

- Highlight one character at a time using arrow buttons or the h, k, j, l buttons.

`v`

- Highlights one line, and movement keys can allow you to highlight additional lines.

`V`

- Paste whatever has been copied to the unnamed register.

`p`

- Deletes highlighted text.

`d`

- Deletes a line of text.

`dd`

- Deletes a word.

`dw`

- Deletes everything from where your cursor is to the end of the line.

`D`

- Deletes everything from where your cursor is to the beginning of the line.

`D0`

- Deletes everything from where your cursor is to the beginning of the file.

`dgg`

- Deletes everything from where your cursor is to the end of the file.

`dG`

- Deletes a single character.

`x`

- Undo the last operation; u# allows you to undo multiple actions.

`u`

- Redo the last undo.

`Ctrl + r`

- Repeats the last action.

`.`

- Copy to buffer a

`"ay`

`Copy 4 lines.`
`"a4yy`

- Paste from buffer a

`"pa`

- Look at all buffer contents.

`:reg`
`OR`
`:registers`

--- Vim Commands for Searching Text.

- Searches for text in the document where keyword is whatever keyword, phrase or string of characters you're looking for.

`/[keyword]`

- Searches previous text for your keyword, phrase or character string.

`?[keyword]`

- Searches your text again in whatever direction your last search was.

`n`

- Searches your text again in the opposite direction.

`N`

- This replaces all occurrences of a pattern without confirming each one.

`:%s/[pattern]/[replacement]/g`

- Replaces all occurrences of a pattern and confirms each one.

`:%s/[pattern]/[replacement]/gc`


--- Vim Commands for Working with Multiple Files.

- Switch to next buffer.

`:bn`

- Switch to previous buffer.

`:bp`

- Close a buffer.

`:bd`

- Opens a new file and splits your screen horizontally to show more than one buffer.

`:sp [filename]`

- Opens a new file and splits your screen vertically to show more than one buffer.

`:vsp [filename]`

- Lists all open buffers.

`:ls`

- Split windows horizontally.

`Ctrl + ws`

- Split windows vertically.

`Ctrl + wv`

- Switch between windows.

`Ctrl + ww`

- Quit a window.

`Ctrl + wq`

- Moves your cursor to the window to the left.

`Ctrl + wh`

- Moves your cursor to the window to the right.

`Ctrl + wl`

- Moves your cursor to the window below the one you're in.

`Ctrl + wj`

- Moves your cursor to the window above the one you're in.

`Ctrl + wk`


---  Marking Text (Visual Mode)

- starts visual mode, you can then select a range of text, and run a command.

`v`

- starts linewise visual mode (selects entire lines).

`V`

- starts visual block mode (selects columns).

`Ctrl + v`

- a block with ().

`ab`

- a block with {}.

`aB`

- inner block with ().

`ib`

- inner block with {}.

`iB`

- mark a word.

`aw`

- exit visual mode.

`Esc`

> Once you've selected a particular range of text, you can then run a command on that text such as the following:

- delete marked text.

`d`

- yank (copy) marked text.

`y`

- shift text right.

`>`

- shift text left.

`<`

- swap case (upper or lower).

`~`

- copy from vim into the system clipboard (to copy external text into vim).

`+y`

- paste from system clipboard into vim (to past vim text to another program).

`+p`

--- Tab pages

- opens a new tab and will take you to edit "file".

`:tabedit file`

- move to the next tab.

`gt`

- move to the previous tab.

`gT`

- move to a specific tab number (e.g. 2gt takes you to the second tab).

`#gt`

- list all open tabs.

`:tabs`

- close a single tab.

`:tabclose`







