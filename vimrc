" load Pathogen plugin manager
call pathogen#infect()

" break compatibility with vi, allow vim commands
set nocompatible

" search upwards in file tree for tags file
set tags=.\tags;

" syntax highlighting and filetype specific indent on
filetype plugin on
filetype indent on
syntax on

" searc highlighting and incremental search  on
set hlsearch
set incsearch 

" show what command you're typing
set showcmd

" tabs as spaces
set expandtab

" start with relative line numbering on and absolute numbering for current line
" see toggle below
set relativenumber
set number

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

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" -----------------------------------------------------------------------------
"                                 GUI options
" -----------------------------------------------------------------------------
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

" -----------------------------------------------------------------------------
" comment/uncomment these lines to use dark desert theme
" -----------------------------------------------------------------------------
    " colorscheme desert
    " " colour all columns beyond 80
    " let &colorcolumn=join(range(80,999),",")
    " highlight ColorColumn ctermbg=1 guibg=#2c2c2c
    " " highlight line the cursor is on
    " set cursorline
    " highlight cursorline ctermbg=05 guibg=#2c2c2c cterm=underline

" -----------------------------------------------------------------------------
" comment/uncomment these lines to use light pyte theme
" -----------------------------------------------------------------------------
    " colorscheme pyte
    " " colour all columns beyond 80
    " highlight ColorColumn ctermbg=1 guibg=#E4E4E4

" -----------------------------------------------------------------------------
" comment/uncomment these lines to use light summerfruit theme
" -----------------------------------------------------------------------------
    colorscheme summerfruit256
    " colour all columns beyond 80
    let &colorcolumn=join(range(80,999),",")
    highlight ColorColumn ctermbg=1 guibg=#F9F9F9
    set cursorline
    set cursorcolumn
    highlight CursorLine ctermbg=00 guibg=#F0F0F0 cterm=underline
    highlight CursorColumn ctermbg=00 guibg=#FBFBFB cterm=underline

    " map F11 to fullscreen mode
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

    " set font and size
    if has("win32")
        set guifont=Cousine:h7
    else
        set guifont=Menlo:h9
    endif

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

" toggle between relative and normal line numbering
" nnoremap <leader>N :set number!<CR>:set relativenumber!<CR>
nnoremap <leader>N :set relativenumber!<CR>

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

" insert lines above/below without leaving normal mode
nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>j

" move between tabs
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>te :tabe<CR>

" jump to next function definition
nnoremap <leader>f /def\s<CR>:noh<CR>
nnoremap <leader>F ?def\s<CR>:noh<CR>
vnoremap <leader>f /def\s<CR>
vnoremap <leader>F ?def\s<CR>

" insert ipdb breakpoint
nnoremap <leader>ip oimport ipdb; ipdb.set_trace(); pass<Esc>

" run python on current file (would be nice if shell was other than cmd)
nnoremap <F9> :exec ':!python' shellescape(@%, 1)<CR>
