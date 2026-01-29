return {
  "Mofiqul/dracula.nvim",
  priority = 1000,
  config = function()
    require("dracula").setup({
      transparent_bg = true,
      italic_comment = true,
      overrides = {
          Function = { italic = true },
          -- Keyword = { italic = true },
          -- Type = { fg = "#ff6e6e" },
          -- Identifier = { italic = true },
          -- ["@variable"] = { italic = true },
          Comment = { fg = "#6272a4", italic = true },
      },
    })

    vim.cmd.colorscheme("dracula")

    -- 🔴 Override LSP semantic tokens (clangd controls C++ colors)
    local red = "#ff6e6e"
    local blue = "#8BE9FD"
    -- local pinkish = "#916C6C"
    -- vim.api.nvim_set_hl(0, "@keyword", { fg = red })
    -- vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = red })
    -- vim.api.nvim_set_hl(0, "@lsp.type.macro", { fg = pinkish })
    vim.api.nvim_set_hl(0, "@lsp.type.keyword", { fg = red })
    -- vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = red })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = blue })

    vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = red })
    vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = red })
  end,
}

