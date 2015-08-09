" last edited 13 May 2015 FCD

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

" highlight line the cursor is on
set cursorline
highlight cursorline ctermbg=001 guibg=#2cdd27

" searc highlighting and incremental search  on
set hlsearch
set incsearch 

" show what command you're typing
set showcmd
set autoindent

" tabs as spaces
set expandtab

" tab width
set tabstop=4
set shiftwidth=4
set softtabstop=4

" scroll when near bottom of screen
set scrolloff=0

" wrap before 80th column
let &colorcolumn=join(range(80,999),",")
highlight ColorColumn ctermbg=001 guibg=#2cdd27
set textwidth=79
set formatoptions+=t

" map jj to eccape in insert mode
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" autoupdate files that have been edited in other programs
set autoread

" show tabs and trailing whitespace
set listchars=tab:>-,trail:-,eol:$

" auto reload ._vimrc on any changes to ._vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost /Users/fda/vimsync/vimrc source $MYVIMRC
augroup END " }
