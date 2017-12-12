" use Vundle to load plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vimdle.vim'
Plugin 'thoughtbot/vim-rspec'
call vundle#end()

" detect the file type and load plugin and index files
filetype plugin indent on

" syntax highlighting
syntax enable

" Replace tabs with two spaces
set expandtab shiftwidth=2 tabstop=2

set history=500

" start searching when I start typing and highlight
set hlsearch incsearch

" shows relative numbers, but actual line number for the one I am on
set number
set relativenumber

" shows line number and col number
set ruler

" shows what commands I am typing
set showcmd

" For tab autocomplete
set path+=**
set wildignore+=**/coverage/*
set wildignore+=**/log/*
set wildignore+=**/node_modules/*
set wildignore+=**/tmp/*
set wildmenu

set dictionary=/usr/share/dict/words

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

" CTags
nnoremap <C-I> :w<CR>:Mtags<CR><CR>
command Mtags !ctags -R --exclude=@$HOME/dotfiles/vim/.ctagsignore

cnoremap jk <ESC>
inoremap jk <ESC>

let mapleader=","

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

