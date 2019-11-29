set nocompatible                              " Required
filetype off                                  " Required

" use fzf in vim
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim             " Include Vundle in runtime path

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                 " Vundle manages Vundle, required
Plugin 'christoomey/vim-tmux-navigator'       " For tmux
Plugin 'benmills/vimux'                       " Tmux commands
Plugin 'scrooloose/nerdtree'                  " File Drawer
Plugin 'scrooloose/nerdcommenter'             " Comments
Plugin 'editorconfig/editorconfig-vim'        " Maintain consistent styles
Plugin 'dense-analysis/ale'                   " Linter
Plugin 'jeffkreeftmeijer/vim-dim'             " Colorscheme
Plugin 'pangloss/vim-javascript'              " Javascript Support
Plugin 'arcticicestudio/nord-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
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
set autoread
set scl=yes
set hidden
set cursorline
set noshowmode
set laststatus=2
set mouse=a

colorscheme nord

" Ale
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\ }

highlight clear SignColumn
" Vim Javascript
let g:javascript_plugin_jsdoc = 1


let g:lightline = {
\ 'colorscheme': 'nord',
\ }

" Vimux
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

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

nmap <C-p> :FZF<cr>

" Prompt for a command to run
 map <Leader>vp :VimuxPromptCommand<CR>

 " Run last command executed by VimuxRunCommand
 map <Leader>vl :VimuxRunLastCommand<CR>

  " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>vq :VimuxCloseRunner<CR>

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
