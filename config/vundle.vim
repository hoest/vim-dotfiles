filetype off

if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" own bundles
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'edsono/vim-matchit.git'
Bundle 'groenewege/vim-less.git'
Bundle 'jeffkreeftmeijer/vim-numbertoggle.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'kongo2002/fsharp-vim.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'msanders/snipmate.vim.git'
Bundle 'nvie/vim-flake8.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-scripts/Windows-PowerShell-Syntax-Plugin.git'

filetype plugin indent on
