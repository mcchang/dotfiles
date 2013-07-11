scriptencoding utf-8

" Vundle
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
" Still need to learn how to use.
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/EasyGrep'

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

" Autocommands.
autocmd FileType python setlocal shiftwidth=2 softtabstop=4
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType crontab set nobackup nowritebackup
autocmd BufWrite * :%s/\s\+$//e
autocmd FocusLost * :wa " Save when losing focus.

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
set colorcolumn=80

" Line Wrapping
set nowrap
" set textwidth=79

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

" Sessions
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Misc
set autoread " Refresh files if they've changed outside of vim.
set autowrite " Writes on make/shell commands, next buffer, etc.
set backspace=indent,eol,start
set clipboard=unnamed "Regular vim yanking will copy to OS clipboard.
set history=50 " keep 50 lines of command history
set laststatus=2 " Always show status line.
set matchpairs+=<:>
set noerrorbells " No noise.
set novisualbell " No blinking.
set number
set shortmess=atI "Shortens messages.
set ttyfast
set vb t_vb= " Disable any beeps or flashes on error.
set viminfo='20,\"500   " Keep a .viminfo file.

" Invisible Chars.
set listchars=tab:▸\ ,eol:¬
set list
:noremap ,i :set list!<CR>

" Cursor Movement.
map k gk
map j gj

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
" CommandT
let g:CommandTMaxFiles = 15000
noremap <leader>f <Esc>:CommandTFlush<CR> " Flush CommandT Buffer

" Python autocomplete
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" YouCompleteMe
let g:ycm_complete_in_comments = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" TagBar
nmap <F8> :TagbarToggle<CR>
nmap <F7> :TagbarOpen j<CR>
nmap <F6> :TagbarTogglePause<CR>

" Syntastic
let g:syntastic_python_checkers=['python', 'pyflakes', 'pylint', 'pep8',
                                \'flake8', 'py3kwarn']
let g:syntastic_python_pylint_args="--errors-only -f parseable -r n -i y"
let g:syntastic_python_pep8_args="--ignore=E111,E12,E501,E302"
