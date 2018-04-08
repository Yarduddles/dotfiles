" Load packages from the dotfiles/vim location
set runtimepath+=~/dotfiles/vim
set packpath=~/dotfiles/vim

set cursorline
set nu
set colorcolumn=120
set mouse=a

" gruvbox is installed as a vim-8 plugin
colorscheme gruvbox
set background=dark
set termguicolors

" invoke ctrlp with ctrl-f
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" lines of history
set history=10000

" enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = ","
let g:mapleader = ","

" Set 7 lines to the cursor when moving vertically
set so=7

set ruler

set cmdheight=2

" ignore case when searching
set ignorecase

" make search act like search in modern browser
set incsearch

" show matching brackets
set showmatch

" no sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" =================================================================
" go vim

" run GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>tf <Plug>(go-test-func)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" There are two types of error lists in Vim. One is called location list the other quickfix. 
" Unfortunately the commands for each lists are different. So :cnext only works for 
" quickfix list, for location lists you have to use :lnext. Some of the commands in vim-go 
" open a location list, because location lists are associated with a window and each window 
" can have a separate list. This means you can have multiple windows, and multiple location 
" lists, one for Build, one for Check, one for Tests, etc..
" The below line makes all lists quickfix lists:
let g:go_list_type = "quickfix"

" What should vim-go highlight? It defaults to not highlighting many things
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

set updatetime=20

" Commands to open alternates
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" =================================================================
