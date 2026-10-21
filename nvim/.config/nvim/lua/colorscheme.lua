-- require("themes.tokyonight")
-- require("themes.rosepine")
-- require("themes.nightfox")
-- require("themes.onedark")
-- require("themes.catppuccin")
-- require("themes.kanagawa")
-- require("themes.gruvbox")
-- require("themes.vague")
-- require("themes.alabaster")
-- require("themes.evergarden")

local term = os.getenv("TERM")
if term == "xterm-kitty" then
    require("themes.nord")
end

if term == "xterm-ghostty" then
    require("themes.unokai")
end
