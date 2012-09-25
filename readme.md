Windows (as Administrator)
===
  cd %HOME%
  git clone https://github.com/hoest/vim-dotfiles.git vimfiles
  mklink.exe _vimrc vimfiles\\.vimrc

OSX/Linux
===
  cd ~
  git clone https://github.com/hoest/vim-dotfiles.git .vim
  ln -s .vim/.vimrc .vimrc
