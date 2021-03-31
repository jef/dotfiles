if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'
Plug 'sheerun/vim-polyglot'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme base16

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:ale_linters = {
\ 'proto': ['buf-check-lint',],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set laststatus=2
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

