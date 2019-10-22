set nocompatible                              " Required
filetype off                                  " Required

set rtp+=~/.vim/bundle/Vundle.vim             " Include Vundle in runtime path
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                 " Vundle manages Vundle, required
Plugin 'christoomey/vim-tmux-navigator'       " For tmux
Plugin 'scrooloose/nerdtree'                  " File Drawer
Plugin 'scrooloose/nerdcommenter'             " Comments
Plugin 'editorconfig/editorconfig-vim'        " Maintain consistent styles
Plugin 'ctrlpvim/ctrlp.vim'                   " Fuzzy File Finder
Plugin 'jeffkreeftmeijer/vim-dim'             " Colorscheme
call vundle#end()                             " End of plugins - required

filetype plugin indent on                     " required
let mapleader=','                             " Change <Leader> to comma
syntax enable                                 " Enable syntax highlighting
set tabstop=2 shiftwidth=2 expandtab
set backspace=indent,eol,start                " Common backspace behavior
set softtabstop=2
set hlsearch                                  " Highlight my searches
set incsearch                                 " Search incrementally
set smartcase                                 " Smart case search for uppercase
set ignorecase                                " Case insensitive search
set number

colorscheme dim
" ======= Persistent Undo =============
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Switch buffers easily
nmap <C-n> :bprevious<cr>
nmap <C-m> :bnext<cr>

" Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
"Not feeling the shift key
noremap ; :
" Avoid escape key
inoremap jj <Esc>
" Make cursor move linewise
map j gj
map k gk
" Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Nerdtree
nmap <C-b> :NERDTreeToggle<cr>
" Close nerdtree after selecting a file
let NERDTreeQuitOnOpen = 1
" Dont prompt to delete buffer on delete
let NERDTreeAutoDeleteBuffer = 1

" ---Auto-Commands---"
augroup autosourcing
    autocmd BufWritePost .vimrc source %
augroup END
