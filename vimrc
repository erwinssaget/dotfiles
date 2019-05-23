set nocompatible                              " Required
filetype off                                  " Required

set rtp+=~/.vim/bundle/Vundle.vim             " Include Vundle in runtime path
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                 " Vundle manages Vundle, required
Plugin 'tpope/vim-vinegar'                    " File Navigation
Plugin 'tpope/vim-fugitive'                   " Git Integration
Plugin 'tpope/vim-rhubarb'                    " Allows Gbrowse to open up files on Github
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
Plugin 'skywind3000/asyncrun.vim'             " Allows running of async commands
Plugin 'itchyny/lightline.vim'                " Statusline plugin
Plugin 'junegunn/seoul256.vim'
call vundle#end()                             " End of plugins - required

filetype plugin indent on                     " required
let mapleader=','                             " Change <Leader> to comma
syntax enable                                 " Enable syntax highlighting
set background=dark                           " Dark background?
set termguicolors
set t_Co=256
set backspace=indent,eol,start                " Common backspace behavior
set hidden                                    " Allow hiding buffers w/ changes
set splitbelow                                " Sets split below
set splitright                                " Sets split to the right
set list
set tabstop=2 shiftwidth=2 expandtab
set softtabstop=2
set autoread                                  " Automatically read changes
set tags=./tags;
set laststatus=2                              " Always show the statusbar bc of lightline"
set grepprg=rg\ --vimgrep
set signcolumn=yes                            " Show the sign column (for git gutter and errors)
set nonumber                                  " I like a clean editor
set updatetime=100
"set number
"set relativenumber
set mouse=a

"set colorcolumn=80
let g:seoul256_background=234
colorscheme seoul256

" I hate seeing the tilda signs in vim
highlight EndOfBuffer ctermfg=234 ctermbg=234

" Gitgutter
" Don't map any keys to anything
let g:gitgutter_map_keys=0
let g:gitgutter_sign_added='⇥'
let g:gitgutter_sign_modified='⇥'
let g:gitgutter_sign_removed='⇤'
let g:gitgutter_sign_modified_removed='⇤'
let g:gitgutter_override_sign_column_highlight=0
highlight SignColumn ctermfg=234 ctermbg=234

" Ale linter
let g:ale_lint_on_enter=1 " Less distracting when opening a new file
let g:ale_sign_error='✗'
let g:ale_sign_warning='▲'
let g:ale_linters_explicit=1 " Only lint files that I explicitly specify
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'php': ['php'],
\   'javascript': ['prettier']
\}
let g:ale_fixers = {
\   'javascript': ['prettier']
\}


" Toggle whether to show characters or not
nmap <leader>l :set list!<CR>
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things"

set hlsearch                                  " Highlight my searches
set incsearch                                 " Search incrementally
set smartcase                                 " Smart case search for uppercase
set ignorecase                                " Case insensitive search

" ------- Lightline config ------------
let g:lightline = {
\ 'colorscheme': 'seoul256',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible
" (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
	if exists('#lightline')
		call lightline#update()
	end
endfunction

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

" Make j & k linewise

" turn off linewise keys -- normally, the `j' and `k' keys move the cursor down
" one entire line. with line wrapping on, this can cause the cursor to actually
" skip a few lines on the screen because it's moving from line N to line N+1 in
" the file. I want this to act more visually -- I want `down' to mean the next
" line on the screen
map j gj
map k gk

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

" Prevent vim from slowing down Vim-vue
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
