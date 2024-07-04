return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        signs = false
    },
    config = function()
        vim.keymap.set(
            "n",
            "]t",
            function()
                require("todo-comments").jump_next()
            end
        )
        vim.keymap.set(
            "n",
            "[t",
            function()
                require("todo-comments").jump_prev()
            end
        )
    end
}
