# vimrc-info

> A backup of your .vimrc, just in case.

----------------------------------COPY FROM BELOW THIS LINE----------------------------------



""                               ( LOCAL)   .VIMRC
""
""
""                                        Section.1
""------------------------------------------------------------------------------------------------
""                                  |PERMANENT CONFIGURATIONS|
""------------------------------------------------------------------------------------------------

"" Change the color scheme to desert, or slate, or torte, or default.
"" Test out new colors by typing :colorscheme TAB.
color murphy



"" Adds syntax highlighting for all the programming languages
syntax on

"" Attempt to determin the type of a file based on its name and possibly its
"" contents. Use this to allow intelligent auto-indenting for each filetype,
"" and for plugins that are filetype specific.
filetype indent plugin on



"" Place numbers left of each line starting from the top downward, zero to infinity
""set number

"" turn on hybrid line numbers on
:set number relativenumber
"":set nu rnu

""use autocommands to switch to absolute numbering in insert mode and hybrid
""in normal mode.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END



""switches the functions of ; and : 
:nnoremap ; : 
:nnoremap : ;



"" Sets default layout of Termdebug to wide with the editor window on the
"" on the right and the debugger windows on the left.
""g:termdebug_wide

""source termdebug plugin
packadd termdebug



"" Highlights the current line in every window and update the highlight as the cursor moves
set cursorline 

"" Change cursor line from an underline to highlighting the whole line.
hi CursorLine term=bold cterm=bold guibg=grey40



"" Use visual bell insead of of beeping when doing something wrong
set visualbell

"" Reset the terminal code for the visual bell. If visualbell is set, and
"" this line is also included, vim will neither flash nor beep. If visualbell
"" is unset, this does nothing.
set t_vb=



"" Stop certain movements from always going to the first character of a line.
"" While this behaviour deviates from that of Vi, it does what most users
"" coming from other editors would expect.
set nostartofline



"" highlights all instances of current search phrase for easy view while scrolling
set hlsearch

"" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase



	

"" Adds the following items to the status bar.	
"" The original lines of code for reference.
""set statusline +=%4*\ %<%F%*            "full path
""set statusline +=%1*%=%5l%*             "current line
""set statusline +=%2*/%L%*               "total lines
""set statusline +=%2*%m%*                "modified flag
""set statusline +=%3*%y%*                "file type
""set statusline +=%5*%{&ff}%*            "file format
""set statusline =%1*\ %n\ %*             "buffer number

set statusline +=%3*%y%*                "file type
set statusline +=%1*%5l%*             "current line
set statusline +=%2*/%L\ \ \ \ \ \ \ \ \ \ \ \ \ \ %*         "total lines
set statusline +=%4*%F%*            "full path
set statusline +=%5*%=%{&ff}%*            "file format
set statusline +=%1*\ %n\ %*             "buffer number
set statusline +=%2*%m%*                "modified flag

""                                        Section.2
""------------------------------------------------------------------------------------------------
""                                  |TRIAL CONFIGURATIONS|
""------------------------------------------------------------------------------------------------


"" Instead of failing a command because of unsaved changes, instead raise a
"" dialogue asking if you wish to save changed files.
set confirm

"" When opening a new line and no filetype-specific indenting is enabled, keep
"" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

"" Allow backspacing over autodindent, line breaks and start of insert action
set backspace=indent,eol,start

"" Show partial commands in the last line of the screen.
set showcmd


""                                        Section.3
"" Enable use of the mouse for all modes
set mouse=a 
""-----------------------------------------------------------------------------------------------
""                            |INACTIVE/RETIRED CONFIGURATIONS|
""----------------------------------------------------------------------------------------------

"" Set the command window height to 2 lines, to avoid many cases of having to
"" "press <Enter> to continue
""set cmdheight=2



"" Always display the status line, even if only one window is displayed
""set laststatus=2



"" Adds the following items to the status bar.	
"" You may want to try switch the order in which they appear in the bar.
""set statusline +=%2*0x%04B\ %*          "character under cursor
""set statusline +=%1*%4v\ %*             "virtual column number

"" It's supposed to add color to the set statusline code above this.
""hi User1 guifg=#eea040 guibg=#222222
""hi User2 guifg=#dd3333 guibg=#222222
""hi User3 guifg=#ff66ff guibg=#222222
""hi User4 guifg=#a0ee40 guibg=#222222
""hi User5 guifg=#eeee40 guibg=#222222



