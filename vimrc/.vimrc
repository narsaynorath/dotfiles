set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/syntastic'

Plugin 'nvie/vim-flake8'

Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'kien/ctrlp.vim'

Plugin 'tmhedberg/SimpylFold'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Enable syntax highlighting
syntax enable
" Color Scheme
"colorscheme desert
"set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
" regular tab is 8 spaces
" indent by multitudes of 4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

" Set Code Folding
set foldmethod=indent
set foldlevel=99

" Map Window Movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Turn on line numbers:
set number

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %

" Mouse and backspace
set bs=2     " make backspace behave like normal again

" Map Ctrl-Tab for Tabs, also requires .Xresources and .screenrc
nmap <C-Tab> :tabn<CR>
nmap <C-S-Tab> :tabp<CR>
nmap <C-t> :tabnew<CR>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" map sort function to a Ctrl-Down
vnoremap <C-Down> :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
" set wrap    "Wrap lines
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=blue

" Useful settings
set history=700
set undolevels=700

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Python-mode settings
let g:pymode_run_key = 'R'

" Load show documentation plugin
let g:pymode_doc = 1
" Key for show python documentation
 let g:pymode_doc_key = 'K'

let g:pymode_syntax = 1

" Determine filetype and indent rules
filetype on
filetype plugin indent on

" Show information in the bottom right about line and column number
set ruler


" Added by Nar
" " Allows for autoinsertion of ending brace/parenthesis/bracket
" inoremap {<cr {<cr>}<c-o><s-o>
" inoremap [<cr [<cr>]<c-o><s-o>
" inoremap (<cr (<cr>)<c-o><s-o>

" Sets where the window splits
set splitbelow
set splitright

" Enable code folding (collapsing functions, etc)
set foldmethod=indent
set foldlevel=99
" Remaps the spacekey to fold, rather than using za
nnoremap <space> za

" Determines PEP8 styling for Python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Determines styling for below files
au BufNewFile,BufRead *.js, *.jsx, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Flags unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" sets UTF-8 support
set encoding=utf-8

" Valloric/YouCompleteMe adjustments
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Python hightlighting
let python_highlight_all=1
syntax on

" Determine which theme to use
"set background=dark
" colorscheme solarized
" 
" call togglebg#map("<F5>")

" Enables syntax highlighting and changes colorscheme
syntax enable
colorscheme molokai

" Hides .pyc files from nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Powerline settings
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
set t_Co=256

" Hide the mode below the powerline
set noshowmode

" Opens NERDTree when vim starts up
autocmd vimenter * NERDTree

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Solve certain color problems for powerline
autocmd BufNewFile,BufRead *.rb nested colorscheme desert
let g:miniBufExplForceSyntaxEnable = 1

" Changes highlight color
hi Visual ctermbg=021

" opens NERDTree on the right side
let g:NERDTreeWinPos = "right"