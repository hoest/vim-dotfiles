Windows (Powershell)
===
```
cd ~
git clone https://github.com/hoest/vim-dotfiles.git vimfiles
```

In an elevated Powershell

```
New-Item -ItemType SymbolicLink -Path _vimrc -Target .\vimfiles\.vimrc
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
You need to have Ack (Perl) and Python installed.

Install all plugins with VIM-Plug: `:PlugInstall`

Install the recommended Powerline-patched fonts.

