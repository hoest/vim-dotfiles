" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Thanks http://stevelosh.com/ and http://nvie.com/ and many more .vimrc's! ;)
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off

" pathogen
if has('win32') || has('win64')
  source $HOME/vimfiles/config/pathogen.vim
else
  source $HOME/.vim/config/pathogen.vim
endif

filetype plugin indent on

" disable mode lines (security measure)
set nomodeline

" tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
set nojoinspaces

" Autocompletion
set ofu=syntaxcomplete#Complete
set completeopt+=longest,menuone

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" UltiSnip
if has('win32') || has('win64')
  set rtp+=~/vimfiles/snippets/
else
  set rtp+=~/.vim/snippets/
endif
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

" wildmode
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.pdb,*.db,*.manifest,*.suo,*.csproj.user,*.cache
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=Thumbs.db
set wildignore+=migrations
set wildignore+=*.pyc

" auto read when file is changed from outside
set autoread

if version >= 703
  set undofile
  if has('win32') || has('win64')
    set undodir=$HOME/vimfiles/undo
  else
    set undodir=$HOME/.vim/undo
  endif

  set undolevels=1000
  set undoreload=10000
endif

set lazyredraw
set history=1000
set autochdir
set listchars=tab:»·,trail:·
set list
set fillchars+=stl:\ ,stlnc:\

if has('mouse')
  set mouse=nv " don't use mouse in insert mode
endif

" always yank to system clipboard
set clipboard=unnamed

" no backup or swap files
set nobackup
set nowritebackup
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
" close a tag in XML
inoremap <M-.> </<C-X><C-O>

set foldlevelstart=99
set foldmethod=indent

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" fold tag
nnoremap <leader>ft Vatzf
" fold from current
nnoremap <leader>fc v%zf

" re-hardwrap paragraph
nnoremap <leader>q gqip

" Ack searching
nnoremap <leader>a :Ack!<space>

" Run a Powershell command
nnoremap <leader>P :!powershell<space>-command<space>

" Consistent with D and C
nnoremap Y y$

" long lines
set wrap
set formatoptions=qrn1
set linebreak

if version >= 703
  set colorcolumn=80,120
endif

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

" Numbers
nnoremap <leader>n :NumbersToggle<CR>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Use Q for formatting the current paragraph (or selection)
nnoremap Q gqap
vnoremap Q gq

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Retab
nmap <leader>T :retab!<CR>

" Avoid accidental hits of <F1> while aiming for <Esc>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" use the hjkl keys the right way!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <PageUp> <nop>
inoremap <PageDown> <nop>

nnoremap j gj
nnoremap k gk

" Bubble single lines
nmap <C-Up> [e
nmap <C-k> [e
nmap <C-Down> ]e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-k> [egv
vmap <C-Down> ]egv
vmap <C-j> ]egv

" duplicate current line
nnoremap <leader>d :t.<CR>

" YankStack keys
call yankstack#setup()
nnoremap <leader>y :Yanks<CR>

if has("gui_macvim")
  set macmeta
endif

" Restore cursor position upon reopening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Big file => no syntax
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" Build files => XML
autocmd BufNewFile,BufRead *.build set ft=xml

" Powerline
let g:Powerline_symbols = 'compatible'

" Vundle fix for 'set shellslash'
au FileType vundle setlocal noshellslash

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

nnoremap <silent> <leader><Tab> :ScratchToggle<CR>

" cleanup whitespace
function! StripTrailingWhitespaces()
  " save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" strip trailing whitespace
nnoremap <leader>W :call StripTrailingWhitespaces()<CR>
" strip on save
autocmd BufWritePre * :call StripTrailingWhitespaces()

" flake8 settings
let g:flake8_ignore="E111,E501,W391,E121"

" Flake8 when write python file
autocmd BufWritePost *.py call Flake8()

" Indenting fix for HTML, XML and XSLT
autocmd FileType html setlocal indentkeys-=*<Return>
autocmd FileType xml setlocal indentkeys-=*<Return>
autocmd FileType xslt setlocal indentkeys-=*<Return>

