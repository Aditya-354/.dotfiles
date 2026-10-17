local map = vim.keymap.set
local keymap_opts = { noremap = true, silent = true }

-- better movement in wrapped text
map("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
map("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

map("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<leader>le", ":lsp enable<CR>", { desc = "Enable LSP support" })
map("n", "<leader>ld", ":lsp disable<CR>", { desc = "Disable LSP support" })
map("n", "<leader>lp", ":LivePreview start<CR>", { desc = "Start live preview" })
map("i", "<C-BS>", "<C-w>", { desc = "Delete word" })

map("n", "<leader>sl", ":StrudelLaunch<CR>", { desc = "Launch strudel" })
map("n", "<leader>su", ":StrudelUpdate<CR>", { desc = "Update strudel" })
map("n", "<leader>ss", ":StrudelStop<CR>", { desc = "Stop strudel" })
map("n", "<leader>sq", ":StrudelQuit<CR>", { desc = "Quit strudel" })

map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

map("n", "<leader>tt", ":!date<CR>", { desc = "Display date and time" })

map("n", "<leader>j", ":Ex<CR>", { desc = "Open netrw" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("n", "<leader>v", ":Vex<CR>", { desc = "Split window vertically" })
map("n", "<leader>h", ":Hex<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

map("n", "<leader>,", "<Cmd>BufferPrevious<CR>", keymap_opts)
map("n", "<leader>.", "<Cmd>BufferNext<CR>", keymap_opts)
map("n", "<leader><", "<Cmd>BufferMovePrevious<CR>", keymap_opts)
map("n", "<leader>>", "<Cmd>BufferMoveNext<CR>", keymap_opts)

map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", keymap_opts)
map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", keymap_opts)
map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", keymap_opts)
map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", keymap_opts)
map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", keymap_opts)
map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", keymap_opts)
map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", keymap_opts)
map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", keymap_opts)
map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", keymap_opts)
map("n", "<leader>0", "<Cmd>Bufferlast<CR>", keymap_opts)

map("n", "<leader>k", "<Cmd>BufferClose<CR>", keymap_opts)

-- Hyprland
map("n", "<A-u>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-i>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-u>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-i>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Niri 
map("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

map("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

map("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

