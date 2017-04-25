execute pathogen#infect()

set relativenumber
set nu
set background=light
set nowrap
set mouse=a

" makes it possible to search for files
set path=$PWD/**

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
colorscheme gruvbox
set background=dark

