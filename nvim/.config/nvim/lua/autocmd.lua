-- ============================================================================
-- AUTOCMDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then -- except in diff mode
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "default",
    callback = function()
        local hl_groups = {
            "Normal",
            "NormalFloat",
            "SignColumn",
            "NormalNC", -- background for non-current windows
            "EndOfBuffer",
            "MsgArea",
            "FloatBorder",
            "StatusLine",
            "StatusLineNC",
            "ColorColumn",
            "TabLine",
            "TabLineFill",
            "TabLineSel",
            "LineNr",
            "Cursor",
            "CursorLine",
            "CursorLineNr",
        }
        for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "tokyonight",
    callback = function()
        local hl_groups = {
            "Normal",
            "NormalFloat",
            "SignColumn",
            "NormalNC", -- background for non-current windows
            "EndOfBuffer",
            "MsgArea",
            "FloatBorder",
            "StatusLine",
            "StatusLineNC",
            -- "ColorColumn",
            "TabLine",
            "TabLineFill",
            "TabLineSel",
            "LineNr",
            "Cursor",
            "CursorLine",
            "CursorLineNr",
        }
        for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "rose-pine-moon",
    callback = function()
        local hl_groups = {
            "Normal",
            "NormalFloat",
            "SignColumn",
            "NormalNC", -- background for non-current windows
            "EndOfBuffer",
            "MsgArea",
            "FloatBorder",
            "StatusLine",
            "StatusLineNC",
            "ColorColumn",
            "TabLine",
            "TabLineFill",
            "TabLineSel",
            "LineNr",
            "Cursor",
            "CursorLine",
            "CursorLineNr",
        }
        for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
        vim.opt.cursorline = false
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "oxocarbon",
    callback = function()
        local hl_groups = {
            "Normal",
            "NormalFloat",
            "SignColumn",
            "NormalNC", -- background for non-current windows
            "EndOfBuffer",
            "MsgArea",
            "FloatBorder",
            "StatusLine",
            "StatusLineNC",
            "ColorColumn",
            "TabLine",
            "TabLineFill",
            "TabLineSel",
            "LineNr",
            "Cursor",
            "CursorLine",
            "CursorLineNr",
        }
        for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
            vim.api.nvim_set_hl(0, "Comment", { fg = "#9d858f" })
            vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "sonokai",
    callback = function()
        local hl_groups = {
            "Normal",
            "NormalFloat",
            "SignColumn",
            "NormalNC", -- background for non-current windows
            "EndOfBuffer",
            "MsgArea",
            "FloatBorder",
            "StatusLine",
            "StatusLineNC",
            "ColorColumn",
            "TabLine",
            "TabLineFill",
            "TabLineSel",
            "LineNr",
            "Cursor",
            "CursorLine",
            "CursorLineNr",
        }
        for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
            vim.api.nvim_set_hl(0, "Comment", { fg = "#9d858f" })
            vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "ashen",
    callback = function()
        local hl_groups = {
            "Normal",
            "NormalFloat",
            "SignColumn",
            "NormalNC", -- background for non-current windows
            "EndOfBuffer",
            "MsgArea",
            "FloatBorder",
            "StatusLine",
            "StatusLineNC",
            "ColorColumn",
            "TabLine",
            "TabLineFill",
            "TabLineSel",
            "LineNr",
            "Cursor",
            "CursorLine",
            "CursorLineNr",
        }
        for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
            vim.api.nvim_set_hl(0, "Comment", { fg = "#9d858f" })
            vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "none", ctermbg = "none" })
        vim.api.nvim_set_hl(0, "TabLine", { bg = "none", ctermbg = "none" })
        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", ctermbg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", ctermbg = "none" })
        vim.api.nvim_set_hl(0, "Cursor", { bg = "none", ctermbg = "none" })
        -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#3c3c5f", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "none" })
    end,
})

local NeoTreeGroups = {
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeSignColumn",
    "NeoTreeStatusLine",
    "NeoTreeStatusLineNC",
    "NeoTreeVertSplit",
    "NeoTreeWinSeparator",
}

for _, group in ipairs(NeoTreeGroups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "oxocarbon",
    callback = function()
        local hl_groups = vim.fn.getcompletion("", "highlight")
        for _, group in ipairs(hl_groups) do
            local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
            if hl.bold then
                hl.bold = nil
                vim.api.nvim_set_hl(0, group, hl)
            end
            if hl.italic then
                hl.italic = nil
                vim.api.nvim_set_hl(0, group, hl)
            end
        end
    end,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "tokyonight",
--     callback = function()
--         local hl_groups = vim.fn.getcompletion("", "highlight")
--         for _, group in ipairs(hl_groups) do
--             local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
--             if hl.bold then
--                 hl.bold = nil
--                 vim.api.nvim_set_hl(0, group, hl)
--             end
--             if hl.italic then
--                 hl.italic = nil
--                 vim.api.nvim_set_hl(0, group, hl)
--             end
--         end
--     end,
-- })
