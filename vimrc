set nocompatible                              " Required
filetype off                                  " Required

" use fzf in vim
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim             " Include Vundle in runtime path

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                 " Vundle manages Vundle, required
Plugin 'scrooloose/nerdtree'                  " File Drawer
Plugin 'scrooloose/nerdcommenter'             " Comments
Plugin 'christoomey/vim-tmux-navigator'       " For tmux
Plugin 'benmills/vimux'                       " Tmux commands
Plugin 'editorconfig/editorconfig-vim'        " Maintain consistent styles
Plugin 'dense-analysis/ale'                   " Linter
Plugin 'pangloss/vim-javascript'              " Javascript Support
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
Plugin 'rust-lang/rust.vim'
Plugin 'sainnhe/gruvbox-material'
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
set noshowmode
set laststatus=2
set mouse=a
set signcolumn=yes
set background=dark
set t_Co=256
set cursorline
if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_sign_column="bg0"
"let g:gruvbox_contrast_dark="soft"
let g:gruvbox_invert_selection=0
let g:gruvbox_material_disable_italic_comment=1
colorscheme gruvbox-material

" Snippets
map <Leader>es :tabedit ~/.vim/snippets/
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.snippet_version=1

" Git gutter
" Don't map keys to anything
let g:gitgutter_map_keys=0
" Make background colours match the sign column
let g:gitgutter_set_sign_backgrounds = 1

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

" Ale
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

let g:ale_rust_rls_executable = '/Users/erwinssaget/.cargo/bin/rls'
let g:ale_rust_rls_toolchain = 'stable'

let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'rust': ['rls'],
\ }
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'rust': ['rustfmt'],
\ }

highlight clear SignColumn

" Vim Javascript
let g:javascript_plugin_jsdoc = 1

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

" To unfold using space bar
nnoremap <space> za

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Vimux
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

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
