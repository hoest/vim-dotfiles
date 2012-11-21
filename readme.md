Windows (as Administrator)
===
  ```
  cd %HOME%
  git clone https://github.com/hoest/vim-dotfiles.git vimfiles
  mklink.exe _vimrc vimfiles\\.vimrc
  cd vimfiles
  ```

OSX/Linux
===
  ```
  cd ~
  git clone https://github.com/hoest/vim-dotfiles.git .vim
  ln -s .vim/.vimrc .vimrc
  cd .vim/
  ```

All
===
  ```
  git submodule init
  git submodule update
  ```
You need to have Ack (Perl) and Python (Flake8) installed.
