-- lua/plugins/catppuccin.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          funtions = {},
          keywords = { "italic" },
          strings = {},
          variables = {},
        },
        transparent_background = true,
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },
}

