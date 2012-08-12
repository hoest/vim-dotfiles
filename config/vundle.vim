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
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/YankRing.vim'

filetype plugin indent on
