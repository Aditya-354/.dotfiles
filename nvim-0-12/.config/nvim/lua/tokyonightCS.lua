local tokyonight = require("tokyonight")
tokyonight.setup({
    transparent = false,
    styles = {
        comments = { italic = false },
        keywords = { italic = false },
    }
})

return tokyonight
