" load Pathogen plugin manager
call pathogen#infect()

" break compatibility with vi, allow vim commands
set nocompatible

" syntax highlighting and filetype specific indent on
filetype plugin on
filetype indent on
syntax on

" line numbers on
set number

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

" text width for format command gq
set textwidth=79
set formatoptions+=t

" autoupdate files that have been edited in other programs
set autoread

" show tabs and trailing whitespace
set listchars=tab:>-,trail:-,eol:$

" -----------------------------------------------------------------------------
"                                 GUI options
" -----------------------------------------------------------------------------
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    colorscheme desert

    " map F11 to fullscreen mode
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

" -----------------------------------------------------------------------------
"                                   key remaps
" -----------------------------------------------------------------------------
let mapleader = '\'

" jj to eccape in insert mode
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" jump to term after = sign
nnoremap <leader>= f=w

" join lines quicker
noremap <leader>j J

" change window key
nnoremap <leader>w <C-w>

" moving diagonally between windows
nnoremap <leader>wy <C-w>h<C-w>k 
nnoremap <leader>wb <C-w>h<C-w>j
nnoremap <leader>wu <C-w>l<C-w>k
nnoremap <leader>wn <C-w>l<C-w>j
