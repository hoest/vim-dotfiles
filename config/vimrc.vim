" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Thanks http://stevelosh.com/ and http://nvie.com/ and many more .vimrc's! ;)
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off

" pathogen
execute pathogen#infect()

scriptencoding utf-8

" run vim-sensible
if has("win32") || has("win64")
  runtime! $HOME/vimfiles/bundle/vim-sensible/plugin/sensible.vim
else
  runtime! $HOME/.vim/bundle/vim-sensible/plugin/sensible.vim
endif

" disable mode lines (security measure)
set nomodeline

" tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" menu and scrollbar shizzle
if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guitablabel=%N.\ %t\ %M
endif

set encoding=utf-8

" just make things better
set smartindent
set copyindent
set showmode
set hidden
set visualbell
set noerrorbells
set title
set cursorline
set ttyfast
set number
set shellslash
set nojoinspaces

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" UltiSnip
if has("win32") || has("win64")
  set rtp+=~/vimfiles/snippets/
else
  set rtp+=~/.vim/snippets/
endif
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

" Add ctrlp ignore filter
let g:ctrlp_custom_ignore={
      \'dir': '\v[\/](build|com|deploy|dist|tmp|tools)$',
      \'file': '\v\.(exe|obj|dll|pdb|suo|cache|pyc|swp|so|db|map)$'
      \}

" Keep cache
let g:ctrlp_clear_cache_on_exit = 0

" Add .ctrlp file as root marker
let g:ctrlp_root_markers=[".ctrlp"]

" setup tags file
set tags+=tags;$HOME,.tags;$HOME,tags;/.tags;/

if version >= 703
  set undofile
  if has("win32") || has("win64")
    set undodir=$HOME/vimfiles/undo
  else
    set undodir=$HOME/.vim/undo
  endif

  set undolevels=1000
  set undoreload=10000
endif

set lazyredraw
set autochdir

set listchars=tab:»·,trail:·,extends:»,precedes:«,nbsp:·
set list

if has("mouse")
  set mouse=nv " don't use mouse in insert mode
endif

" always yank to system clipboard
set clipboard=unnamed

" no backup
set nobackup
set nowritebackup

set swapfile
if has("win32") || has("win64")
  set directory=$HOME/vimfiles/tmp
else
  set directory=$HOME/.vim/tmp
endif

" change the <leader> key
" let mapleader=","
" let g:mapleader=","
" noremap \ ,

" search stuff
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch

" spell checking
let g:spellfile_URL="http://ftp.vim.org/pub/vim/runtime/spell/"
set spelllang=nl,en
nmap <silent> <leader>s :set spell!<CR>

nnoremap <leader>m :w <BAR> !lessc % > ../css/%:t:r.css<CR>

let coffee_make_options = "--map --output ../js/"

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

" Run a Powershell command
nnoremap <leader>S :!powershell<space>-command<space>

if has("gui_macvim")
  set macmeta
endif

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Consistent with D and C
nnoremap Y y$

" Special gf extension
nnoremap <leader>gf :e <cfile><CR>

" long lines
set wrap
set formatoptions=qrn1
set linebreak

" colorcolumn
if exists('+colorcolumn')
  set colorcolumn=72,79
endif

" colorscheme
call togglebg#map("<leader>b")

if has("gui_running")
  set background=dark
else
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  set t_Co=256
  set background=dark
endif

colorscheme solarized

" font and window size
if has("gui_running")
  if has("win32") || has("win64")
    set guifont=Consolas:h10
  elseif has("gui_macvim") || has("mac") || has("macunix")
     set guifont=Menlo\ for\ Powerline:h12
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
  endif
  set columns=120
  set lines=50
endif

" Numbers
nnoremap <leader>n :NumbersToggle<CR>

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

" reopen last closed buffer; like Chrome
nmap <C-t> :b#<CR>

" use the hjkl keys the right way!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

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

" suffixes
autocmd FileType xml set suffixesadd=.xml
autocmd FileType xsl set suffixesadd=.xsl

" Always evenly sizes splits when resizing
autocmd VimResized * wincmd =

" Restore cursor position upon reopening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Big file => no syntax
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" Build files => XML
autocmd BufNewFile,BufRead *.build set ft=ant

" Vundle fix for 'set shellslash'
autocmd FileType vundle setlocal noshellslash

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

" Syntastic settings
" general
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" python settings
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_python_flake8_args="--ignore=E111,E501,E391,E121"

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Airline
let g:airline_powerline_fonts=1
let g:airline_enable_syntastic=1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=0
