" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set nocompatible              " be iMproved, required
filetype off                  " required

" Load vim-plug if not already loaded
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Sensible options
Plug 'tpope/vim-sensible'

" File navigation
Plug 'tpope/vim-vinegar'

" Syntax checking/highlighting
Plug 'nvie/vim-flake8'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'

" Typescript compatibility
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" For code snippets
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils' " dependency for vim-snipmate
" Optional snippets
Plug 'honza/vim-snippets'

" Utilities
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ycm-core/YouCompleteMe'

" Aesthetics
Plug 'flazz/vim-colorschemes'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'prettier/vim-prettier'

" All of your Plugs must be added before the following line
call plug#end()

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

" Enables syntax highlighting and changes colorscheme
" colorscheme Atelier_EstuaryDark
" colorscheme Atelier_LakesideDark
" colorscheme Atelier_SulphurpoolDark
" colorscheme badwolf
" colorscheme boa
" colorscheme donttouchme
" colorscheme chance-of-storm
" colorscheme codedark
" colorscheme CandyPaper
" colorscheme neon
" colorscheme 0x7A69_dark
" colorscheme woju
colorscheme welpe
" colorscheme wargrey
" colorscheme trogdor

" Use Unix as the standard file type
set ffs=unix,dos,mac
set ff=unix

" Use spaces instead of tabs
set expandtab
set shiftround

set ai "Auto indent
set si "Smart indent

" Map Window Movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Better copy & paste
" When you want to paste large blocks of code into vim, press F3 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F3>
set clipboard=unnamedplus

" Map Ctrl-Tab for Tabs, also requires .Xresources and .screenrc
nmap <Tab> :tabn<CR>
nmap <S-Tab> :tabp<CR>
nmap <C-t> :Texplore<CR>

" better indentation
vnoremap < <gv
vnoremap > >gv

" Showing line numbers and length
" show line numbers
set number relativenumber
set tw=80   " width of document (used by gd)
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

" Sets where the window splits
set splitbelow
set splitright

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" Determines styling for below files
au BufNewFile,BufRead *.js,*.jsx,*.html,*.css,*.scss,*.ts,*.tsx,*.json,*.feature,*.features
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

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
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.js,*.jsx,*.ts,*.tsx match BadWhitespace /\s\+$/

"" Stolen with love from Ram
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

"" Clean up trailing witespace
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

"" Clean up trailing white space on save
" autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" YCM bindings
let g:SuperTabDefaultCompletionType    = '<tab>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" Resize windows
nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 3/4)<CR>
nnoremap <silent> <Leader>} :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>{ :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap <leader>. :Find<cr>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color optionscommand! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" colorscheme tings
 if v:version < 700 || exists('loaded_switchcolor') || &cp
 	finish
 endif

 let loaded_switchcolor = 1

 let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
 let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
 let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
 let s:swback = 0    " background variants light/dark was not yet switched
 let s:swindex = 0

 function! SwitchColor(swinc)

 	" if have switched background: dark/light
 	if (s:swback == 1)
 		let s:swback = 0
 		let s:swindex += a:swinc
 		let i = s:swindex % len(s:swcolors)

 		" in skip list
 		if (index(s:swskip, s:swcolors[i]) == -1)
 			execute "colorscheme " . s:swcolors[i]
 		else
 			return SwitchColor(a:swinc)
 		endif

 	else
 		let s:swback = 1
 		if (&background == "light")
 			execute "set background=dark"
 		else
 			execute "set background=light"
 		endif

 		" roll back if background is not supported
 		if (!exists('g:colors_name'))
 			return SwitchColor(a:swinc)
 		endif
 	endif

 	" show current name on screen. :h :echo-redraw
 	redraw
 	execute "colorscheme"
 endfunction

  map <F8>        :call SwitchColor(1)<CR>
 imap <F8>   <Esc>:call SwitchColor(1)<CR>

  map <S-F8>      :call SwitchColor(-1)<CR>

let g:closetag_filenames = "*.html,*.js,*.jsx"

let g:snipMate = { 'snippet_version' : 1 } " Use new snipmate parser, v0 is deprecated
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascriptreact'] = 'javascript,html'
let g:snipMate.scope_aliases['javascript'] = 'javascriptreact,html'

" Folding
set foldmethod=syntax
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <silent> <leader><Space> zR
vnoremap <Space> zf

let g:prettier#config#config_precedence = 'prefer-file'
