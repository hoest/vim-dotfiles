Windows (as Administrator)
===
  ```
  cd %HOME%
  git clone https://github.com/hoest/vim-dotfiles.git vimfiles
  mklink.exe _vimrc vimfiles\\.vimrc
  git clone https://github.com/gmarik/vundle.git ~/vimfiles/bundle/vundle
  ```

OSX/Linux
===
  ```
  cd ~
  git clone https://github.com/hoest/vim-dotfiles.git .vim
  ln -s .vim/.vimrc .vimrc
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  ```

Open VIM
===
  ```
  :BundleInstall
  ```
