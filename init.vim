let mapleader= ","
" Tab config
set expandtab
set shiftwidth=4
set tabstop=4

" Misc config
set number
set mouse=a
set clipboard=unnamedplus
set nocompatible
set encoding=utf-8
set fillchars=""

" Plugins
call plug#begin()
Plug 'tpope/vim-surround' 
Plug 'prettier/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'alvan/vim-closetag'
Plug 'tomasiser/vim-code-dark'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vimsence/vimsence'
Plug 'neovim/pynvim'
call plug#end()

" Indentation
filetype plugin indent on
set autoindent
set cindent
set smartindent
set indentexpr
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Auto Nerdtree
autocmd VimEnter * NERDTree
inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>": "\<S-Tab>"

" Closetag config
source  ~/.config/nvim/closetag.vim 

colorscheme codedark
hi normal ctermbg=none ctermfg=none guibg=none guifg=none
hi EndOfBuffer ctermfg=none ctermbg=none
hi clear VertSplit
hi clear LineNr
hi Directory ctermbg=none

" Airline
let g:airline_powerline_fonts=1

" Vimsence config
let g:python3_host_prog = '/usr/bin/python3.9'
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_custom_icons = {'filetype': 'iconname'}
