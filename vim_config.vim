" ------------------------- vim-plug Setup -------------------------

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tikhomirov/vim-glsl'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

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
set nobackup
set nowritebackup
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

" CoC setup

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab to trigger completion with characters agead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold.
autocmd CursorHold * silent call CocActionAsync('highlight')

" CtrlP setup

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Key mapping

map <C-n> :NERDTreeToggle<CR>

" Move the selected text up or down in visual mode.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Use Ctrl+j and Ctrl+k to move left and right when multiple windows are open.
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
" Bind jk in insert mode to Escape, leaving insert mode.
inoremap jk <Esc>
inoremap <Esc> <Nop>
