return {
  "Mofiqul/dracula.nvim",
  priority = 1000, -- make sure it loads before other UI plugins
  config = function()
    require("dracula").setup({
      -- You can tweak these later, keep defaults for now
      transparent_bg = true,
      italic_comment = true,

      overrides = {
        -- example: comments slightly dimmer
        Comment = { fg = "#6272a4", italic = true },
      },
    })

    -- Apply the colorscheme
    vim.cmd.colorscheme("dracula")
  end,
}
