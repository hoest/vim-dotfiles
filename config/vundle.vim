set nocompatible
filetype off

set runtimepath+=$HOME/vim-dotfiles/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" own bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'edsono/vim-matchit'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'

filetype plugin indent on
