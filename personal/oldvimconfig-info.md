
foldmethod=marker
foldlevel=0
set modelines=1
Section Name {{{
    set number    "show line numbers
    set cursorline		"creates line under current line
 }}}
filetype indent on  "activates filetype detection and...
filetype plugin indent on	"activates filetype detection
syntax enable	"self describing - needs the .c or .py file name
set hidden	"allows you to deal with multiple unsaved buffers simultaneously without resorting to misusing tabs
set backspace=indent,eol,start "kds
"coloscheme default "look at usr/share/vim/vim81/color for options
set tabstop=4 "Vim reads as/replaces <TAB> characters w/ 4 spaces 
set softtabstop=4	"so tabs and backspace are only 4 spaces
set expandtab "<TAB> just becomes a shortcut for 'insert 4 spaces'
set showcmd "shows last command used in bottom bar
set wildmenu "visual autocomplete for command menu i.e. you can cycle through matches on a graphical menu for things like filenames for instance, run :e ~/vim<TAB>
set lazyredraw "tells vim to not redraw the screen unnecessarily
set showmatch "highlight matching [{()}]
set incsearch "search as characters are entered
set hlsearch "highlight matches
nnoremap <leader><space> :nohlsearch<CR>
"turns off serach highlighting when you've left the search
set foldenable "enables folding (it shows all folds)
set foldlevelstart=10 "open most folds by default
" at 0 all folds would be closed and at 99 all folds stay open
" foldlevelstart is the starting fold level for a new buffer
set foldnestmax=10 "guards against too many folds
nnoremap <space> za 
"space open/closes folds
set foldmethod=indent	"vim folds based on indentation
"other acceptable values are: marker, manual, expr, syntax, diff. Run :help foldmethod to find out what each of those do.
nnoremap j gj
nnoremap k gk
"if a line get wrapped to two lines it won't skip the second half of the line, like how this line gets wrapped and is on 2 lines.
nnoremap B ^
"moves to beinning of line
nnoremap E $
"moves to end of line
nnoremap $ <nop>
"$ doesn't do anything
nnoremap ^ <nop>
"^ doesn't do anything
nnoremap gV '[V']
"It visually selects the block of characters you added last time you were in INSERT mode.
let mapleader=","  "\ is a little far away for a leader
inoremap jk <esc>
"jk is now escape. a workaroudn if you ever need to enter this rare sequence of keys is to enter j, wait for the leader-check timeout to fade, and then enter k.
nnoremap <leader>u :GundoToggle<CR>
"uses gundo.vim and displays the undo tree in graphical form.
"nnoremap <leader>ev :vsp $MYVIMRC<CR>
"nnoremap <leader>ev :vsp ~/.zshrc<CR>
"nnoremap <leader>sv :source $MYVIMRC<CR>
"look into these later on the vimrc config page i bookmarked.
nnoremap <leader>s :mksession<CR>
"typing ,s saves a given assortment of windows so they're there next time you open up VIM (if you use the command :mksession). and you can reopen it with the command :vim -S 
nnoremap <leader>a :Ag
"open ag.vim - The Silver Searcher - command line tool to search source code.
"CtrlP is a fuzzy finder searcher
"
let g:ctrlp_match_window = 'bottom,order:ttb'
"order matching files top to bottom with ttb
let g:ctrlp_switch_buffer = 0
"always open files in new buffers
let g:ctrlp_working_path_mode = 0
"lets us change the working directory during a Vim session and make CtrlP
"respect that change
let g:ctrlp_user_command = 'ag %s -1 --nocolor --hidden -g ""'
"uses ag with ctrlp to make ctrlp super fast.
"g:ctrlp_show_hidden and g:ctrlp_custom_ignore do not work with custom user
"commands, I only care about the lack of support for custom ignores.However ag has it's own convention for ignore file: a '.agignore' file that follows the same conventions as '.gitignore'. This is actually great! When searching we only need to define our directories to ignore in one place.
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
"The pathogen options extract all of the Vim plugins from their locations in
"~/.vim/bundles to their respective places in the ~/.vim folder.
if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>\}50;CursorShape=1\x7\<Esc>
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>\}50;CursorShape=0\x7\<Esc>
else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_SI = "\<Esc>]50;CursorShape=0\x7"
    endif
"These lines change the cursor from block curor mode to vertical bar cursor
"mode when using tmux. Without these lines, tmux always uses block cursor
"mode.
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,var/tmp,/tmp
writebackup
"If you leave a Vim process open in which you've changed file, Vim creates a
"'backup' file. Then when you open the file from a different Vim Session, Vim
"knows to complain at you for trying to edit a file that is already being
"edited. The 'backup' file is created by appending a ~to the end of the file
"in the current directory. This can get quite annoying when browsing around a
"directory, so I applied the following setting to move backups to the /tmp
"folder. 'backup' and 'writebackup' enable backup support. As annlying as this
"can be, it is much better than losing tons of work in an edited
"but-not-written file.

"CUSTOM FUNCTIONS"
function! ToggleNumber()
        if(&relativenumber == 1)
                set norelativenumber
                set number
            else
                set relativenumber
            endif
    endfunc
"allows toggle between number and relativenumber

function! <SID>StripTrailingWhitespaces()
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        let @/=_S
        call cursor(l, c)
    endfunction
"strips trailing whitespace at the end of files. this is called on buffer
"write in the autogroup above. And it saves the last search & cursor position.

vim:foldmethod=marker:foldlevel=0
" Section Name {{{
" set number "This will be folded
"  }}}
"  
