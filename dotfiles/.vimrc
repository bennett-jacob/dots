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
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" single quotes required around all plugin references
Plug 'tpope/vim-sensible'       " sensible defaults
Plug 'tpope/vim-commentary'     " comment stuff out
Plug 'tpope/vim-fugitive'       " Git goodies
Plug 'vim-airline/vim-airline'  " statusline/tabline
Plug 'preservim/nerdtree'       " directory tree
Plug 'morhetz/gruvbox'          " theme
Plug 'dense-analysis/ale'       " linting
Plug 'airblade/vim-gitgutter'   " in-file git diff
Plug 'Chiel92/vim-autoformat'   " code formatting

Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense


" Language plugins
Plug 'hashivim/vim-terraform'       " Terraform
Plug 'pangloss/vim-javascript'      " JavaScript
Plug 'leafgarland/typescript-vim'   " TypeScript
Plug 'gisphm/vim-gitignore'         " .gitignore
Plug 'godlygeek/tabular'            " Markdown
Plug 'plasticboy/vim-markdown'      " Markdown

call plug#end()


" ------------------------------------------------------------------------------
" Basics
" ------------------------------------------------------------------------------
set nocompatible    " don't worry about compatibility with Vi

set number          " show line numbers
set relativenumber  " show line numbers relative to the current line
set wrap            " wrap lines
set encoding=utf-8  " set encoding to UTF-8 (default is "latin1")
set mouse=a         " enable mouse support (limited support for Mac OS X)
set lazyredraw      " redraw screen only when needed
set showmatch       " highlight matching parens/brackets
set laststatus=2    " always show statusline (even with single window)
set showtabline=2   " always show the statusline (even with single tab)
set visualbell      " blink cursor on error instead of beeping

" Whitespace
set list            " show whitespace
set showbreak=↪\
set listchars=tab:»·,trail:-,extends:>,precedes:<,nbsp:+,eol:↲,space:·


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
set sidescrolloff=5 " show 5 lines to the side as you're scrolling

" Ruler
let &colorcolumn='81,121'
highlight ColorColumn ctermbg=0

" Tab settings
set tabstop=4       " width that a <TAB> character displays as
set expandtab       " convert <TAB> keypresses to spaces
set shiftwidth=4    " number of spaces to use for each step of (auto)indent
set softtabstop=4   " backspace after pressing <TAB> will remove up to this many spaces

" Filetype-specific tab settings
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal ts=2 sts=2 sw=2


" ------------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------------
set incsearch   " search as characters are entered
set hlsearch    " highlight matches


" ------------------------------------------------------------------------------
" Shortcuts
" ------------------------------------------------------------------------------
" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Reserve the ability to close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Jump to where you left off when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif


" ------------------------------------------------------------------------------
" Language settings
" ------------------------------------------------------------------------------
autocmd FileType yaml let b:autoformat_autoindent=0


" ------------------------------------------------------------------------------
" Plugin settings
" ------------------------------------------------------------------------------
" preservim/nerdtree
let NERDTreeShowHidden=1

" Chiel92/vim-autoformat
au BufWrite * :Autoformat

" dense-analysis/ale
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['eslint'],
            \   'python': ['black'],
            \}
let g:ale_fix_on_save = 1

" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" neoclide/coc.nvim
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" plasticboy/vim-markdown
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 3
