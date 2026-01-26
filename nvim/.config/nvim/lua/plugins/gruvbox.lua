return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "soft", -- "soft", "medium", "hard"
      bold = false,
      transparent_mode = true, -- since you like transparent bg
    })
    -- vim.cmd("colorscheme gruvbox")
  end,
}
