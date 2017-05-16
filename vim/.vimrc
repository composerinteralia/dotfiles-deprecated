:filetype plugin indent on

:syntax enable

:set expandtab shiftwidth=2 tabstop=2
:set history=50
:set hlsearch incsearch
:set nocompatible
:set number
:set path+=**
:set ruler
:set showcmd
:set wildignore+=**/coverage/*
:set wildignore+=**/log/*
:set wildignore+=**/node_modules/*
:set wildignore+=**/tmp/*
:set wildmenu

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

:cnoremap jk <ESC>
:inoremap jk <ESC>

:nnoremap ss :w<CR>

:nnoremap ,html :-1read $HOME/.vim/templates/skeleton.html<CR>3jwf>a

command MakeTags !ctags -R --exclude=.git --exclude=node_modules
