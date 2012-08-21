source $HOME/vim-dotfiles/config/vundle.vim

set modelines=0

" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nosmarttab

" menu and scrollbar shizzle
if has('gui_running')
  set guioptions-=T
  set guioptions-=m
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guitablabel=%N.\ %t\ %M
endif

" just make things better
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set copyindent
set showmode
set showcmd
set hidden
set visualbell
set noerrorbells
set title
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set shellslash

" wildmode
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.pdb,*.db,*.manifest,*.suo,*.csproj.user,*.cache
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=migrations
set wildignore+=*.pyc

" auto read when file is changed from outside
set autoread

set undofile
set undodir=$HOME/vim-dotfiles/undo

set undolevels=1000
set undoreload=10000
set lazyredraw
set history=1000
set autochdir
set listchars=tab:»·,trail:·
set list
set fillchars+=stl:\ ,stlnc:\
set mouse=a
set nofoldenable

" always yank to system clipboard
set clipboard=unnamed

" no backup or swap files
set nobackup
set noswapfile
set directory=$HOME/vim-dotfiles/tmp

" change the <leader> key
let mapleader = ","
let g:mapleader=","

" search stuff
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" clearing highlighted searches
nnoremap <leader><space> :nohlsearch<CR>

" fix vim's horribly broken default regex-handling
nnoremap / /\v
vnoremap / /\v

" long lines
set wrap
" set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85
set linebreak

" colorscheme
syntax on
if has('gui_running')
  set background=light
else
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  set t_Co=256
  set background=dark
endif

colorscheme solarized

" font and window size
if has('gui_running')
  if has("win32") || has("win64")
    set guifont=Consolas:h10
  elseif has("gui_macvim") || has("mac") || has("macunix")
    set guifont=Menlo:h12
  endif
  set columns=120
  set lines=50
endif

" strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Use Q for formatting the current paragraph (or selection)
nnoremap Q gqap
vnoremap Q gq

" Since I never use the ; key anyway, this is a real optimization for almost
" all Vim commands, as I don't have to press the Shift key to form chords to
" enter ex mode.
nnoremap ; :
nnoremap <leader>; ;

" Avoid accidental hits of <F1> while aiming for <Esc>
noremap! <F1> <Esc>

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" use the hjkl keys the right way!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" move lines up and down
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" duplicate current line
nnoremap <A-d> :t.<CR>
inoremap <A-d> <Esc>:t.<CR>

" Restore cursor position upon reopening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Big file => no syntax
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" Powerline
let g:Powerline_symbols = 'compatible'
