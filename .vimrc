autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
:syntax on


map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

let mapleader = ","
let g:pep8_map='<leader>8'
let g:pymode_lint_ignore="E501"
map <leader>n :NERDTreeToggle<CR>
map <leader>td <Plug>TaskList
map <leader>c :TlistToggle<CR>
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

set nocompatible	" be iMproved
filetype off		" required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'fs111/pydoc.vim'
Plugin 'vim-scripts/pep8'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'vim-scripts/taglist.vim'
" Plugin 'sontek/minibufexpl.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'klen/python-mode'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reinh/vim-makegreen'
Plugin 'ervandew/supertab'
Plugin 'alfredodeza/pytest.vim'
Plugin 'lambdalisue/vim-django-support'
call vundle#end()

" vim-scripts repos

" non github repos
" ...
     
filetype on               " try to detect filetypes
filetype plugin indent on " required!
" or
" filetype plugin on " to not use th

syntax enable
set background=dark
set t_Co=16
" set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
