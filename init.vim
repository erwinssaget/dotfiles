call plug#begin()
Plug 'preservim/nerdtree'                     " File Drawer
Plug 'preservim/nerdcommenter'                " Commenting Plugin
" You should probably also install bat and delta
" - https://github.com/sharkdp/bat
" - https://github.com/dandavison/delta
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Make vim more like an IDE
Plug 'sainnhe/gruvbox-material'                 " Colorscheme
Plug 'itchyny/lightline.vim'                    " Status bar
Plug 'christoomey/vim-tmux-navigator'           " For tmux integration
Plug 'editorconfig/editorconfig'
Plug 'pangloss/vim-javascript'                  " Javascript support
Plug 'dense-analysis/ale'                       " Linter

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

set hlsearch                                  " Highlight my searches
set incsearch                                 " Search incrementally
set smartcase                                 " Smart case search for uppercase
set ignorecase                                " Case insensitive search
set number                                    " Show number lines
set tabstop=2 shiftwidth=2 expandtab
set softtabstop=2
" number of spaces to use to shift
set shiftwidth=2
" Use multiple of shiftwidth when indenting
set shiftround
set splitbelow                                " Make splits appear below window

 " Important!! Colors are nice!
if has('termguicolors')
  set termguicolors
endif

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

" Switch buffers easily
nmap <C-n> :bprevious<cr>
nmap <C-m> :bnext<cr>

" Add simple highlight removal.
nmap <leader><space> :nohlsearch<cr>

" Change <Leader> to comma
let mapleader=','
"Not feeling the shift key
noremap ; :

" Avoid escape key
inoremap jj <Esc>

" Make it easy to edit the init.vim file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Ale
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\ }

" Nerdtree
nmap <C-b> :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>
" Close nerdtree after selecting a file
let NERDTreeQuitOnOpen = 1
" Dont prompt to delete buffer on delete
let NERDTreeAutoDeleteBuffer = 1

nmap <C-p> :GFiles<cr>
