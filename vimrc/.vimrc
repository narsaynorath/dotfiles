set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'Raimondi/delimitMate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'alvan/vim-closetag'
Plugin 'flazz/vim-colorschemes'
Plugin 'garbas/vim-snipmate'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'nvie/vim-flake8'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'
Plugin 'zivyangll/git-blame.vim'
" Optional
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

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

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac
set ff=unix

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

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Execute file being edited with <Shift> + e:
"map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Mouse and backspace
set bs=2     " make backspace behave like normal again

" Map Ctrl-Tab for Tabs, also requires .Xresources and .screenrc
nmap <Tab> :tabn<CR>
nmap <S-Tab> :tabp<CR>
nmap <C-t> :tabnew<CR>

" Bind nohl
" Removes highlight of your last search
noremap <C-g> :nohl<CR>
vnoremap <C-g> :nohl<CR>

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

" Useful settings
set history=700
set undolevels=700

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

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
    "\ set tabstop=4 |
    "\ set softtabstop=4 |
    "\ set shiftwidth=4 |
    "\ set textwidth=79 |
    "\ set expandtab |
    "\ set autoindent |
    \ set fileformat=unix

" Determines styling for below files
au BufNewFile,BufRead *.js,*.jsx,*.html,*.css
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

" Python hightlighting
let python_highlight_all=1

" Enables syntax highlighting and changes colorscheme
syntax enable
colorscheme solarized8_dark

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

" opens NERDTree on the right side
let g:NERDTreeWinPos = "right"

" Stolen with love from Ram
function! Preserve(command)
    "Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" clean up trailing witespace
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" clean up trailing white space on save
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" insert current date and time with F5
inoremap <F5> <C-R>=strftime("%c")<CR>

let g:SuperTabDefaultCompletionType    = '<tab>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

"map <C-K> :py3f /usr/local/Cellar/clang-format/2018-08-24/share/clang/clang-format.py<cr>
"imap <C-K> <c-o>:py3f /usr/local/Cellar/clang-format/2018-08-24/share/clang/clang-format.py<cr>
