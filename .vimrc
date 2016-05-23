" General settings
syntax on
set number
set ruler
set cursorline
set cursorcolumn
set so=999 " centers the cursor when possible
" set mouse=a

" Theme
color molokai
let g:molokai_original = 1
set t_Co=256
"let g:rehash256 = 1

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Search case
set ignorecase
set smartcase

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
