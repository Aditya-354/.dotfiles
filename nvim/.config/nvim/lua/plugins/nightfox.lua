-- ~/.config/nvim/lua/plugins/nightfox.lua
return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,      -- load during startup (so colorscheme is available)
    priority = 1000,   -- load before most other plugins
    opts = {
      -- Pick ONE default flavor here:
      -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
      fox = "nightfox",

      -- Terminal colors
      terminal_colors = true,

      -- If you want a transparent background (common on Hyprland rices 😄)
      transparent = true,

      -- Dim inactive windows a bit
      dim_inactive = false,

      -- Styling options for syntax groups
      styles = {
        comments = "italic",
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },

      -- Per-plugin integrations ("modules")
      -- Keep these on if you use the plugins.
      modules = {
        -- note: exact supported list depends on nightfox version,
        -- but these are common and safe.
        cmp = true,
        gitsigns = true,
        -- telescope = true,
        -- treesitter = true,
        -- lsp_semantic_tokens = true,

        -- If you use any of these, flip to true:
        -- native_lsp = true, -- (older configs used this; nightfox now uses semantic tokens + highlights)
        -- whichkey = true,
        -- hop = true,
        -- indent_blankline = true,
        -- mini = true,
        -- neogit = true,
        -- notify = true,
        -- nvimtree = true,
      },

      -- You can override palettes per fox.
      -- Example: tweak backgrounds/accents slightly.
      palettes = {
        -- nightfox = { bg0 = "#..." }
      },

      -- Override highlight groups globally or per-fox
      groups = {
        -- nightfox = { Normal = { bg = "NONE" } }
      },

      -- Extra highlight overrides (runs last)
      -- Great for transparency and small fixes.
      options = {
        -- When transparent=true, Nightfox sets some backgrounds;
        -- you can still force more groups to be transparent here.
        -- (Leave empty if you don't need.)
      },
    },

    config = function(_, opts)
      require("nightfox").setup(opts)

      -- Apply your chosen theme
      -- vim.cmd.colorscheme(opts.fox)

      -- Handy: quick theme switching via :Nightfox <name>
      -- Example: :Nightfox carbonfox
      vim.api.nvim_create_user_command("Nightfox", function(cmd)
        local name = cmd.args
        if name == nil or name == "" then
          vim.notify("Usage: :Nightfox <nightfox|dawnfox|duskfox|dayfox|nordfox|terafox|carbonfox>")
          return
        end
        -- set and apply
        vim.g.colors_name = nil
        -- vim.cmd.colorscheme(name)
      end, { nargs = 1, complete = function()
        return {
          "nightfox",
          "dayfox",
          "dawnfox",
          "duskfox",
          "nordfox",
          "terafox",
          "carbonfox",
        }
      end })

      -- Optional: a couple of nice default overrides (uncomment if wanted)
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    end,
  },
}
