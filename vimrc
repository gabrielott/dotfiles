"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

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
Plug 'christophermca/meta5'
Plug 'psliwka/vim-smoothie'
call plug#end()

colorscheme meta5
set encoding=utf-8
set fileencodings=ucs-bom,uft-8,default,sjis
set number
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
filetype plugin indent on
syntax on
" Fix colors
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

let mapleader = "\<Space>"
nnoremap <Leader>R :!ranger<CR><CR>
nnoremap <Leader>b :ls<CR>:buffer<Space>
nnoremap <Leader>B :ls<CR>:sbuffer<Space>
nnoremap <Leader>e :e **/*
nnoremap <Right> :bn<CR>
nnoremap <Left> :bN<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>. :e ~/.vimrc<CR>

autocmd BufWritePost .vimrc source %
autocmd FileType python nnoremap <buffer> <Leader>r :w<CR>:!clear;python %<CR>
autocmd FileType javascript nnoremap <buffer> <Leader>r :w<CR>:!clear;node %<CR>
autocmd FileType c nnoremap <buffer> <Leader>r :w<CR>:!clear;gcc -o %.out -Wall % && ./%.out<CR>
autocmd FileType java nnoremap <buffer> <Leader>r :w<CR>:!clear;javac % && java %<CR>
autocmd FileType sh nnoremap <buffer> <Leader>r :w<CR>:!clear;./%<CR>
