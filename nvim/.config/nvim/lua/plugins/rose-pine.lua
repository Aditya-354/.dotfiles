return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,
  config = function()
    require("rose-pine").setup({
      variant = "main", -- main, moon, dawn
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = true,
      disable_float_background = true,
      disable_italics = false,

      styles = {
        italic = true,
        transparency = true,
      },

      highlight_groups = {
        -- Example tweaks:
        Comment = { italic = true },
        Keyword = { italic = true },
      },
    })

    -- vim.cmd("colorscheme rose-pine")
  end,
}
