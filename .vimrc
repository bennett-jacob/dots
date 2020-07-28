" .vimrc
" github.com/bennett-jacob/dots/blob/master/.vimrc
"
" This Vim configuration requires vim-plug.
" https://github.com/junegunn/vim-plug

" ------------------------------------------------------------------------------
"  Plugins
"  https://github.com/junegunn/vim-plug
"
"  To install plugins:
"
"    :PlugInstall
" ------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" single quotes required around all plugin references
Plug 'preservim/nerdtree'       " directory tree
Plug 'davidhalter/jedi-vim'     " autocompletion
Plug 'morhetz/gruvbox'          " theme
Plug 'dense-analysis/ale'       " linting
Plug 'airblade/vim-gitgutter'   " in-file git diff
Plug 'wakatime/vim-wakatime'    " https://wakatime.com
Plug 'hashivim/vim-terraform'   " terraform helpers
Plug 'Chiel92/vim-autoformat'   " code formatting

" Language plugins
Plug 'pangloss/vim-javascript'      " JavaScript support
Plug 'leafgarland/typescript-vim'   " TypeScript syntax

call plug#end()


" ------------------------------------------------------------------------------
" Basics
" ------------------------------------------------------------------------------
set nocompatible    " don't worry about compatibility with Vi

set list            " show whitespace
set number          " show line numbers
set relativenumber  " show line numbers relative to the current line
set wrap            " wrap lines
set encoding=utf-8  " set encoding to UTF-8 (default is "latin1")
set mouse=a         " enable mouse support (limited support for Mac OS X)
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw screen only when needed
set showmatch       " highlight matching parens/brackets
set laststatus=2    " always show statusline (even with single window)
set ruler           " show line and column number of the cursor on the right side of the status line
set visualbell      " blink cursor on error instead of beeping


" ------------------------------------------------------------------------------
" Key Bindings
" ------------------------------------------------------------------------------

" move vertically by visual lines (don't skip wrapped lines)
nmap j gj
nmap k gk

" navigate tabs with ease
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>


" ------------------------------------------------------------------------------
" Appearance
" ------------------------------------------------------------------------------
color gruvbox       " good ones: murphy, slate, molokai, badwolf
set bg=dark         " use gruvbox in dark mode
set scrolloff=7     " show 7 lines above/below cursor as you're scrolling

" Syntax
syntax enable               " general syntax highlighting
filetype plugin indent on   " file-aware indentation support

" Ruler
let &colorcolumn='81,121'
highlight ColorColumn ctermbg=0 guibg=0

" Tab settings
set tabstop=4       " width that a <TAB> character displays as
set expandtab       " convert <TAB> keypresses to spaces
set shiftwidth=4    " number of spaces to use for each step of (auto)indent
set softtabstop=4   " backspace after pressing <TAB> will remove up to this many spaces
set autoindent      " copy indent from current line when starting a new line
set smartindent     " even better autoindent (e.g. add indent after parens/brackets)

" Filetype-specific tab settings
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2

" Vim tabs
set showtabline=2   " always show tabs


" ------------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------------
set incsearch   " search as characters are entered
set hlsearch    " highlight matches


" ------------------------------------------------------------------------------
" Shortcuts
" ------------------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>   " NERDTree

" Reserve the ability to close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Jump to where you left off when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif


" ------------------------------------------------------------------------------
" Plugin settings
" ------------------------------------------------------------------------------
" davidhalter/jedi-vim
autocmd FileType python call jedi#configure_call_signatures()

" Chiel92/vim-autoformat
au BufWrite * :Autoformat

" dense-analysis/ale
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['eslint'],
            \   'python': ['black'],
            \}
let g:ale_fix_on_save = 1
