" use Vundle to load plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()

" Allow % to find if/else/end pairs, and more
runtime macros/matchit.vim

" detect the file type and load plugin and index files
filetype plugin indent on

" syntax highlighting
syntax enable

set expandtab shiftwidth=2 tabstop=2 " Replace tabs with two spaces

set hlsearch incsearch " start searching when I start typing and highlight

set dictionary=/usr/share/dict/words
set hidden                            " Allow buffer change without writing
set history=1000                      " Remember 1000 commands
set number                            " Show the line number I am on"
set relativenumber                    " Show relative line numbers
set ruler                             " Show line number and col number
set scrolloff=4                       " Keep at least 4 lines above/below cursor
set showcmd                           " Shows what commands I am typing

" For tab autocomplete
set path+=**
set wildignore+=**/coverage/*
set wildignore+=**/log/*
set wildignore+=**/node_modules/*
set wildignore+=**/tmp/*
set wildmenu

" What arrow keys?
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" For navigating between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Make it easier to get to first non-whitespace character on a line
nnoremap 0 ^
nnoremap ^ 0

let mapleader="\<Space>"

nnoremap <leader>t :!ctags -R --exclude=@$HOME/dotfiles/vim/.ctagsignore<cr>

nnoremap <leader>vr :vsp $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>

nnoremap <Leader>html :-1read $HOME/.vim/templates/skeleton.html<CR>3jwf>a
nnoremap <Leader>rspec :-1read $HOME/.vim/templates/skeleton.rspec<CR>f'a
nnoremap <Leader>rfeature :-1read $HOME/.vim/templates/skeleton.feature<CR>f'a

" Convert Ruby block from {} to do/end
nnoremap <Leader>d 0f{sdo<CR><ESC>oend<ESC>k0\|:s/\s*}$<CR>
" Put arguments on next line
nnoremap <Leader>f 0f(a<CR><ESC>k$%i<CR><ESC>k
" Newlines after commas
nnoremap <Leader>g 0f<Leader>a<CR><ESC>
" Convert Ruby single-line do/end to {}
nnoremap <Leader>e $FdC{<ESC>JA }<ESC>jdd

" Run specs
let g:rspec_command = "!bin/rspec {spec}"
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" Make CtrlP use ag for listing the files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
