vim.pack.add({
    "https://github.com/shaunsingh/nord.nvim"
})

-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = true
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = false

vim.cmd("colorscheme nord")
