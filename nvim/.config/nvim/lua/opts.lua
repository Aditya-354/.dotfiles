vim.opt.number = true
vim.opt.scrolloff = 20
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.g.maplocalleader = " "
vim.o.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- vim.api.invim_create_autocmd("TextYankPost", {
--     desc = "Highlight when yanking (copying) text",
--     group = vim.api.nvim_create_autogroup("highlight-yank", { clear = true }),
--     callback = function()
--         vim.highlight.on_yank()
--     end,
-- })

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
