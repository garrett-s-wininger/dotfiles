-- Standard formatting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0

vim.cmd [[
au BufRead,BufNewFile *.java setlocal tabstop=2 shiftwidth=2
]]

-- Editor configuration
vim.opt.splitbelow = true

-- Plugin requests
local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Fuzzy finding
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.2' })

-- Git integration
Plug 'tpope/vim-fugitive'

-- LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

-- Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

-- LSP setup
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v2.x' })

-- Colorscheme
Plug 'catppuccin/nvim'

vim.call('plug#end')
-- End plugin requests

-- Telescope configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- LSP Configuration
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()

-- Colorscheme override
vim.cmd [[ colorscheme catppuccin-mocha ]]
