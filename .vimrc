if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'

Plug 'sheerun/vim-polyglot'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

syntax on

set termguicolors
colorscheme nord

set laststatus=2
let g:lightline = {
\ 'colorscheme' : 'nord',
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

