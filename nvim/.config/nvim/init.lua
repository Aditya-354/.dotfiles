require("opts")

-- Lazy.nvim 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lua/plugins
require("lazy").setup("plugins")

vim.api.nvim_set_hl(0, "LineNr", { fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f9e2af", bold = true })

-- If using relativenumber
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#a6adc8" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#a6adc8" })

require("keymaps")

