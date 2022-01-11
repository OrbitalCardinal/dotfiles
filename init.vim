set clipboard=unnamedplus
set number
set expandtab
set shiftwidth=4
set tabstop=4
filetype plugin on
syntax on
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tomasiser/vim-code-dark'
Plug 'pangloss/vim-javascript'
Plug 'navarasu/onedark.nvim'
Plug 'fratajczak/one-monokai-vim'
Plug 'Mofiqul/vscode.nvim'
Plug 'markvincze/panda-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'folke/lsp-colors.nvim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'ap/vim-css-color'
Plug 'chrisbra/Colorizer'
call plug#end()

let g:onedark_style= 'deep'
set t_Co=256
set termguicolors
let g:vim_jsx_pretty_colorful_config = 1
let g:vscode_style = 'dark'
colorscheme onedark
" When using onedark
hi statusline guifg=#ffffff guibg=#373737
"
lua << EOF
require("lsp-colors").setup({
    Error = "#ffffff",
    Warning = "#ffffff",
    Information = "#ffffff",
    Hint = "#ffffff"
})
EOF
hi normal ctermbg=none ctermfg=none guibg=none guifg=none
hi EndOfBuffer ctermfg=none ctermbg=none guibg=none guifg=none
hi clear LineNr
hi clear SignColumn
hi Directory ctermbg=none

set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local lspconfig = require('lspconfig')
require'lspconfig'.tsserver.setup{
on_attach = function()
		require"lsp_signature".on_attach({
		bind = true,
		floating_window = true,
		fix_pos = false,
		hint_enable = true,
		hint_prefix = "🐼 ",
		hi_parameter = "Search",
		handler_opts = {
			border = "rounded"
			}
		})
                end

}

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF

hi NormalFloat ctermbg=none
