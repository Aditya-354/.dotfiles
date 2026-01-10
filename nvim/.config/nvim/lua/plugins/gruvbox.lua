return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000, -- load before other plugins
  config = function()
    require("gruvbox").setup({
      contrast = "soft", -- "soft", "medium", "hard"
      transparent_mode = true, -- since you like transparent bg
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
