call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'

Plug 'sheerun/vim-polyglot'

Plug 'sainnhe/forest-night'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

syntax on

let g:forest_night_disable_italic_comment = 1
set termguicolors
colorscheme forest-night

set laststatus=2
let g:lightline = {
\ 'colorscheme' : 'forest_night',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ }

let g:ale_linters = {
\ 'proto': ['buf-check-lint',],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set expandtab
set softtabstop=4
set shiftwidth=4
set number
set cursorline
set showmatch
set foldenable
set backspace=indent,eol,start
set listchars=eol:↵,tab:>·,trail:~,extends:>,precedes:<,space:·
set list
set mouse=a
