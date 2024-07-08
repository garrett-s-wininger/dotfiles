return {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    opts = {
        theme = "dracula-nvim",
    },
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font
        }
    }
}
