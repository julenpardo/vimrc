"""""""""
" Plugins
"""""""""

" Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""
" Plugin specification
""""""""""""""""""""""

" General

" Asynchronous lint
Plugin 'w0rp/ale'
" File Browsing
Plugin 'scrooloose/nerdtree'
" Powerline status bar, and fonts
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Buffer navigation
Plugin 'ap/vim-buftabline'
" Color scheme
Plugin 'morhetz/gruvbox'
" Code commenting
Plugin 'scrooloose/nerdcommenter'
" Markdown syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Rename files
Plugin 'danro/rename.vim'
" Surrouning
Plugin 'tpope/vim-surround'


" Python

" Doctring generator
Plugin 'heavenshell/vim-pydocstring'
" Autocomplete
Plugin 'davidhalter/jedi-vim'
" PEP8 indentation
Plugin 'vim-scripts/indentpython.vim'
" PEP8 style checking
Plugin 'nvie/vim-flake8'


" HTML, CSS, JavaScript

" Autoclosing tags
Plugin 'alvan/vim-closetag'
" Highlight enclosing tags
Plugin 'Valloric/MatchTagAlways'
" JavaScript highlight (works for inline js!)
Plugin 'pangloss/vim-javascript'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""

" scrooloose/nerdtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Lokaltog/powerline
let g:Powerline_symbols = 'fancy'

" alvan/vim-closetag
let g:closetag_filenames = "*.html, *.twig, *.vue, *.xml"

" morhetz/gruvbox
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

set nocompatible
set encoding=utf-8
filetype off

"""""""""
" Spacing
"""""""""

set tabstop=4     " visual spaces for TAB character
set softtabstop=4 " number of spaces in tab for editing
set expandtab     " insert spaces instead of TAB character
set shiftwidth=4  " number of spaces to introduce on return for control structures, functions, etc

"""""""""""""""""
" Language syntax
"""""""""""""""""

syntax enable
autocmd BufRead *.wsgi set syntax=python filetype=python
autocmd BufRead *.twig set syntax=html filetype=html
autocmd BufRead *.vue set syntax=html filetype=html

""""
" UI
""""

highlight ExtraWhitespace ctermbg=red
set number
set cursorline
set showcmd
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-10.(%l,%c%V%)\ %<%P        " offset
hi StatusLine ctermbg=3 ctermfg=10
highlight CursorLine ctermbg=darkgrey
highlight LineNr ctermbg=darkgrey ctermfg=white


set splitbelow
set splitright

set guifont=Neep\ 18


" buffer navigation
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>


" split navigations

" Ctrl-j: move to the split below
nnoremap <C-J> <C-W><C-J>
" Ctrl-k: move to the split above
nnoremap <C-K> <C-W><C-K>
" Ctrl-l: move to the split to the right
nnoremap <C-L> <C-W><C-L>
" Ctrl-h: move to the split to the left
nnoremap <C-H> <C-W><C-H>

syntax on

""""""""
" Python
""""""""

""""""""""""""""""
" PEP8 indentation
""""""""""""""""""
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let python_highlight_all=1


""""""""""
" HTML, JS
""""""""""
au BufNewFile,BufRead *.html,*.twig,*.vue,*.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set autoindent |
    \ set fileformat=unix


"""""""""""""""""
" Functionalities
"""""""""""""""""
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"""""""""""
" Searching
"""""""""""

set incsearch " search as characters are entered.
set hlsearch  " highlight matches
set ignorecase

""""""""
" Styles
""""""""

" Show trailing whitespaces.
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

