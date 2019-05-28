" General settings
syntax on
set number
set ruler
set so=999 " centers the cursor when possible
" set mouse=a
set breakindent

" Line Highlighting
" https://vim.fandom.com/wiki/Highlight_current_line
"set cursorline
"set cursorcolumn
"hi CursorLine   cterm=NONE ctermbg=darkgrey " Sets cursor line and column to dark grey and remove underlining
"hi CursorColumn cterm=NONE ctermbg=darkgrey
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR> " Don't know what this does honestly

" Theme
color molokai
" theme options, seem to have no effect
let g:molokai_original = 1
let g:rehash256 = 1
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

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256
