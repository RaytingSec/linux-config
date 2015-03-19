" General settings
syntax on
color evening
set number
set ruler

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

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
