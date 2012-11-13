filetype off

" pathogen
if has('win32') || has('win64')
  source $HOME/vimfiles/config/pathogen.vim
else
  source $HOME/.vim/config/pathogen.vim
endif

filetype plugin indent on

" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

" disable mode lines (security measure)
set nomodeline

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
" set relativenumber
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
if has('win32') || has('win64')
  set undodir=$HOME/vimfiles/undo
else
  set undodir=$HOME/.vim/undo
endif

set undolevels=1000
set undoreload=10000
set lazyredraw
set history=1000
set autochdir
set listchars=tab:»·,trail:·
set list
set fillchars+=stl:\ ,stlnc:\
set mouse=a
" set foldmethod=indent
set nofoldenable

" always yank to system clipboard
set clipboard=unnamed

" no backup or swap files
set nobackup
set noswapfile
if has('win32') || has('win64')
  set directory=$HOME/vimfiles/tmp
else
  set directory=$HOME/.vim/tmp
endif

" change the <leader> key
let mapleader=","
let g:mapleader=","

" search stuff
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" spell checking
let g:spellfile_URL='http://ftp.vim.org/pub/vim/runtime/spell/'
set spelllang=nl,en
nmap <silent> <leader>s :set spell!<CR>

" clearing highlighted searches
nnoremap <leader><space> :nohlsearch<CR>

" fix dirty xml/xhtml
nnoremap <leader>fx :1,%s/>\s*</>\r</gg<CR>gg=G<CR>
" fold tag
nnoremap <leader>ft Vatzf
" fold from current
nnoremap <leader>fc v%zf
" re-hardwrap paragraph
nnoremap <leader>q gqip

" fix vim's horribly broken default regex-handling
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

" long lines
set wrap
set formatoptions=qrn1
set linebreak
set colorcolumn=80,120
" set textwidth=79

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

" Gundo
nnoremap <F5> :GundoToggle<CR>

" strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Use Q for formatting the current paragraph (or selection)
nnoremap Q gqap
vnoremap Q gq

" reselect text that was just pasted
nnoremap <leader>v V`]

" Since I never use the ; key anyway, this is a real optimization for almost
" all Vim commands, as I don't have to press the Shift key to form chords to
" enter ex mode.
nnoremap ; :
nnoremap <leader>; ;

" quick escape
inoremap jj <ESC>

" Avoid accidental hits of <F1> while aiming for <Esc>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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
inoremap <A-d> <Esc>:t.<CR>i

" YankStack keys
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Restore cursor position upon reopening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Big file => no syntax
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" Powerline
let g:Powerline_symbols = 'compatible'

" Vundle fix for 'set shellslash'
au FileType vundle setlocal noshellslash

" flake8 settings
let g:flake8_ignore="E111,E501"

" powershell stuff for vim
if has("win32") || has("win64")
  set shell=powershell
  set shellcmdflag=-command
endif

" scratchit
command! ScratchToggle call ScratchToggle()

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>L"
        let w:is_scratch_window = 1
    endif
endfunction

nnoremap <silent> <leader><tab> :ScratchToggle<cr>

