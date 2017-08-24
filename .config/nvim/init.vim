" Basic look and feel
set number
set relativenumber
set ruler
set nowrap
set scrolloff=8
set linespace=0
" Syntax settings
syntax on
let php_htmlInStrings = 1
" Change cursor on insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" Use 2 spaces when using Tab key or < >
set expandtab
set tabstop=2
set smarttab
set autoindent
set smartindent
set shiftwidth=2
" No beeps!
set noerrorbells
set visualbell
" Enable Mode line
set modeline
" Prevent two spaces from being inserted during a join
set nojoinspaces
" Show current command combos
set showcmd
" Highlight search results
" :noh to clear highlights
set hlsearch
" Non-case sensitive search
set ignorecase
"""""""""""""""""""""""""""""""""""""""""
" Vim Plug
call plug#begin()
" Dracula Colorscheme
Plug 'dracula/vim'
" NERDTree
Plug 'scrooloose/nerdtree'
nmap <C-\> :NERDTreeToggle %<cr>
" Emmet
Plug 'mattn/emmet-vim'
" Use tab key for extending emmet rather
" than the default.
" let g:user_emmet_expandabbr_key='<Tab>'
" Git
Plug 'airblade/vim-gitgutter'
" Surround
Plug 'tpope/vim-surround'
" Comments
Plug 'tpope/vim-commentary'
" Syntax
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'yggdroot/indentline'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'
let g:quantum_black=1
call plug#end()
""""""""""""""""""""""""""""""""""""""""
" Set Colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme dracula
set background=dark
