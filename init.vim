call plug#begin()
Plug 'preservim/nerdtree'                           " File Drawer
Plug 'preservim/nerdcommenter'                      " Commenting Plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " You should probably also install bat and delta, fd, & tree
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Make vim more like an IDE
Plug 'sainnhe/gruvbox-material'                     " Colorscheme
Plug 'itchyny/lightline.vim'                        " Status bar
Plug 'christoomey/vim-tmux-navigator'               " For tmux integration
Plug 'editorconfig/editorconfig'
Plug 'pangloss/vim-javascript'                      " Javascript support
Plug 'mfussenegger/nvim-lint'
"Plug 'dense-analysis/ale'                           " Linter
call plug#end()

set hlsearch                                        " Highlight my searches
set incsearch                                       " Search incrementally
set smartcase                                       " Smart case search for uppercase
set ignorecase                                      " Case insensitive search
set number                                          " Show number lines
set tabstop=2 shiftwidth=2 expandtab
set softtabstop=2
" number of spaces to use to shift
set shiftwidth=2
" Use multiple of shiftwidth when indenting
set shiftround
set splitbelow                                      " Make splits appear below window
set signcolumn=yes:1

 " Important!! Colors are nice!
if has('termguicolors')
  set termguicolors
endif

let g:gruvbox_material_background = 'medium'
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
"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
"let g:ale_disable_lsp = 1
"let g:ale_lint_on_text_changed = 'always'
"let g:ale_lint_delay = 1000
"let g:ale_fix_on_save = 1
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'javascript': ['eslint'],
"\   'typescript': ['eslint'],
"\ }
" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" For coc.vim completions
" You have to remap <cr> to make it confirms completion.
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Nerdtree
nmap <C-b> :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>
" Close nerdtree after selecting a file
let NERDTreeQuitOnOpen = 1
" Dont prompt to delete buffer on delete
let NERDTreeAutoDeleteBuffer = 1

" ======= Persistent Undo =============
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

nmap <C-p> :GFiles<cr>
nmap <C-r> :Rg<cr>

au BufWritePost javascript require('lint').try_lint()
au BufWritePost typescript require('lint').try_lint()
