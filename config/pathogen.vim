if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle/
else
  set rtp+=~/.vim/bundle/vundle/
endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
