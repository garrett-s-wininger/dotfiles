-- Leader Overrides to Correctly Handle Plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Fallback Colorscheme for < v0.10.0 Installs
if (vim.fn.has("nvim-0.10") == 0) then
    vim.cmd {
        cmd = "colorscheme",
        args = { "habamax" }
    }
end

-- Autocommand - Highlight on Yanked Text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight after text copying",
    group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

-- Autocommand - Disable Lines in Terminal Mode
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Disable line number in terminal mode",
    group = vim.api.nvim_create_augroup("no-term-numbers", { clear = true }),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end
})

-- Lazy NVim Configuration (Plugin Manager)
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path,
    })
end

vim.opt.rtp:prepend(lazy_path)

-- Load Plugins Specifications from the 'Plugins' Module
require("lazy").setup(
    "plugins",
    {
        ui = {
            icons = vim.g.have_nerd_font and {} or {
                cmd = '⌘',
                config = '🛠',
                event = '📅',
                ft = '📂',
                init = '⚙',
                keys = '🗝',
                plugin = '🔌',
                runtime = '💻',
                require = '🌙',
                source = '📄',
                start = '🚀',
                task = '📌',
                lazy = '💤 '
            }
        }
    }
)
