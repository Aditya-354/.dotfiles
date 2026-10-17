vim.pack.add({
    "https://github.com/evergardentheme/nvim"
})

require('evergarden').setup {
  theme = {
    variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
    accent = 'green',
  },
  editor = {
    transparent_background = true,
    override_terminal = true,
    sign = { color = 'none' },
    float = {
      color = 'none',
      solid_border = false,
    },
    completion = {
      color = 'surface0',
    },
  },
  style = {
    tabline = { 'reverse' },
    search = { 'reverse' },
    incsearch = { 'reverse' },
    types = {},
    keyword = {},
    comment = {},
  },
  integrations = {
      blink_cmp = true,
      fzf_lua = true,
      gitsigns = true
  },
}

vim.cmd("colorscheme evergarden")
