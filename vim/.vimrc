:filetype plugin on

:syntax enable

:set expandtab shiftwidth=2 tabstop=2
:set history=50
:set hlsearch incsearch
:set nocompatible
:set number
:set path+=**
:set ruler
:set showcmd
:set wildignore+=*/node_modules/*
:set wildmenu

:cnoremap jk <ESC>
:inoremap jk <ESC>:w<CR>

:nnoremap ss :w<CR>

:nnoremap ,html :-1read $HOME/.vim/templates/skeleton.html<CR>3jwf>a

command MakeTags !ctags -R --exclude=.git --exclude=node_modules
