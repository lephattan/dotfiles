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
" Vim LSP
Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/nvim-compe'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
" vim-dirvish
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

let g:vimspector_enable_mappings = 'HUMAN'
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

"""""VIM LSP"""""
lua << EOF
local nvim_lsp = require('lspconfig')

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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = { 
	"pyright",
	--"pylsp",
	"intelephense",
	"cssls", 
	"vuels",
	"tsserver",
	"tailwindcss",
	"html"
	}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
			}
		}
end
require'lspconfig'.cssls.setup {
	capabilities = capabilities,
	}
EOF

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
" nvim-compe
"""""END VIM LSP"""""



"" My shortcuts
""""""""""""""""""""""Telescope"""""""""""""""""""""""""""
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <leader>e :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>s :so ~/.config/nvim/init.vim<CR>
" Quick save
nnoremap <leader>w :w<CR>
" Quick quit
nnoremap <leader>q :q<CR>
" Quick slipt
nnoremap <leader>vs :vs<CR>
" Quick search and replace
nnoremap <c-h> :%s///g<left><left><left>
" Search current selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Resize shortcuts
nnoremap <leader>m :MaximizerToggle<CR>
"nnoremap <leader>m :MaximizerToggle<CR>gv 

nnoremap <silent> <leader>1 :exe "vertical resize ".&columns*1/10<cr>
nnoremap <silent> <leader>2 :exe "vertical resize ".&columns*1/5<cr>
nnoremap <silent> <leader>5 :exe "vertical resize ".&columns*1/2<cr>
nnoremap <silent> <leader>3 :exe "vertical resize ".&columns*3/10<cr>
nnoremap <silent> <leader>7 :exe "vertical resize ".&columns*7/10<cr>
nnoremap <silent> <leader>8 :exe "vertical resize ".&columns*8/10<cr>
nnoremap <leader>+ :resize +5<cr>
nnoremap <leader>- :resize -5<cr>

" CocCommand shortcut
"nnoremap <C-p> :CocCommand<CR>
" CocFileExplorer
"nnoremap <leader>b :CocCommand explorer<CR>
"nnoremap <leader>f :CocCommand explorer --preset floating<CR>

"" Python PEP 8 indentation
au BufNewFile,BufRead *.py
			\ set tabstop=4
"						\ set softtabstop=4
			\ set shiftwidth=4
			\ set expandtab
			\ set autoindent
			\ set fileformat=unix

"set updatetime=1000
"autocmd CursorHold * silent! lua vim.lsp.diagnostic.show_line_diagnostics()
"autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
autocmd FileType vue setlocal ts=2 sw=2 sts=0 expandtab
autocmd FileType vue set filetype=vue.html
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType php setlocal ts=2 sw=2 expandtab ai si
autocmd FileType json setlocal ts=2 sw=2 expandtab
autocmd FileType MD, md setlocal ts=2 sw=2 expandtab
autocmd FileType liquid setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.rules setlocal ts=2 sw=2 expandtab syntax=javascript
