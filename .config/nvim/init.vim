set nocompatible
set hidden

" Basic look and feel
set number
set relativenumber
set ruler
set nowrap
set scrolloff=8
set linespace=0
" set splitbelow
" set splitright

" Syntax settings
syntax on
let php_htmlInStrings = 1
" Change cursor on insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" Use 2 spaces when using Tab key or < >
set expandtab!
set tabstop=4
set smarttab
set autoindent
set smartindent
set shiftwidth=4

set autowrite

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

" Ctrl-P
Plug 'kien/ctrlp.vim'
let g:ctrlp_map='<c-p>'
let g:ctrlp_working_path_mode='r'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
set wildignore+=*/tmp/*,*/vendor/*,*/node_modules/*,*/.git/*
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

" Vim go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'majutsushi/tagbar'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
Plug 'garyburd/go-explorer'
Plug 'tpope/vim-dispatch'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'
let g:quantum_black=1
call plug#end()
""""""""""""""""""""""""""""""""""""""""

let mapleader=","

filetype plugin indent on    " required

syntax on
" Set Colorscheme

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme dracula
set background=dark


" go-vim
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_term_enabled = 1
let g:go_list_type = "quickfix"
let g:go_addtags_transform = "snake_cake"
let g:go_meta_linter_enabled = ['vet', 'golint', 'errcheck']
let g:go_meta_linter_autosave = 1
let g:go_auto_type_info = 1
set updatetime=100

" deoplete
" --------
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '/Users/jeremyc/develop/GoCode/bin/gocode'
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview " disable preview window at the bottom of the screen
inoremap <silent><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

map <C-n> :cnext<cr>
map <C-m> :cprevious<cr>
noremap <leader>a :cclose<cr>

" Terminal
:tnoremap <Esc> <C-\><C-n>

" Split Panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-S><C-J> :sp<cr>
map <C-S><C-L> :vsp<cr>


augroup vimgo
	" run :GoBuild or :GoTestCompile based on the go file
	function! s:build_go_files()
	    let l:file = expand('%')
	    if l:file =~# '^\f\+_test\.go$'
		    call go#test#Test(0, 1)
	    elseif l:file =~# '^\f\+\.go$'
	        call go#cmd#Build(0)
	    endif
    endfunction

	autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>r  :GoRun<CR>
    " autocmd FileType go nmap <leader>b  :GoBuild<CR>
    autocmd FileType go nmap <leader>t  :GoTest<CR>
    autocmd FileType go nmap <leader>c :GoCoverageToggle<CR>
    autocmd FileType go nmap <leader>v :GoAlternate<CR>
	autocmd FileType go nmap <leader>i :GoInfo<CR>
	autocmd FileType go nmap <leader>d :GoDoc<CR>

	autocmd FileType go nmap gS :SplitjoinSplit<CR>
	autocmd FileType go nmap gJ :SplitjoinJoin<CR> 
    
	autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
	autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
	autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
	autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

augroup autosourcing
	autocmd!
	autocmd BufWritePost init.vim source %
augroup END

