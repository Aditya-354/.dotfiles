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
            disable_italics = true,

            styles = {
                bold = false,
                -- italic = true,
                transparency = true,
            },

            highlight_groups = {
                -- Example tweaks:
                -- Comment = { italic = true },
                -- Keyword = { italic = true },
                -- Type = { fg = "#ff6e6e" },
            },
        })

        vim.cmd("colorscheme rose-pine")
        -- vim.api.nvim_set_hl(0, "@lsp.type.keyword", { fg = red })
        -- vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = pinkish })
    end,
}
