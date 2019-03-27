" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Sensible options
Plugin 'tpope/vim-sensible'

" File navigation
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Syntax checking
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'nvie/vim-flake8'

" For code snippets
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils' " dependency for vim-snipmate
" Optional snippets
Plugin 'honza/vim-snippets'

" Utilities
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-closetag'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'

" Aesthetics
Plugin 'flazz/vim-colorschemes'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Removes highlight of your last search
noremap <C-g> :nohl<CR>
vnoremap <C-g> :nohl<CR>

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Enables syntax highlighting and changes colorscheme
colorscheme solarized8_dark

" Use Unix as the standard file type
set ffs=unix,dos,mac
set ff=unix

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
" regular tab is 8 spaces
" indent by multitudes of 4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround

set ai "Auto indent
set si "Smart indent

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
set pastetoggle=<F3>
set clipboard=unnamed

" Map Ctrl-Tab for Tabs, also requires .Xresources and .screenrc
nmap <Tab> :tabn<CR>
nmap <S-Tab> :tabp<CR>
nmap <C-t> :tabnew<CR>

" better indentation
vnoremap < <gv
vnoremap > >gv

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80

" Useful settings
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

" Python hightlighting
let python_highlight_all=1

" Sets where the window splits
set splitbelow
set splitright

" Determines PEP8 styling for Python files
"au BufNewFile,BufRead *.py
    "\ set tabstop=4 |
    "\ set softtabstop=4 |
    "\ set shiftwidth=4 |
    ""\ set textwidth=79 |
    "\ set expandtab |
    "\ set autoindent |
    "\ set fileformat=unix

" Determines styling for below files
au BufNewFile,BufRead *.js,*.jsx,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Valloric/YouCompleteMe adjustments
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Opens NERDTree when vim starts up
autocmd vimenter * NERDTree

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Hides .pyc files from nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" opens NERDTree on the right side
let g:NERDTreeWinPos = "right"

" Powerline settings
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set t_Co=256

" Hide the mode below the powerline
set noshowmode

" Solve certain color problems for powerline
autocmd BufNewFile,BufRead *.rb nested colorscheme desert
let g:miniBufExplForceSyntaxEnable = 1

" Flags unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

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

" Clean up trailing witespace
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Clean up trailing white space on save
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" YCM bindings
let g:SuperTabDefaultCompletionType    = '<tab>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Resize windows
nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader>} :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>{ :exe "resize " . (winheight(0) * 2/3)<CR>
