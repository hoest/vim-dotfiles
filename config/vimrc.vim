" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

" language
set langmenu=en_US.UTF-8
language messages en_US.UTF-8

" vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'matze/vim-move'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'myusuf3/numbers.vim'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession' | Plug 'dhruvasagar/vim-prosession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/tComment'
Plug 'w0rp/ale'
call plug#end()

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
set termencoding=utf-8
set fileencodings=

" just make things better
set smartindent
set smarttab
set autoindent
" set copyindent
set showmode
set noshowmatch
set hidden
set visualbell
set noerrorbells
set title
set cursorline
set ttyfast
set number
set nojoinspaces
set backspace=2 " make backspace work like most other apps

" Supertab
let g:SuperTabDefaultCompletionType="context"

" Add ctrlp ignore filter
let g:ctrlp_custom_ignore={
  \'dir': '\v[\/](build|bin|obj|com|deploy|dist|tmp|tools|node_modules)$',
  \'file': '\v\.(exe|obj|dll|pdb|suo|cache|pyc|swp|so|db|map)$'
  \}

" Emtpy cache
let g:ctrlp_clear_cache_on_exit=1

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
set ttyfast
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

" search stuff
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch

" Ack
nnoremap <leader>a :Ack!<space>

" spell checking
let g:spellfile_URL="http://ftp.vim.org/pub/vim/runtime/spell/"
set spelllang=nl,en
nmap <silent> <leader>s :set spell!<CR>

" clearing highlighted searches
nnoremap <leader><space> :nohlsearch<CR>

" fix dirty xml/xhtml
nnoremap <leader>fx :1,%s/>\s*</>\r</gg<CR>gg=G<CR>
" close a tag in XML
inoremap <M-.> </<C-X><C-O>

" diable fold
set nofoldenable

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
  set colorcolumn=72,79,120
endif

" colorscheme
call togglebg#map("<leader>b")

if has("gui_running")
  set background=dark
else
  set t_Co=256
  set background=dark
endif

" colorscheme
colorscheme gruvbox

" font and window size
if has("gui_running")
  if has("win32") || has("win64")
    set guifont=Powerline_Consolas:h10
  elseif has("gui_macvim") || has("mac") || has("macunix")
     set guifont=Menlo\ for\ Powerline:h12
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
  endif
  set columns=120
  set lines=35
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
" delete current buffer; but keep split
nmap <leader>D :bp\|bd #<CR>

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

" vim-move
let g:move_key_modifier = 'C'

" duplicate current line
nnoremap <leader>d :t.<CR>

" reload .vimrc
map <leader>r :source $MYVIMRC<CR>

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

" Nant Build file
au BufRead,BufNewFile *.build set filetype=xml

" cleanup whitespace
function! StripTrailingWhitespaces()
  " save last search, and cursor position.
  let _s=@/
  let l=line(".")
  let c=col(".")
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

" prettier
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
" autocmd BufWritePre *.jsx exe "normal! gggqG\<C-o>\<C-o>"

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#fnamemod = ':p:t'

" GitGutter
let g:gitgutter_realtime=0

" Rooter
let g:rooter_change_directory_for_non_project_files='current'
let g:rooter_patterns=['.ctrlp', 'project.xml', 'CVS', '.git/']
let g:rooter_silent_chdir = 1

" Prosession
if has("win32") || has("win64")
  let g:prosession_dir='~/vimfiles/session'
else
  let g:prosession_dir='~/.vim/session'
endif
let g:prosession_on_startup=1
" let g:prosession_default_session=1

" OmniSharp
let g:OmniSharp_selector_ui = 'ctrlp' " Use ctrlp.vim

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Ag; Silver Surfer
if executable('ag')
  " Ack.vim
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" install a diff.exe for Windows, and reset diffexpr
set diffexpr=

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" ALE
let b:ale_fixers = ['trim_whitespace', 'prettier', 'eslint']
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '.'
