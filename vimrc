set nocompatible                              " Required
filetype off                                  " Required

set rtp+=~/.vim/bundle/Vundle.vim             " Include Vundle in runtime path
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                 " Vundle manages Vundle, required
Plugin 'tpope/vim-vinegar'                    " File Navigation
Plugin 'tpope/vim-fugitive'                   " Git Integration
Plugin 'posva/vim-vue'                        " Plugin for vue files
Plugin 'Raimondi/delimitMate'                 " Autoclose parentheses, etc
Plugin 'godlygeek/tabular'                    " Alignment
Plugin 'scrooloose/nerdcommenter'             " Comments
Plugin 'pangloss/vim-javascript'              " Better JS support
Plugin 'mxw/vim-jsx'                          " Syntax highlighting and indenting for JSX
Plugin 'scrooloose/nerdtree'                  " File Drawer
Plugin 'StanAngeloff/php.vim'                 " Syntax highlighting for php
Plugin 'sheerun/vim-polyglot'                 " Language syntax pack
Plugin 'othree/xml.vim'                       " Plugin for editing xml, html
Plugin 'christoomey/vim-tmux-navigator'       " For tmux
Plugin 'benmills/vimux'                       " Tmux commands
Plugin 'tpope/vim-surround'                   " Surround plugin
Plugin 'MarcWeber/vim-addon-mw-utils'         " Dependency for vim-snipmate
Plugin 'tomtom/tlib_vim'                      " Dependency for vim-snipmate
Plugin 'garbas/vim-snipmate'                  " Snippets Plugin
Plugin 'w0rp/ale'                             " Vim 8 syntax checker
Plugin 'cakebaker/scss-syntax.vim'            " Scss/sass syntax
Plugin 'airblade/vim-gitgutter'               " Show git changes in gutter
Plugin 'editorconfig/editorconfig-vim'        " Maintain consistent styles
Plugin 'ctrlpvim/ctrlp.vim'                   " Fuzzy File Finder
Plugin 'shawncplus/phpcomplete.vim'           " Better php completion
Plugin 'morhetz/gruvbox'                      " Colorscheme
Plugin 'skywind3000/asyncrun.vim'             " Allows running of async commands
Plugin 'vim-airline/vim-airline'              " Airline Support
call vundle#end()                             " End of plugins - required

filetype plugin indent on                     " required
let mapleader=','                             " Change <Leader> to comma
syntax enable                                 " Enable syntax highlighting
set number
set background=dark
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors     " enable true colors support
let g:gruvbox_sign_column="bg0"
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_italicize_strings=1
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
set colorcolumn=80
set number
set relativenumber
set backspace=indent,eol,start                " Common backspace behavior
set hidden                                    " Allow hiding buffers w/ changes
set splitbelow                                " Sets split below
set splitright                                " Sets split to the right
set list
set ts=4 sw=4
set noexpandtab
set softtabstop=4
set autoread                                  " Automatically read changes
set tags=./tags;
set laststatus=2
set grepprg=rg\ --vimgrep
set signcolumn=yes
colorscheme gruvbox

let g:airline_theme='gruvbox'

let g:gitgutter_map_keys = 0

let g:ale_linters_explicit = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,trail:•

set hlsearch                                  " Highlight my searches
set incsearch                                 " Search incrementally
set smartcase                                 " Smart case search for uppercase
set ignorecase                                " Case insensitive search

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/node_modules/*,.DS_Store
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_use_caching = 0

" ======= Persistent Undo =============
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

"Not feeling the shift key
noremap ; :

" Bind <leader>y to forward last-yanked text to Clipper
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

" Toggle paste
set pastetoggle=<F10>

" Add semicolon to end of line
inoremap <Leader>; <C-o>A;

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
" Close nerdtree after selecting a file
let NERDTreeQuitOnOpen = 1
" Dont prompt to delete buffer on delete
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Prevent vim from slowing down
let g:vue_disable_pre_processors=1

" Tabularize
vmap <Leader>a :Tabularize /=>

" Switch buffers easily
nmap <C-n> :bprevious<cr>
nmap <C-m> :bnext<cr>

" Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

" Laravel specific mappings
nmap <Leader>lrw :e routes/web.php<cr>
nmap <Leader>lra :e routes/api.php<cr>
nmap <Leader>la :e config/app.php<cr>
nmap <Leader>le :e .env<cr>
nmap <Leader>pm :!clear && php artisan migrate:refresh --seed<cr>
nmap <Leader>pa :!clear && php artisan<Space>
nmap <Leader>t :VimuxRunCommand('clear; vendor/bin/phpunit')<cr>
nmap <Leader>tf :VimuxRunCommand('clear; vendor/bin/phpunit ' . bufname("%"))<cr>
nmap <Leader>tm yiw:!clear && vendor/bin/phpunit --filter <C-R>"<cr>
"nmap <Leader>n :!clear && npm run dev
nmap <Leader>n :VimuxRunCommand('clear; npm run dev ')<cr>
nmap <Leader>j :VimuxRunCommand('clear; npm run test ')<cr>
nmap <Leader>lr :!clear && php artisan route:list<cr>

" Vimux
let g:VimuxOrientation="h"
let g:VimuxHeight="40"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>

" Snippets
map <Leader>es :tabedit ~/.vim/snippets/
let g:snipMate = get(g:, 'snipMate', {})
let g:snipMate.snippet_version=1

" Editorconfig
" Allows editorconfig to work with vim fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path='/usr/local/bin/editorconfig'

" NerdCommenter with Vim-vue
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" ---Auto-Commands---"
augroup autosourcing
    autocmd!
	autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
    autocmd BufWritePost .vimrc source %
    autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
