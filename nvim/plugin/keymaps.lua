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
