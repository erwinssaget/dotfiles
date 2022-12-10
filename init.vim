call plug#begin()

" File Drawer
Plug 'preservim/nerdtree'
" Commenting Plugin
Plug 'preservim/nerdcommenter'

" You should probably also install bat and delta
" - https://github.com/sharkdp/bat
" - https://github.com/dandavison/delta
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Make vim more like an IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorscheme
Plug 'sainnhe/gruvbox-material'

" Status bar
Plug 'itchyny/lightline.vim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

set number

 " Important!!
if has('termguicolors')
  set termguicolors
endif
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_background = 'hard'
" For better performance
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

" Change <Leader> to comma
let mapleader=','                             
"Not feeling the shift key
noremap ; :

" Avoid escape key
inoremap jj <Esc>

" Nerdtree
nmap <C-b> :NERDTreeToggle<cr>
" Close nerdtree after selecting a file
let NERDTreeQuitOnOpen = 1
" Dont prompt to delete buffer on delete
let NERDTreeAutoDeleteBuffer = 1

nmap <C-p> :GFiles<cr>