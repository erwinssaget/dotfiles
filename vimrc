set nocompatible                              " Required
filetype off                                  " Required

set rtp+=~/.vim/bundle/Vundle.vim             " Include Vundle in runtime path
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                 " Vundle manages Vundle, required
Plugin 'tpope/vim-vinegar'                    " File Navigation
Plugin 'tpope/vim-fugitive'                   " Git wrapper for vim
Plugin 'ctrlpvim/ctrlp.vim'                   " Fuzzy Finder
Plugin 'posva/vim-vue'                        " Plugin for vue files
Plugin 'Raimondi/delimitMate'                 " Autoclose parentheses and the like
Plugin 'godlygeek/tabular'                    " Alignment
Plugin 'scrooloose/nerdcommenter'             " Comments
Plugin 'pangloss/vim-javascript'              " Better JS support
Plugin 'scrooloose/nerdtree'                  " File Drawer
Plugin 'StanAngeloff/php.vim'                 " Syntax highlighting for php
Plugin 'vim-airline/vim-airline'              " Statusline Plugin
Plugin 'vim-airline/vim-airline-themes'       " Statusline Plugin
Plugin 'airblade/vim-gitgutter'               " Shows diff in sign column
Plugin 'christoomey/vim-tmux-navigator'       " For tmux
Plugin 'sheerun/vim-polyglot'                 " Language syntax pack
Plugin 'chriskempson/base16-vim'              " Easily switch colorscheme
Plugin 'benmills/vimux'                       " Tmux commands
Plugin 'editorconfig/editorconfig-vim'        " Maintain consistent styles across projects
call vundle#end()                             " End of plugins - required

filetype plugin indent on                     " Enable plugins and indents by filetype
let mapleader=','                             " Change <Leader> to comma
syntax enable                                 " Enable syntax hhighlighting
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
set number
set backspace=indent,eol,start                " Common backspace behavior
set cursorline
set hidden                                    " Allow hiding buffers w/ changes
set splitbelow                                " Always sets the split below
set splitright                                " Always sets the split to the right
set ts=4 sw=4
set expandtab
"set list
"set listchars=trail:·
set laststatus=2
set statusline=%=%{fugitive#statusline()}
set mouse=a
set autoread                                  " Automatically read changes

let g:gitgutter_sign_column_always=1
let g:airline_section_y=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
let g:airline_powerline_fonts=0

set hlsearch                                  " Highlight my searches
set incsearch                                 " Search incrementally and jump to term
set smartcase                                 " Smart case search for uppercase
set ignorecase                                " Case insensitive search

" ======= Persistent Undo =============
 silent !mkdir ~/.vim/backups > /dev/null 2>&1
 set undodir=~/.vim/backups
 set undofile

" ======= Ctrl P Configuration ========
let g:ctrlp_match_window = 'bottom,order:ttb,min:1, max:15,results:15'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,.DS_Store,/.git,*/vendor/*,*/public/*
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"Not feeling the shift key
noremap ; :

" Add semicolon to end of line
nnoremap ,; m`A;<Esc>``

" Avoid escape key
inoremap jj <Esc>

" mappings for switching splits
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-h> <C-W><C-H>
nmap <C-l> <C-W><C-L>

" Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Nerdtree
nmap <C-b> :NERDTreeToggle<cr>

" Switch buffers easily
nmap <C-m> :bnext<cr>

" Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"write, then gulp
nmap <Leader>g :!clear && gulp<cr>
nmap <Leader>p :!clear && phpunit<cr>
nmap <Leader>pm :!clear && php artisan migrate:refresh --seed<cr>
nmap <Leader>n :!clear && npm run unit<cr>
nmap <Leader>lr :!clear && php artisan route:list<cr>
nmap <Leader>l :!clear && npm run lint<cr>

"Laravel specific mappings
nmap <Leader>lrw :e routes/web.php<cr>
nmap <Leader>lra :e routes/api.php<cr>
nmap <Leader>la :e config/app.php<cr>
nmap <Leader>lg :e gulpfile.js<cr>
nmap <Leader>le :e .env<cr>

" Vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>

"---Auto-Commands---"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
    autocmd FileType vue,html so ~/.vim/ftplugin/html_autoclosetag.vim
augroup END
