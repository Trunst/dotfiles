execute pathogen#infect()
" add plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" set relativenumber
set nu
set background=light
set wrap
set mouse=a

" makes it possible to search for files
set path=$PWD/**

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" enable line numbers
" let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
" autocmd FileType nerdtree setlocal relativenumber
colorscheme gruvbox
set background=dark

map j gj
map k gk
map $ g$
map 0 g0
map ^ g^
" map == i<ESC>gg=G''
noremap Y "+y
" nmap <C-L> <C-W>L
" nmap <C-H> <C-W>H

noremap K kJ
noremap ) f)

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/target/*,*/.git/*,*/dist/*,*/vendor/*,*/wp/*

setlocal spell spelllang=en_us
"set list

set hlsearch

map <C-j> gT
map <C-k> gt
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
