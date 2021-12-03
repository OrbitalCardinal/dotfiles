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
Plug 'wellle/targets.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mortonfox/nerdtree-term'
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Plug 'dense-analysis/ale'
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
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

" Closetag config
source  ~/.config/nvim/closetag.vim 

colorscheme codedark
hi normal ctermbg=none ctermfg=none guibg=none guifg=none
hi EndOfBuffer ctermfg=none ctermbg=none
hi clear VertSplit
hi clear LineNr
hi clear SignColumn
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

" FZF
nnoremap <silent> <C-f> :Files<CR>
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Ale
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_fix_on_save = 1
