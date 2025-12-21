vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

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

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
