" test to check functioning of symlink

" load Pathogen plugin manager
call pathogen#infect()

" break compatibility with vi, allow vim commands
set nocompatible

" line numbers on
set number

" syntax highlighting and filetype specific indent on
filetype plugin on
filetype indent on
filetype plugin on 
syntax on

" searc highlighting and incremental search  on
set hlsearch
set incsearch 

" show what command you're typing
set showcmd

" tabs as spaces
set expandtab

" tab width
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

" scroll when near bottom of screen
set scrolloff=0

set colorcolumn=0

" text width for format command gq
set textwidth=79
set formatoptions+=t

" map jj to eccape in insert mode
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" autoupdate files that have been edited in other programs
set autoread

" show tabs and trailing whitespace
set listchars=tab:>-,trail:-,eol:$

" GUI - GVim - options
" --------------------
"make gui fullscreen
if has('gui_running')

    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    colorscheme desert

    " map F11 to fullscreen mode
    " map <F11>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

    " set font and size
    set guifont=Cousine:h8

    " colour all columns beyond 80
    let &colorcolumn=join(range(80,999),",")
    highlight ColorColumn ctermbg=1 guibg=#2c2c2c

    " highlight line the cursor is on
    set cursorline
    highlight cursorline ctermbg=05 guibg=#2c2c2c cterm=underline


endif

" auto reload ._vimrc on any changes to ._vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
