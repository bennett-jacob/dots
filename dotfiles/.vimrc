" .vimrc
" github.com/bennett-jacob/dots/blob/main/.vimrc

" ------------------------------------------------------------------------------
"  Plugins
"  https://github.com/junegunn/vim-plug
"
"  To manually install plugins:
"
"    :PlugInstall
" ------------------------------------------------------------------------------
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif

call plug#begin('~/.vim/plugged')

" note: single quotes are required around all plugin references
Plug 'airblade/vim-gitgutter'                   " in-file git diff
Plug 'dense-analysis/ale'                       " linting
Plug 'morhetz/gruvbox'                          " theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense
Plug 'preservim/nerdtree'                       " directory tree
Plug 'tpope/vim-sensible'                       " sensible defaults
Plug 'tpope/vim-commentary'                     " comment stuff out
Plug 'tpope/vim-fugitive'                       " Git goodies
Plug 'vim-airline/vim-airline'                  " statusline/tabline
Plug 'vim-autoformat/vim-autoformat'            " code formatting

" Language plugins
Plug 'hashivim/vim-terraform'       " Terraform
Plug 'pangloss/vim-javascript'      " JavaScript
Plug 'leafgarland/typescript-vim'   " TypeScript
Plug 'gisphm/vim-gitignore'         " .gitignore
Plug 'godlygeek/tabular'            " Markdown
Plug 'plasticboy/vim-markdown'      " Markdown

call plug#end()

" ------------------------------------------------------------------------------
" Plugin settings
" ------------------------------------------------------------------------------
" dense-analysis/ale
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['eslint'],
            \ 'python': ['yapf'],
            \}
let g:ale_fix_on_save = 1

" neoclide/coc.nvim
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" plasticboy/vim-markdown
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 3

" preservim/nerdtree
let NERDTreeShowHidden=1        " show hidden files
map <C-n> :NERDTreeToggle<CR>   " open and close nerdtree with Ctrl + n

" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" vim-autoformat/vim-autoformat
au BufWrite * :Autoformat


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
set showbreak=↪\    " show a `↪` character on wrapped lines
set listchars=tab:→\ ,extends:>,precedes:<,nbsp:+,multispace:·  " set printed whitespace characters


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

" Ruler (2 black columns at col 81, 121)
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
autocmd FileType json       setlocal ts=2 sts=2 sw=2
autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown   setlocal ts=2 sts=2 sw=2


" ------------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------------
set incsearch   " search as characters are entered
set hlsearch    " highlight matches


" ------------------------------------------------------------------------------
" Language settings
" ------------------------------------------------------------------------------
autocmd FileType yaml let b:autoformat_autoindent=0


" ------------------------------------------------------------------------------
" Random stuff
" ------------------------------------------------------------------------------
" Reserve the ability to close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Jump to where you left off when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif
