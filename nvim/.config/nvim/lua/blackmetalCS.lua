local blackmetal = require("black-metal")
blackmetal.setup({
  -----MAIN OPTIONS-----
  --
  -- Can be one of: bathory | burzum | dark-funeral | darkthrone | 
  -- emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
  theme = "burzum",
  cursorline_gutter = true,
  -- If true, highlights the gutter darker than the bg
  dark_gutter = false,
  -- if true favor treesitter highlights over semantic highlights
  favor_treesitter_hl = false,
  -- Don't set background of floating windows. Recommended for when using floating
  -- windows with borders.
  plain_float = false,
  -- Show the end-of-buffer character
  show_eob = true,
  -- If true, enable the vim terminal colors
  term_colors = true,
  -- Keymap (in normal mode) to toggle between light and dark variants.
  toggle_variant_key = "<leader>bt",
  -- Don't set background
  transparent = true,
  alt_bg = false,

  diagnostics = {
    darker = true, -- Darker colors for diagnostic
    undercurl = true, -- Use undercurl for diagnostics
    background = true, -- Use background color for virtual text
  },
  -- The following table accepts values the same as the `gui` option for normal
  -- highlights. For example, `bold`, `italic`, `underline`, `none`.
  code_style = {
    comments = "none",
    conditionals = "none",
    functions = "none",
    keywords = "none",
    headings = "none", -- Markdown headings
    operators = "none",
    keyword_return = "none",
    strings = "none",
    methods = "none",
    variables = "none",
  },

  -- The following options allow for more control over some plugin appearances.
  plugin = {
    lualine = {
      -- Bold lualine_a sections
      bold = true,
      -- Don't set section/component backgrounds. Recommended to not set
      -- section/component separators.
      plain = false,
    },
    cmp = { -- works for nvim.cmp and blink.nvim
      -- Don't highlight lsp-kind items. Only the current selection will be highlighted.
      plain = false,
      -- Reverse lsp-kind items' highlights in blink/cmp menu.
      reverse = false,
    },
  },
})

return blackmetal
