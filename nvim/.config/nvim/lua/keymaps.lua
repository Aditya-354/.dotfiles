-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

local keymap_opts = { noremap = true, silent = true }

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>le", ":lsp enable<CR>", { desc = "Enable LSP support" })
vim.keymap.set("n", "<leader>ld", ":lsp disable<CR>", { desc = "Disable LSP support" })
vim.keymap.set("n", "<leader>lp", ":LivePreview start<CR>", { desc = "Start live preview" })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word" })

vim.keymap.set("n", "<leader>sl", ":StrudelLaunch<CR>", { desc = "Launch strudel" })
vim.keymap.set("n", "<leader>su", ":StrudelUpdate<CR>", { desc = "Update strudel" })
vim.keymap.set("n", "<leader>ss", ":StrudelStop<CR>", { desc = "Stop strudel" })
vim.keymap.set("n", "<leader>sq", ":StrudelQuit<CR>", { desc = "Quit strudel" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<leader>tt", ":!date<CR>", { desc = "Display date and time" })

vim.keymap.set("n", "<leader>j", ":Ex<CR>", { desc = "Open neo-tree" })
vim.keymap.set("n", "<leader>F", ":Neotree toggle<CR>", { desc = "Open neo-tree" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>v", ":Vex<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>h", ":Hex<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- vim.keymap.set("n", "<leader>,", "<Cmd>BufferPrevious<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>.", "<Cmd>BufferNext<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader><", "<Cmd>BufferMovePrevious<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>>", "<Cmd>BufferMoveNext<CR>", keymap_opts)

-- vim.keymap.set("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>0", "<Cmd>Bufferlast<CR>", keymap_opts)

-- vim.keymap.set("n", "<leader>k", "<Cmd>BufferClose<CR>", keymap_opts)

-- Hyprland
vim.keymap.set("n", "<A-u>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-i>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-u>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-i>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Niri 
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

