return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.config").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      auto_install = true,
      ensure_installed = {
        "lua",
        "cpp",
        "c",
        "rust",
        "html",
        "css",
        "javascript",
      },
    })
  end,
}

