" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-apathy'
Plug 'sheerun/vim-polyglot'
" Plug 'psliwka/vim-smoothie'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
" Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'kmonad/kmonad-vim'
Plug 'arzg/vim-colors-xcode'
Plug 'morhetz/gruvbox'
Plug 'vimwiki/vimwiki'
call plug#end()

" auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-b>'

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_fold_enabled = 1
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \   '-shell-escape',
      \ ],
      \}

" vimwiki
let wiki = {}
let wiki.path = '~/wiki/pages'
let wiki.path_html = '~/wiki/html'
let wiki.template_path = '~/wiki/templates'
let wiki.template_default = 'mydefault'
let wiki.auto_export = 1
let wiki.auto_toc = 1
let wiki.auto_tags = 1
let wiki.links_space_char = '_'
let g:vimwiki_list = [wiki]
let g:vimwiki_folding = 'expr'

let g:gruvbox_contrast_dark = 'hard'

set encoding=utf-8
set fileencodings=ucs-bom,uft-8,default,sjis
set number
set relativenumber
set autoindent
set ruler
set cursorline
set showcmd
set incsearch
set ignorecase
set smartcase
set hidden
set wildmenu
set scrolloff=3
set tabstop=4 softtabstop=4 shiftwidth=4
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set foldmethod=indent
set foldnestmax=2
set conceallevel=2
set background=dark

" Fix Ctrl-[ O delay
" :h vt100-cursor-keys
set notimeout
set ttimeout
set timeoutlen=100
filetype plugin indent on
syntax on
syntax sync minlines=100
" Fix colors
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
colorscheme xcodedarkhc

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
" Buffer management
nnoremap <Leader>b :ls<CR>:buffer<Space>
nnoremap <Leader>B :ls<CR>:sbuffer<Space>
nnoremap <Leader>e :e **/*
nnoremap <Right> :bn<CR>
nnoremap <Left> :bN<CR>
nnoremap <Leader>d :bd<CR>

" Add new line above or below
nnoremap <silent> <Plug>NewLineBelow mzo<Esc>`z:call repeat#set("\<Plug>NewLineBelow")<CR>
nmap <Leader>s <Plug>NewLineBelow
nnoremap <silent> <Plug>NewLineAbove mzO<Esc>`z:call repeat#set("\<Plug>NewLineAbove")<CR>
nmap <Leader>S <Plug>NewLineAbove

" System-wide clipboard
nnoremap <Leader>Y "+yy
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" Visual lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Miscellaneous
nnoremap <Leader>. :e ~/.vimrc<CR>     " Open this file
nnoremap <Leader>R :!lf<CR><CR>        " Run lf
nnoremap <Leader>= mzgg=G`z            " Auto indent entire file
cnoremap w!! w !sudo tee > /dev/null %

autocmd BufWritePost .vimrc source %

" Compile and/or run
autocmd FileType python nnoremap <buffer> <Leader>r :w<CR>:!clear;python %<CR>
autocmd FileType javascript nnoremap <buffer> <Leader>r :w<CR>:!clear;node %<CR>
autocmd FileType c nnoremap <buffer> <Leader>r :w<CR>:!clear;gcc -o %:r.out -Wall -Wextra -pedantic % && ./%:r.out<CR>
autocmd FileType java nnoremap <buffer> <Leader>r :w<CR>:!clear;javac % && java %:r<CR>
autocmd FileType sh nnoremap <buffer> <Leader>r :w<CR>:!clear;./%<CR>
autocmd FileType scheme nnoremap <buffer> <Leader>r :w<CR>:!clear;scheme < %<CR>
autocmd FileType ruby nnoremap <buffer> <Leader>r :w<CR>:!clear;ruby %<CR>

" Compile
autocmd FileType c nnoremap <buffer> <Leader>c :w<CR>:!gcc -o %:r.out -Wall -Wextra -pedantic %<CR><CR>
autocmd FileType java nnoremap <buffer> <Leader>c :w<CR>:!javac %<CR><CR>

" Compile to assembly and show result in new split
autocmd FileType c nnoremap <buffer> <Leader>C :w<CR>:!gcc -o %:r.s -Wall -Wextra -pedantic -O1 -m32 -S %<CR><CR>:split %:r.s<CR>:e<CR>
