local ashen = require("ashen")
ashen.setup({
    style_presets = {
        bold_functions = false,
        italic_comments = true,
    },
    transparent = true,
    force_hi_clear = false,
    terminal = {
        enabled = true,
    },
    plugins = {
        autoload = true,
    },
})

return ashen
