set nocompatible                              " Required
filetype off                                  " Required

set rtp+=~/.vim/bundle/Vundle.vim             " Include Vundle in runtime path
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                 " Vundle manages Vundle, required
Plugin 'itchyny/lightline.vim'                " Statusline
Plugin 'christoomey/vim-tmux-navigator'       " For tmux
call vundle#end()                             " End of plugins - required

filetype plugin indent on                     " required
let mapleader=','                             " Change <Leader> to comma
syntax enable                                 " Enable syntax highlighting
set tabstop=2 shiftwidth=2 expandtab
set softtabstop=2
set laststatus=2                              " Always show statusline
set noshowmode                                " Lightline show status
set hlsearch                                  " Highlight my searches
set incsearch                                 " Search incrementally
set smartcase                                 " Smart case search for uppercase
set ignorecase                                " Case insensitive search

" ======= Persistent Undo =============
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

"Not feeling the shift key
noremap ; :

" Avoid escape key
inoremap jj <Esc>

" ---Auto-Commands---"
augroup autosourcing
    autocmd BufWritePost .vimrc source %
augroup END
