scriptencoding utf-8

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" Github repos.
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
" Still need to learn how to use.
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/EasyGrep'
" Non-Github repos.
Bundle 'git://git.wincent.com/command-t.git'

" Disabled.
" Bundle 'airblade/vim-gitgutter'
" Bundle 'kevinw/pyflakes-vim'
" Bundle 'ervandew/supertab'
" Bundle 'scrooloose/syntastic'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'Lokaltog/powerline'

filetype plugin indent on

" Encoding
set encoding=utf-8

" Setup
set nocompatible " Disable vi compatibility.
set history=256 " Number of things to remember in history.
set timeoutlen=250 " Time to wait after ESC
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" Formatting
set formatoptions=qn1 " TODO(mike): Figure out what I want to do here.
set formatoptions+=o "Automatically insert the comment leader after 'o' or 'O' in normal
set formatoptions-=r "Do not automatically insert a comment leader after an enter.
set formatoptions-=t " Do no auto-wrap text using textwidth (does not apply to comments)

" Indenting
set autoindent
set smartindent

" Scrollbars
set sidescrolloff=2
set scrolloff=3

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.class
set wildignore+=/Users/mike/src/tellapart/third_party/tungsten/*
set wildignore+=/Users/mike/src/tellapart/eye/*

" Windows
set splitbelow splitright
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

" Cursor
set cursorline

" Search
nnoremap / /\v
vnoremap / /\v
set hlsearch " Highlighting search.
set incsearch " Incremental search.
set ignorecase " Ignore case when searching.
set smartcase " Be case sensitive when there's a capital letter.
set gdefault
set showmatch " Show matching brackets.
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Colors
set background=dark
colorscheme solarized
syntax enable

" Leader
let mapleader = ","

" Status
set showcmd " Display an incomplete command in the lower right of the window.
set showmode
set ruler " Show ruler.

" Line Wrapping
set nowrap
" set textwidth=79

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" set linebreak
" Mappings
" imap jj <Esc>
" imap uu _
" imap hh =>
" imap aa @
" nnoremap ; :
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
set novisualbell " No blinking.
set noerrorbells " No noise.
set autowrite " Writes on make/shell commands, next buffer, etc.
set autoread " Refresh files if they've changed outside of vim.
set backspace=indent,eol,start
set number
" set numberwidth=3
set matchpairs+=<:>
set vb t_vb= " Disable any beeps or flashes on error.
set history=50          " keep 50 lines of command history
set viminfo='20,\"500   " Keep a .viminfo file.
set ttyfast
set laststatus=2 " Always show status line.
set shortmess=atI "Shortens messages.
set clipboard=unnamed "Regular vim yanking will copy to OS clipboard.

" Invisible Chars
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
set smarttab " Smarter tab levels.
set softtabstop=2
set shiftwidth=2 " Default shiftwidth for indents.
set tabstop=8 " Default tabstop.
set expandtab " Makes tabs into spaces (set by tabstop)
set shiftround

" Undo.
set undofile
set undodir=~/.vim/undo

" Plugin shortcuts/configuration.
:noremap ,n :NERDTreeToggle<CR>
let NERDTreeMouseMode=1
nnoremap ,r :TlistToggle<CR>


" CommandT
let g:CommandTMaxFiles = 15000
" Flush CommandT Buffer
noremap <leader>f <Esc>:CommandTFlush<CR>

" Shortcuts for miniBufExpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Python autocomplete
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

" YouCompleteMe
" Enable completions in comments.
let g:ycm_complete_in_comments = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" TagBar
nmap <F8> :TagbarToggle<CR>
nmap <F7> :TagbarOpen j<CR>
nmap <F6> :TagbarTogglePause<CR>

" Filetype specific options
autocmd FileType python setlocal shiftwidth=2 softtabstop=4
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufWrite * :%s/\s\+$//e
autocmd Filetype gitcommit setlocal spell textwidth=72

" Make it so I can actually edit my crontab.
au FileType crontab set nobackup nowritebackup

