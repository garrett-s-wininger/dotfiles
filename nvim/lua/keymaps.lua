-- State that we Have a Nerd Font Installed, Allow Skipping of Icons
vim.g.have_nerd_font = true

-- Kebinding - Easily Remove Search Highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinding - Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Keybinding - Navigate Different Windows/Panes
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- Keybinding - Resize Panes
vim.keymap.set("n", "<M-h>", "<C-w>3<")
vim.keymap.set("n", "<M-j>", "<C-w>3-")
vim.keymap.set("n", "<M-k>", "<C-w>3+")
vim.keymap.set("n", "<M-l>", "<C-w>3>")

-- Generic NVim Options and Default Language Presets
vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
