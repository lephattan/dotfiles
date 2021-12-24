syntax on
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set clipboard=unnamedplus
set nowrap
set splitright
set splitbelow
let mapleader=" "
set cursorline
let g:python3_host_prog = expand("~/.envs/nvim/bin/python3")
let python_highlight_all=1
"set completeopt-=preview " Disable scratch preview

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"Plug 'nvie/vim-flake8'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', {
			\ 'do': 'yarn install',
			\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-liquid'
Plug 'ap/vim-css-color'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
" Vim LSP
Plug 'neovim/nvim-lspconfig'
" Nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/nvim-compe'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
" ncim-tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Maximizer
Plug 'szw/vim-maximizer'
" Trouble
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" indentLine
Plug 'Yggdroot/indentLine'
" Vim Inspector
Plug 'puremourning/vimspector'

" Toml files syntax
Plug 'cespare/vim-toml'

" Startup screen
Plug 'mhinz/vim-startify'

" Initialize plugin system
call plug#end()
colorscheme gruvbox
set completeopt=menu,menuone,noselect
let g:vimspector_enable_mappings = 'HUMAN'
"
"""""VIM LSP"""""
lua << EOF
local nvim_lsp = require('lspconfig')
require('nvim-cmp')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 
	"pyright",
	"intelephense",
	"cssls", 
	"vuels",
	"tsserver",
	"tailwindcss",
	"html",
	"vimls"
	}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
			},
		capabilities = capabilities,
		}
end
EOF

" use omni completion provided by lsp
"au2tocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
" nvim-compe
"""""END VIM LSP"""""




"" Python PEP 8 indentation
au BufNewFile,BufRead *.py
			\ set tabstop=4
"						\ set softtabstop=4
			\ set shiftwidth=4
			\ set expandtab
			\ set autoindent
			\ set fileformat=unix

autocmd FileType vue setlocal ts=2 sw=2 sts=0 expandtab
autocmd FileType vue set filetype=vue.html
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType php setlocal ts=2 sw=2 expandtab ai si
autocmd FileType json setlocal ts=2 sw=2 expandtab
autocmd FileType MD, md setlocal ts=2 sw=2 expandtab
autocmd FileType liquid setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sw=2 expandtab
autocmd FileType lua setlocal ts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.rules setlocal ts=2 sw=2 expandtab syntax=javascript
