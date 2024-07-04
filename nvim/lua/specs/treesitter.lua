return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "luadoc", "vim", "vimdoc" },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = {}
        },
        indent = { enable = true, disable = {} }
    },
    config = function(_, opts)
        require("nvim-treesitter.install").prefer_git = true
        require("nvim-treesitter.configs").setup(opts)
    end
}
