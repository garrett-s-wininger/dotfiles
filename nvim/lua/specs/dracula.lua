return {
    {
        "Mofiqul/dracula.nvim",
        init = function()
            vim.cmd {
                cmd = "colorscheme",
                args = { "dracula" }
           }
        end
    }
}
