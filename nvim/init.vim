" General settings
syntax on
set number
set ruler
set so=999 " centers the cursor when possible
set mouse=a
set breakindent

" Line Highlighting
" https://vim.fandom.com/wiki/Highlight_current_line
set cursorline
"set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=darkgrey " Sets cursor line and column to dark grey and remove underlining
"hi CursorColumn cterm=NONE ctermbg=darkgrey
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR> " Don't know what this does honestly

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
" Disabled by default, doesn't play nice in virtualenvs
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup
" set laststatus=2 " Always display the statusline in all windows
" set showtabline=2 " Always display the tabline, even if there is only one tab
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" set t_Co=256

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk, buffer reloaded." | echohl None

" Plug Manager
" Install if not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'patstockwell/vim-monokai-tasty'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'styled-components/vim-styled-components'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

" Plugin configs

" gitgutter
autocmd BufWritePost * GitGutter

" vim-monokai-tasty
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

" vim-airline
let g:airline_theme='monokai_tasty'
