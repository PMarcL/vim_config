" ------------------------- Vundle Setup -------------------------
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'

call vundle#end()

" ------------------------- PML Setup -------------------------

filetype plugin indent on
syntax on

set backspace=indent,eol,start
set cursorline
set hidden
set expandtab
set number
set ruler
set shiftwidth=2
set tabstop=2
set title

" Key mapping

map <C-n> :NERDTreeToggle<CR>

" Use Ctrl+j and Ctrl+k to move left and right when multiple windows are open.
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
" Bind jk in insert mode to Escape, leaving insert mode.
inoremap jk <Esc>
inoremap <Esc> <Nop>
