let mapleader= ","
" Tab config
set expandtab
set shiftwidth=4
set tabstop=4

" Misc config
set number relativenumber
set mouse=a
set clipboard=unnamedplus
set nocompatible
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11
set fillchars=""

" Plugins
call plug#begin()
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/xml.vim'
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
Plug 'mattn/emmet-vim'
Plug 'markvincze/panda-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

" Emmet
let g:user_emmet_leader_key=','

" Indentation
filetype plugin indent on
set autoindent
set cindent
set smartindent
set indentexpr
let g:html_indent_inctags='*'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Auto Nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>": "\<S-Tab>"
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
let NERDTreeMinimalUI=1

" Closetag config
source  ~/.config/nvim/closetag.vim 

set t_Co=256
set t_ut=
colorscheme codedark
let g:codedark_term256=1
let g:airline_powerline_fonts=1
let g:airline_theme= 'codedark'
hi normal ctermbg=none ctermfg=none guibg=none guifg=none
hi EndOfBuffer ctermfg=none ctermbg=none
hi clear VertSplit
hi clear LineNr
hi clear SignColumn
hi Directory ctermbg=none
" Airline

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

" PERSONAL BINDINGS
" Open a new terminal below current split
:nnoremap <silent> <C-t> :rightbelow :sp<CR> :term<CR> <C-w>10- <C-w>j i 
