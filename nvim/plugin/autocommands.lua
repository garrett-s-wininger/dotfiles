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
