-- Leader Overrides to Correctly Handle Plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- State that we Have a Nerd Font Installed, Allow Skipping of Icons
vim.g.have_nerd_font = true

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
