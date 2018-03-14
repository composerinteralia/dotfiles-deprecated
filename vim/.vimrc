" use Vundle to load plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'elixir-lang/vim-elixir'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
call vundle#end()

" Allow % to find if/else/end pairs, and more
runtime macros/matchit.vim

" detect the file type and load plugin and index files
filetype plugin indent on

" syntax highlighting
syntax enable

" All the pretty colors
set t_Co=256

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

" automatically rebalance windows on resize
autocmd VimResized * :wincom =

" zooming a pane
noremap <leader>- :wincmd _<cr>:wincmd \|<cr>
noremap <leader>= :wincmd =<cr>

" reasonable default directions
set splitbelow
set splitright

" Cursor Highlighting
highlight CursorLine cterm=NONE ctermbg=lightgray
highlight CursorColumn cterm=NONE ctermbg=lightgray
noremap <Leader>H :set cursorline! cursorcolumn!<CR>

" Make it easier to get to first non-whitespace character on a line
nnoremap 0 ^
nnoremap ^ 0

let mapleader="\<Space>"

noremap <leader>tags :!ctags -R --exclude=@$HOME/dotfiles/vim/.ctagsignore<cr>

noremap <Leader>html :-1read $HOME/.vim/templates/skeleton.html<CR>3jwf>a
noremap <Leader>rspec :-1read $HOME/.vim/templates/skeleton.rspec<CR>f'a
noremap <Leader>rfeature :-1read $HOME/.vim/templates/skeleton.feature<CR>f'a

" Convert Ruby block from {} to do/end
noremap <Leader>d 0f{sdo<CR><ESC>oend<ESC>k0\|:s/\s*}$<CR>
" Put arguments on next line
noremap <Leader>f 0f(a<CR><ESC>k$%i<CR><ESC>k
" Newlines after commas
noremap <Leader>g 0f<Leader>a<CR><ESC>
" Convert Ruby single-line do/end to {}
noremap <Leader>e $FdC{<ESC>JA }<ESC>jdd

" Run specs with vim-rspec
let g:rspec_command = "VtrSendCommand be rspec {spec}"
noremap <Leader>c :call RunCurrentSpecFile()<CR>
noremap <Leader>s :call RunNearestSpec()<CR>
noremap <Leader>l :call RunLastSpec()<CR>

" tmux-runner
noremap <leader>tap :VtrAttachToPane<cr>
noremap <leader>tl :VtrSendLinesToRunner<cr>
noremap <leader>tf :VtrFocusRunner<cr>
noremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>

" Make CtrlP use ag for listing the files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Easily open and source vimrc
noremap <leader>vr :vsp $MYVIMRC<cr>
noremap <leader>so :source $MYVIMRC<cr>
