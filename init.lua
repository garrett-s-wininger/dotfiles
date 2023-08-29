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
