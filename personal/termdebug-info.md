#termdebug

> termdebug is a vim add-on that comes with the vim package and is easily to get started. It can interface with a number of debuggers for a variety of languages.

IMPORTANT!!!!! TermDebug is clearly meant to be used with gvim but you can use it with any type of vim. Mouse clicks are important for speed of use.


--------------------------------GETTING SETUP

- Check that gcc compiler is installed.

`gcc -c`

- If not installed then install with:

`sudo apt install gcc`

- Enable termdebug in vim (it automaically uses gcc for c apps if it's available):

`packadd termdebug`
`Avoid repeatedly typing this line by adding it to your .vimrc`

- choose your debugger. This is only necessary if you aren't using the C language.

`:let termdebugger="rust-gdb"

-------------------------------COMPILING AND STARTING TERMDEBUG

- access the termdebug help page

`:help terminal-debug`

- Start termdebug by typing this in command mode in vim:

`Termdebug`

- stop gdb from starting a shell by putting this in the .dbinit in the home folder.

`(gdb) set startup-with-shell off`
`Don't bother with this unless you have a problem.`

- Once you've written a C program you can compile by typing this in command mode:

`:!gcc -g {{program.c}} -o {{program}}`
`Use bash command '$tldr gcc-info' for information on how to work gcc`

------------------------------SWAPPING AND RESIZING WINDOWS

- Switch which window is in foucs:

`<c-w> or :Gdb`

- Re-arrange the windows (swap places):

`ctrl-w L`
`For more info use this in cmd mode:`
`:help window-moving`

- Resize the windows:

`Minimize - CTRL + w then _`
`Reduce Size - CTRL + w then -`
`Increase Size - CTRL + w then +`

- Use a wide layout automatically by adding this to your .vimrc:

`let g:termdebug_wide=1`
`:help termdebug_wide`
`This is good if your screen is wide, not tall.`

-------------------------------OPEN A FILE

- After compiling, in the gdb window enter command mode and type:

`file {{Program_Binary}}`

OR

- Pass {{Program_binary}} as an argument when calling :Termdebug

`:Termdebug {{Program_binary}}`


------------------------------------DEBUGGING COMMANDS


---------------------------------------BREAK POINTS------------------------------------------

Termdebug is clearly meant to have a mouse to click the [step, next, finish, cont, stop, eval] buttons along the top in gvim, but it can be used without a mouse in any vim, just more slowly.

- Set break points in the gdb window (use cmd mode):

`(gdb) b {{Program}}`
`(gdb) b {{line_#}}`



- Break points can be set by navigating to a line of code in the editor window and entering:

`:Break`

- Lines with breakpoints are indicated in the editor window with:
`>>`

- Break points can be removed by navigating to the relevant lines and entering:

`:Clear`


----------------------------------RUN THE DEBUGGING------------------------------------------

- Start the program in the editor window with:

`:Run [args]`

OR

- Start the program by navigating to the gdb window and entering:

`:run [args]`

- args should be replaced with by the program's arguments.

`ex :Run 6`

- An alternative way to launch a program is to use gdb's start command, which will pause execution at the beginning of the program.

`(gdb) :start`


------------------------------------STEP THROUGH THE CODE------------------------------------

- Step through code by clicking on the commands directly in the editor window.

`Step, Next, Cont, Stop, Eval`

- Step through code by issuing vim commands:

`:Step, :Over, :Finish, :Continue, :Stop`


------------------------------------------EXTRAS---------------------------------------------

- Inspect the value of variables:

`Invoke gdb inspection commands in the gdb window`
` hovering your mouse over variables in the editor window.`
`  (the above option) requires the +balloon_eval compile-time feature and only works reliably in gvim`
`Issuing vim command ":Evaluate [expr]" while also Ommiting {expr} will evaluate the expression under the cursor, which can also be performed by pressing K`


- Disable shared libraries to use with libtool-enabled programs

`Configure your package with the --disable-shared flag OR override the defaults for LT_INIT by using the disable-shared option. This prevents libtool form building shared libaries, which has several advantages:`
`Compilation is twice as fast`
`debugging is easier because you don't need to deal with any complexities added by shared libraries.`
`You can see how libtool behaves on static-onlyl platforms.`

