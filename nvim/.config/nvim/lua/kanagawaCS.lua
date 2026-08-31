local kanagawa = require("kanagawa")
kanagawa.setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = {},
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    theme = {
        all = {
            ui = {
                bg_gutter = "none",
            },
        },
    },
})

return kanagawa
