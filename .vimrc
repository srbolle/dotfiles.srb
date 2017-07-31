set nocompatible	    " Disable vi-compatibility

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off		" required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
"
" original repos on github
Plugin 'fs111/pydoc.vim'
" Plugin 'vim-scripts/pep8' " Deleted 2016-07-02
Plugin 'vim-scripts/TaskList.vim'
" Plugin 'vim-scripts/The-NERD-tree' " Deleted 2016-07-02
Plugin 'vim-scripts/taglist.vim'
" Plugin 'sontek/minibufexpl.vim'
Plugin 'fholgado/minibufexpl.vim'
" Plugin 'klen/python-mode'  " Deleted 2016-07-02
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reinh/vim-makegreen'
Plugin 'alfredodeza/pytest.vim'
Plugin 'lambdalisue/vim-django-support'
" New from 2016-07-02
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'  " TODO: find a way to compile this on virtual machines
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'saltstack/salt-vim'
Plugin 'kien/tabman.vim'
Plugin 'jalvesaq/Nvim-R'
call vundle#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
     
filetype on               " try to detect filetypes
filetype plugin indent on " required!
" or
" filetype plugin on " to not use th


autocmd FileType python set omnifunc=pythoncomplete#Complete

set laststatus=2        " Always show the statusline (useful with Powerline)
set showtabline=2       " Always display the tabline, even if there is only one tab (useful with Powerline)
set encoding=utf-8

" shiftwidth, tabstop and softtabstop
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

au BufNewFile,BufRead *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flagging unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

syntax on  " Enable syntax highlighting


map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

let mapleader = ","
let g:pep8_map='<leader>8'
let g:pymode_lint_ignore="E501"

" For help :help Powerline
let g:Powerline_symbols = 'unicode' " alternatives: compatible | unicode | fancy
let g:Powerline_colorscheme = 'solarized256'

" Configure CtrlP
" Check :help ctrlp-options for other options.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Configure Syntastic
" See :help syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']  " some options: flake8, pyflakes, pylint, python
" let g:syntastic_python_flake8_args = '--max-line-length=120'
" let g:syntastic_python_flake8_post_args = --max-line-length=120
let g:syntastic_python_flake8_args = '--ignore=E501'
" let g:syntastic_python_flake8_post_args = '--max-line-length=120'

" Configure TabMan (several options; mt and mf are default mappings)
" let g:tabman_toggle = '<leader>mt'
" let g:tabman_focus  = '<leader>mf'

map <leader>k :Explore<CR>  " vim builtin alternative to NERDTree; when open, use i to toggle
map <leader>n :NERDTreeToggle<CR>
map <leader>td <Plug>TaskList
map <leader>c :TlistToggle<CR> " taglist.vim
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Close vim if NERDTree is only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview = 1

" Enable folding with the spacebar
nnoremap <space> za

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
  " project_base_dir = os.environ['VIRTUAL_ENV']
  " activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  " execfile(activate_this, dict(__file__=activate_this))
" EOF


syntax enable
" set background=dark
" set t_Co=16
set t_Co=256
let g:solarized_termcolors=256
colorscheme torte

