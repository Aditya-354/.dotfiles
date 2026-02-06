return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "soft", -- "soft", "medium", "hard"
            bold = false,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },     
            transparent_mode = true, -- since you like transparent bg
            contrast = "soft",
            overrides = {
                -- SignColumn = {bg = "#"}
            } 
        })
        vim.cmd("colorscheme gruvbox")
    end,
}
