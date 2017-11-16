" General settings
syntax on
set number
set ruler
set cursorline
set cursorcolumn
set so=999 " centers the cursor when possible
" set mouse=a
set breakindent

" Theme
color molokai
" theme options, seem to have no effect
" let g:molokai_original = 1
" let g:rehash256 = 1
set t_Co=256  " Retain colors in tmux

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Search
set ignorecase
set smartcase
set hlsearch

" Arrowkeys
" Sets movement to match visual and not physical line location
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
