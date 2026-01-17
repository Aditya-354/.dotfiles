vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.keymap.set("n", "<leader>j", "<cmd>Neotree toggle<cr>", {
  desc = "Toggle Neo-tree",
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fa", function()
  local ok, root = pcall(builtin.git_root)
  builtin.find_files({
    cwd = ok and root or vim.fn.getcwd(),
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true,
  })
end, { desc = "Find ALL files (including hidden & ignored)" })

-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Ctrl+Backspace delete previous word

-- Insert mode
vim.keymap.set("i", "<C-w>", "<C-w>", { noremap = true })

vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { desc = "Move line down" })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { desc = "Move line up" })

vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Duplicate selection down/up
vim.keymap.set("v", "<C-S-j>", "y'>pgv=gv", { desc = "Duplicate selection down" })
vim.keymap.set("v", "<C-S-k>", "y'<Pgv=gv", { desc = "Duplicate selection up" })

vim.keymap.set("n", "<C-S-j>", "yyp", { noremap = true, silent = true, desc = "Duplicate line down" })
vim.keymap.set("n", "<C-S-k>", "yyP", { noremap = true, silent = true, desc = "Duplicate line up" })

