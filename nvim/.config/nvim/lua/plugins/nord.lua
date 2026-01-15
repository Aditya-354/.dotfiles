return {
  "shaunsingh/nord.nvim",
  name = "nord",
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = true
    vim.g.nord_uniform_diff_background = true

    -- vim.cmd("colorscheme nord")
  end,
}
