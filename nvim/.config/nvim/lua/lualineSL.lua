local lualine = require("lualine")
local transparent_theme = require("lualine.themes.auto")

transparent_theme.normal.c.bg = 'NONE'
transparent_theme.normal.c.fg = 'NONE'
transparent_theme.insert.c.bg = 'NONE'
transparent_theme.insert.c.fg = 'NONE'
transparent_theme.command.c.bg = 'NONE'
transparent_theme.command.c.fg = 'NONE'
transparent_theme.replace.c.fg = 'NONE'
transparent_theme.visual.c.bg = 'NONE'
transparent_theme.visual.c.fg = 'NONE'
-- transparent_theme.inactive.c.bg = 'NONE'

lualine.setup({
    options = {
        icons_enabled = true,
        -- theme = transparent_theme,
        theme = 'auto',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' };
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})

return lualine
