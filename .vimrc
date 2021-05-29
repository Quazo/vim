set nocompatible   "required
filetype off       "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold' " Code Folding
Plugin 'vim-scripts/indentpython.vim' " Indentation
Plugin 'Valloric/YouCompleteMe' " Auto-Complete
Plugin 'vim-syntastic/syntastic' " Syntax Highlighting
Plugin 'nvie/vim-flake8' " PEP-8
Plugin 'jnurmine/Zenburn' " Terminal Mode
Plugin 'altercation/vim-colors-solarized' " GUI Mode
Plugin 'scrooloose/nerdtree' " File Tree
Plugin 'jistr/vim-nerdtree-tabs' " Tabs
Plugin 'kien/ctrlp.vim' " Super Search
Plugin 'tpope/vim-fugitive' " Git
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " Powerline


" All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on 		" required

" Specify where splits occur with :sp and :vs
set splitbelow
set splitright

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Code folding
set foldmethod=indent
set foldlevel=99

" Enable code folding with spacebar
nnoremap <space> za

" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8
set encoding=utf-8

" Auto-Complete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Python Syntax Highlighting
let python_highlight_all=1
syntax on

" Color Scheme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

" solarized dark / light switch
call togglebg#map("<F5>")

" NERDTree
" Map to <F2>
map <F2> :NERDTreeToggle<CR>  
let NERDTreeShowHidden=1  " Show Hidden Files, e.g. .vimrc

" Line Numbering
set nu

" Clipboard
set clipboard=unnamed

" Terminal
set shell=zsh

