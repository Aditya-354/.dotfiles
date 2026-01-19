return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- works better with treesitter
      enable_check_bracket_line = false,
      ignored_next_char = "[%w%.]",
      disable_in_macro = true,
    })
  end,
}
