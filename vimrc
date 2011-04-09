scriptencoding utf-8

" File
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" Encoding
set encoding=utf-8


" Setup
set nocompatible
set modelines=0

" Indenting
set ai
set si

" Scrollbars
set sidescrolloff=2
set scrolloff=3
set numberwidth=4

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

" Windows
set splitbelow splitright
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

" Cursor
set cursorline

" Search
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Colors
set background=dark
colorscheme default
syntax on

" Leader
let mapleader = "," 

" Status
set showcmd
set showmode
set ruler

" Line Wrapping
set wrap
" set textwidth=79
set formatoptions=qrn1
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" set colorcolumn=85"
" set linebreak

" Mappings
imap jj <Esc>
imap uu _
imap hh =>
imap aa @
nnoremap ; :
" nnoremap <leader>a :Ack
" #Reminder#
" <leader>c<space> = comment!"

" Leader Mappings
nnoremap <leader>w <C-w>v<C-w>l

" Insert New Line
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Save when losing focus "
au FocusLost * :wa

" Sessions
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Misc
" set autowriteall
set visualbell
set autowrite
set bs=indent,eol,start
set number
set numberwidth=3
set matchpairs+=<:>
set vb t_vb=
set history=50          " keep 50 lines of command history
set viminfo='20,\"500   " Keep a .viminfo file.
set ttyfast
set laststatus=2

" Invisible Chars
" set listchars=trail:.,tab:>-,eol:$
set listchars=tab:▸\ ,eol:¬
set list
:noremap ,i :set list!<CR>

" Cursor Movement
"map <up> gk
map k gk
"imap <up> <C-o>gk
"map <down> gj
map j gj
"imap <down> <C-o>gj
"map E ge
 
" Tabs
set smarttab
set softtabstop=4
set shiftwidth=4
set tabstop=8
set expandtab


" Persistent Undo
" only if in mvim for now
if has("gui_macvim")
    set undofile
    set undodir=~/.undo 
end

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

" Python autocomplete
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

autocmd FileType python set omnifunc=pythoncomplete#Complete
