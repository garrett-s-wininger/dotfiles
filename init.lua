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

-- Plugin requests
local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Fuzzy finding
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.2'})

-- Git integration
Plug 'tpope/vim-fugitive'

vim.call('plug#end')
-- End plugin requests

-- Telescope configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
