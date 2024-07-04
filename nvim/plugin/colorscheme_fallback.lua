-- Fallback Colorscheme for < v0.10.0 Installs
if (vim.fn.has("nvim-0.10") == 0) then
    vim.cmd {
        cmd = "colorscheme",
        args = { "habamax" }
    }
end

