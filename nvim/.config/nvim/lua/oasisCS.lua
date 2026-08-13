-- Oasis.nvim
-- Styles: "night", "moonlight", "midnight", "abyss", "starlight", "desert", "sol", "canyon", "dune", "cactus", "mirage", "lagoon", "luna", "twilight", "rose"
local oasis = require("oasis")
oasis.setup({
  style = "moonlight",                  -- Primary style, the default used when colorscheme is set to "oasis"
  dark_style = nil,                     -- Applies to primary style only: Overrides dark mode with another theme (e.g., "abyss")
  light_style = nil,                    -- Applies to primary style only: Overrides light mode with another theme (e.g., "dune")
  light_intensity = 3,                  -- Light background intensity (1-5): 1=subtle, 5=saturated
  use_legacy_comments = false,          -- For "desert" style only, uses the loud skyblue comment color from desert.vim for a more retro experience
  themed_syntax = true,                 -- Uses the theme's primary color for statements/keywords. Set to false for the classic yellow syntax from desert.vim for a more retro experience

  -- Text styling - toggle individual styles
  styles = {
    bold = false,                        -- Enable bold text (keywords, functions, etc.)
    italic = true,                      -- Enable italics (comments, certain keywords)
    underline = true,                   -- Enable underlined text (matching words)
    undercurl = true,                   -- Enable undercurl for diagnostics/spelling
    strikethrough = true,               -- Enable strikethrough text (deprecations)
  },

  -- Display options
  transparent = false,                  -- Set to true for transparent backgrounds (bye-bye theme backgrounds)
  terminal_colors = true,               -- Apply Oasis colors to Neovim's built-in terminal
  match_paren_bg = false,               -- Enable/disable background on MatchParen highlight

  -- Contrast controls (WCAG: AA = 4.5, AAA = 7.0)
  contrast = {
    -- Note: Light themes obey the targets below. All dark themes target 7.0 by default with only a couple of exceptions that dip to 6.5.
    min_ratio = 5.8,                    -- Clamp 4.5–7.0; target contrast for syntax/terminal colors. Increase for more contrast, decrease for more pop.
    force_aaa = false,                  -- When true, forces AAA (7.0) wherever possible; as a result some colors will appear muddy (bye bye non-primary colors).
  },

  palette_overrides = {},               -- Override colors in specific palettes
  highlight_overrides = {},             -- Override specific highlight groups

  -- Plugin integrations
  integrations = {
    default_enabled = true,             -- Default behavior: true = enable all, false = disable all
    -- For each plugin: nil = use default_enabled, true = enable, false = disable
    plugins = {
      fzf_lua = nil,
      gitsigns = nil,
      lazy = nil,
      mini = nil,
      render_markdown = nil,
      snacks = nil,
      which_key = nil,
      yazi = nil,
    },
  },
})

return oasis
