call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tikhomirov/vim-glsl'
Plug 'junegunn/fzf', { 'do': { ->fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

filetype plugin indent on
syntax on

let g:gruvbox_contrast_dark = 'hard'
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

" CoC setup

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab to trigger completion with characters ahead and navigate.
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

" fzf setup

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :Files<CR>
