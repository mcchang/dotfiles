scriptencoding utf-8

" Setup
set nocompatible	
" "setlocal spell spelllang=en_us

" Indenting
set ai
set si

" Scrollbars
set sidescrolloff=2
set numberwidth=4

" Wildmenu
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

" Windows
set splitbelow splitright
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

" Cursor
set cursorline

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Colors 
set background=dark
colorscheme default
syntax on

" Status
set showcmd
set ruler

" Line Wrapping
" set nowrap
" set linebreak

" Mappings
imap jj <Esc>
imap uu _
imap hh =>
imap aa @

" File
filetype plugin indent on

" Insert New Line
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Sessions
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Misc
" set autowriteall
set autowrite
set bs=indent,eol,start
set number
set numberwidth=3
set matchpairs+=<:>
set vb t_vb=
set history=50          " keep 50 lines of command history
set viminfo='20,\"500   " Keep a .viminfo file.

" Invisible Chars
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR>

" Cursor Movement
"map <up> gk
"map k gk
"imap <up> <C-o>gk
"map <down> gj
"map j gj
"imap <down> <C-o>gj
"map E ge

" Tabs
set smarttab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" Plugins
" NERDTree
" autocmd VimEnter * exe 'NERDTree' | wincmd l
:noremap ,n :NERDTreeToggle<CR>
let NERDTreeMouseMode=1

" fuzzyfinder
map ,b :FufBuffer<CR>
map ,f :FufFile<CR>
let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" Shortcuts for miniBufExpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Uses Exuberant Ctags instead of unix ctags for taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
if has("gui_win32")
  let Tlist_Ctags_Cmd='C:/ctags58/ctags.exe'  
end

" Shortcuts for tasklist and taglist
map T :TaskList<CR>
map P :TlistToggle<CR>

" Python autocomplete
set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set complete+=k~/vimfiles/syntax/python.vim isk+=.,(
