" ------------------------- Vundle Setup -------------------------
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'grailbio/bazel-compilation-database'
Plugin 'tikhomirov/vim-glsl'

call vundle#end()

" ------------------------- PML Setup -------------------------

filetype plugin indent on
syntax on

colorscheme gruvbox
set background=dark
set completeopt-=preview
set backspace=indent,eol,start
set cursorline
set hidden
set expandtab
set number
set ruler
set shiftwidth=2
set tabstop=2
set title
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Make vim-glsl support files with the .vs and .fs extensions.

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" Format on Save for c, c++ code.

function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/vim/addons/syntax/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

" Key mapping

map <C-n> :NERDTreeToggle<CR>
nmap <C-g> :YcmCompleter GoTo<CR>

" Use Ctrl+j and Ctrl+k to move left and right when multiple windows are open.
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
" Bind jk in insert mode to Escape, leaving insert mode.
inoremap jk <Esc>
inoremap <Esc> <Nop>
