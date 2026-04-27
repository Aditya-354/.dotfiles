vim.opt.termguicolors = true


-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 20 -- keep 20 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 4 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.signcolumn = "yes" -- always show a sign column
-- vim.opt.colorcolumn = "100" -- show a column at 100 position chars
vim.opt.showmatch = true -- highlights matching brackets
vim.opt.cmdheight = 1 -- single line command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.showmode = false -- do not show the mode, instead have it in statusline
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 0 -- floating window transparency
vim.opt.conceallevel = 0 -- do not hide markup
vim.opt.concealcursor = "" -- do not hide cursorline in markup
vim.opt.lazyredraw = true -- do not redraw during macros
vim.opt.synmaxcol = 300 -- syntax highlighting limit
-- vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = true -- do create an undo file
vim.opt.undodir = undodir -- set the undo directory
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 0 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow buffer modifications
vim.opt.encoding = "utf-8" -- set encoding

vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- cursor blinking and settings

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

-- ============================================================================
-- STATUSLINE
-- ============================================================================

-- Git branch function with caching and Nerd Font icon
-- local cached_branch = ""
-- local last_check = 0
-- local function git_branch()
-- 	local now = vim.loop.now()
-- 	if now - last_check > 5000 then -- Check every 5 seconds
-- 		cached_branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
-- 		last_check = now
-- 	end
-- 	if cached_branch ~= "" then
-- 		return " \u{e725} " .. cached_branch .. " " -- nf-dev-git_branch
-- 	end
-- 	return ""
-- end
--
-- -- File type with Nerd Font icon
-- local function file_type()
-- 	local ft = vim.bo.filetype
-- 	local icons = {
-- 		lua = "\u{e620} ", -- nf-dev-lua
-- 		python = "\u{e73c} ", -- nf-dev-python
-- 		javascript = "\u{e74e} ", -- nf-dev-javascript
-- 		typescript = "\u{e628} ", -- nf-dev-typescript
-- 		javascriptreact = "\u{e7ba} ",
-- 		typescriptreact = "\u{e7ba} ",
-- 		html = "\u{e736} ", -- nf-dev-html5
-- 		css = "\u{e749} ", -- nf-dev-css3
-- 		scss = "\u{e749} ",
-- 		json = "\u{e60b} ", -- nf-dev-json
-- 		markdown = "\u{e73e} ", -- nf-dev-markdown
-- 		vim = "\u{e62b} ", -- nf-dev-vim
-- 		sh = "\u{f489} ", -- nf-oct-terminal
-- 		bash = "\u{f489} ",
-- 		zsh = "\u{f489} ",
-- 		rust = "\u{e7a8} ", -- nf-dev-rust
-- 		go = "\u{e724} ", -- nf-dev-go
-- 		c = "\u{e61e} ", -- nf-dev-c
-- 		cpp = "\u{e61d} ", -- nf-dev-cplusplus
-- 		java = "\u{e738} ", -- nf-dev-java
-- 		php = "\u{e73d} ", -- nf-dev-php
-- 		ruby = "\u{e739} ", -- nf-dev-ruby
-- 		swift = "\u{e755} ", -- nf-dev-swift
-- 		kotlin = "\u{e634} ",
-- 		dart = "\u{e798} ",
-- 		elixir = "\u{e62d} ",
-- 		haskell = "\u{e777} ",
-- 		sql = "\u{e706} ",
-- 		yaml = "\u{f481} ",
-- 		toml = "\u{e615} ",
-- 		xml = "\u{f05c} ",
-- 		dockerfile = "\u{f308} ", -- nf-linux-docker
-- 		gitcommit = "\u{f418} ", -- nf-oct-git_commit
-- 		gitconfig = "\u{f1d3} ", -- nf-fa-git
-- 		vue = "\u{fd42} ", -- nf-md-vuejs
-- 		svelte = "\u{e697} ",
-- 		astro = "\u{e628} ",
-- 	}
--
-- 	if ft == "" then
-- 		return " \u{f15b} " -- nf-fa-file_o
-- 	end
--
-- 	return ((icons[ft] or " \u{f15b} ") .. ft)
-- end
--
-- -- File size with Nerd Font icon
-- local function file_size()
-- 	local size = vim.fn.getfsize(vim.fn.expand("%"))
-- 	if size < 0 then
-- 		return ""
-- 	end
-- 	local size_str
-- 	if size < 1024 then
-- 		size_str = size .. "B"
-- 	elseif size < 1024 * 1024 then
-- 		size_str = string.format("%.1fK", size / 1024)
-- 	else
-- 		size_str = string.format("%.1fM", size / 1024 / 1024)
-- 	end
-- 	return " \u{f016} " .. size_str .. " " -- nf-fa-file_o
-- end
--
-- -- Mode indicators with Nerd Font icons
-- local function mode_icon()
-- 	local mode = vim.fn.mode()
-- 	local modes = {
-- 		n = " \u{f121}  NORMAL",
-- 		i = " \u{f11c}  INSERT",
-- 		v = " \u{f0168} VISUAL",
-- 		V = " \u{f0168} V-LINE",
-- 		["\22"] = " \u{f0168} V-BLOCK",
-- 		c = " \u{f120} COMMAND",
-- 		s = " \u{f0c5} SELECT",
-- 		S = " \u{f0c5} S-LINE",
-- 		["\19"] = " \u{f0c5} S-BLOCK",
-- 		R = " \u{f044} REPLACE",
-- 		r = " \u{f044} REPLACE",
-- 		["!"] = " \u{f489} SHELL",
-- 		t = " \u{f120} TERMINAL",
-- 	}
-- 	return modes[mode] or (" \u{f059} " .. mode)
-- end
--
-- _G.mode_icon = mode_icon
-- _G.git_branch = git_branch
-- _G.file_type = file_type
-- _G.file_size = file_size
--
-- vim.cmd([[
--   highlight StatusLineBold gui=bold cterm=bold
-- ]])
--
-- -- Function to change statusline based on window focus
-- local function setup_dynamic_statusline()
-- 	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
-- 		callback = function()
-- 			vim.opt_local.statusline = table.concat({
-- 				"  ",
-- 				"%#StatusLineBold#",
-- 				"%{v:lua.mode_icon()}",
-- 				"%#StatusLine#",
-- 				" \u{e0b1} %f %h%m%r", -- nf-pl-left_hard_divider
-- 				"%{v:lua.git_branch()}",
-- 				"\u{e0b1} ", -- nf-pl-left_hard_divider
-- 				"%{v:lua.file_type()}",
-- 				"\u{e0b1} ", -- nf-pl-left_hard_divider
-- 				"%{v:lua.file_size()}",
-- 				"%=", -- Right-align everything after this
-- 				" \u{f017} %l:%c  %P ", -- nf-fa-clock_o for line/col
-- 			})
-- 		end,
-- 	})
-- 	vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })
--
-- 	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
-- 		callback = function()
-- 			vim.opt_local.statusline = "  %f %h%m%r \u{e0b1} %{v:lua.file_type()} %=  %l:%c   %P "
-- 		end,
-- 	})
-- end
--
-- setup_dynamic_statusline()

-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

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

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

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
-- ============================================================================
-- PLUGINS (vim.pack)
-- ============================================================================
vim.pack.add({
	"https://www.github.com/lewis6991/gitsigns.nvim",
	"https://www.github.com/echasnovski/mini.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
  -- colorschemes
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/sainnhe/everforest",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/water-sucks/darkrose.nvim",
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/uhs-robert/oasis.nvim",
  "https://github.com/sainnhe/sonokai",
  "https://github.com/Mofiqul/vscode.nvim",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/ramojus/mellifluous.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/metalelf0/black-metal-theme-neovim",
  "https://github.com/shaunsingh/nord.nvim",
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
  {
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	-- Language Server Protocols
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",
})

-- STRUDEL
vim.pack.add({
    {
        src = "https://github.com/gruvw/strudel.nvim.git",
        build = "npm ci",
    },
})

local function packadd(name)
	vim.cmd("packadd " .. name)
end
packadd("nvim-treesitter")
packadd("gitsigns.nvim")
packadd("mini.nvim")
packadd("lualine.nvim")
packadd("fzf-lua")
packadd("nvim-tree.lua")
packadd("strudel.nvim")
packadd("onedark.nvim")
-- LSP
packadd("nvim-lspconfig")
packadd("mason.nvim")
packadd("gruvbox.nvim")
packadd("nord.nvim")
packadd("rose-pine")
packadd("tokyonight.nvim")
packadd("black-metal-theme-neovim")
packadd("kanagawa.nvim")
packadd("vscode.nvim")
packadd("oasis.nvim")
packadd("sonokai")
packadd("darkrose.nvim")
packadd("mellifluous.nvim")
packadd("everforest")
packadd("efmls-configs-nvim")
packadd("blink.cmp")
packadd("LuaSnip")

-- ============================================================================
-- PLUGIN CONFIGS
-- ============================================================================

-- strudel.nvim config and setup
require("strudel").setup({
        browser_exec_path = "/usr/bin/brave",
        ui = {
                maximise_menu_panel = true,
                hide_menu_panel = true,
        }
})

-- nvim-treesitter config and setup
local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({})
	local ensure_installed = {
		"vim",
		"vimdoc",
		"rust",
		"c",
		"cpp",
		"go",
		"html",
		"css",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"typescript",
		"vue",
		"svelte",
		"bash",
		"lua",
		"python",
	}

	local config = require("nvim-treesitter.config")

	local already_installed = config.get_installed()
	local parsers_to_install = {}

	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		treesitter.install(parsers_to_install)
	end

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
				vim.treesitter.start(args.buf)
			end
		end,
	})
end

setup_treesitter()

require("nvim-tree").setup({
	view = {
		width = 35,
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		group_empty = true,
	},
})
vim.keymap.set("n", "<leader>j", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })

vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeSignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#2a2a2a", bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

require("fzf-lua").setup({})

vim.keymap.set("n", "<leader>ff", function()
	require("fzf-lua").files()
end, { desc = "FZF Files" })
vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })
vim.keymap.set("n", "<leader>fb", function()
	require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })
vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })
vim.keymap.set("n", "<leader>fx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })
vim.keymap.set("n", "<leader>fX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })

require("mini.ai").setup({})
-- require("mini.comment").setup({})
-- require("mini.move").setup({})
require("mini.surround").setup({})
-- require("mini.cursorword").setup({})
require("mini.indentscope").setup({})
-- require("mini.pairs").setup({})
-- require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
-- require("mini.notify").setup({})
require("mini.icons").setup({})

require("gitsigns").setup({
	signs = {
		add = { text = "\u{2590}" }, -- ▏
		change = { text = "\u{2590}" }, -- ▐
		delete = { text = "\u{2590}" }, -- ◦
		topdelete = { text = "\u{25e6}" }, -- ◦
		changedelete = { text = "\u{25cf}" }, -- ●
		untracked = { text = "\u{25cb}" }, -- ○
	},
	signcolumn = true,
	current_line_blame = false,
})

require("mason").setup({})

vim.keymap.set("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })
vim.keymap.set("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Previous git hunk" })
vim.keymap.set("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>hB", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle inline blame" })
vim.keymap.set("n", "<leader>hd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })

-- ============================================================================
-- LSP, Linting, Formatting & Completion
-- ============================================================================
local diagnostic_signs = {
	Error = "E",
	Warn = "W",
	Hint = "H",
	Info = "I",
}

vim.diagnostic.config({
	-- virtual_text = { prefix = "●", spacing = 4 },
  virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>gd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)

	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition, opts)

	vim.keymap.set("n", "<leader>gS", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "<leader>D", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, opts)
	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float({ scope = "cursor" })
	end, opts)
	vim.keymap.set("n", "<leader>nd", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)

	vim.keymap.set("n", "<leader>pd", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	vim.keymap.set("n", "<leader>fd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)
	vim.keymap.set("n", "<leader>fr", function()
		require("fzf-lua").lsp_references()
	end, opts)
	vim.keymap.set("n", "<leader>ft", function()
		require("fzf-lua").lsp_typedefs()
	end, opts)
	vim.keymap.set("n", "<leader>fs", function()
		require("fzf-lua").lsp_document_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>fw", function()
		require("fzf-lua").lsp_workspace_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>fi", function()
		require("fzf-lua").lsp_implementations()
	end, opts)

	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
	end
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},

	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.config("pyright", {})
vim.lsp.config("bashls", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("clangd", {})

do
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")

	local fixjson = require("efmls-configs.formatters.fixjson")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	local cpplint = require("efmls-configs.linters.cpplint")
	local clangfmt = require("efmls-configs.formatters.clang_format")

	local go_revive = require("efmls-configs.linters.go_revive")
	local gofumpt = require("efmls-configs.formatters.gofumpt")

	vim.lsp.config("efm", {
		filetypes = {
			"c",
			"cpp",
			"css",
			"go",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"sh",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				c = { clangfmt, cpplint },
				go = { gofumpt, go_revive },
				cpp = { clangfmt, cpplint },
				css = { prettier_d },
				html = { prettier_d },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				lua = { luacheck, stylua },
				markdown = { prettier_d },
				python = { flake8, black },
				sh = { shellcheck, shfmt },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				vue = { eslint_d, prettier_d },
				svelte = { eslint_d, prettier_d },
			},
		},
	})
end

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"bashls",
	"ts_ls",
	"gopls",
	"clangd",
	-- "efm",
})

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================
-- vim.api.nvim_create_autocmd("TermClose", {
-- 	group = augroup,
-- 	callback = function()
-- 		if vim.v.event.status == 0 then
-- 			vim.api.nvim_buf_delete(0, {})
-- 		end
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("TermOpen", {
-- 	group = augroup,
-- 	callback = function()
-- 		vim.opt_local.number = false
-- 		vim.opt_local.relativenumber = false
-- 		vim.opt_local.signcolumn = "no"
-- 	end,
-- })
--
-- local terminal_state = { buf = nil, win = nil, is_open = false }
--
-- local function FloatingTerminal()
-- 	if terminal_state.is_open and terminal_state.win and vim.api.nvim_win_is_valid(terminal_state.win) then
-- 		vim.api.nvim_win_close(terminal_state.win, false)
-- 		terminal_state.is_open = false
-- 		return
-- 	end
--
-- 	if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
-- 		terminal_state.buf = vim.api.nvim_create_buf(false, true)
-- 		vim.bo[terminal_state.buf].bufhidden = "hide"
-- 	end
--
-- 	local width = math.floor(vim.o.columns * 0.8)
-- 	local height = math.floor(vim.o.lines * 0.8)
-- 	local row = math.floor((vim.o.lines - height) / 2)
-- 	local col = math.floor((vim.o.columns - width) / 2)
--
-- 	terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
-- 		relative = "editor",
-- 		width = width,
-- 		height = height,
-- 		row = row,
-- 		col = col,
-- 		style = "minimal",
-- 		border = "rounded",
-- 	})
--
-- 	vim.wo[terminal_state.win].winblend = 0
-- 	vim.wo[terminal_state.win].winhighlight = "Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder"
-- 	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })
--
-- 	local has_terminal = false
-- 	local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
-- 	for _, line in ipairs(lines) do
-- 		if line ~= "" then
-- 			has_terminal = true
-- 			break
-- 		end
-- 	end
-- 	if not has_terminal then
-- 		vim.fn.termopen(os.getenv("SHELL"))
-- 	end
--
-- 	terminal_state.is_open = true
-- 	vim.cmd("startinsert")
--
-- 	vim.api.nvim_create_autocmd("BufLeave", {
-- 		buffer = terminal_state.buf,
-- 		callback = function()
-- 			if terminal_state.is_open and terminal_state.win and vim.api.nvim_win_is_valid(terminal_state.win) then
-- 				vim.api.nvim_win_close(terminal_state.win, false)
-- 				terminal_state.is_open = false
-- 			end
-- 		end,
-- 		once = true,
-- 	})
-- end
--
-- vim.keymap.set("n", "<leader>t", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
-- vim.keymap.set("t", "<Esc>", function()
-- 	if terminal_state.is_open and terminal_state.win and vim.api.nvim_win_is_valid(terminal_state.win) then
-- 		vim.api.nvim_win_close(terminal_state.win, false)
-- 		terminal_state.is_open = false
-- 	end
-- end, { noremap = true, silent = true, desc = "Close floating terminal" })

-- =============================================================================================
-- THEME CONFIG
-- =============================================================================================

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = true,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

-- require("github-theme").setup({
--     options = {
--         hide_end_of_buffer = false,
--         transparent = false,
--         styles = {                 -- Style to be applied to different syntax groups
--             bold = false,
--             comments = 'NONE',       -- Value is any valid attr-list value `:help attr-list`
--             functions = 'NONE',
--             keywords = 'NONE',
--             variables = 'NONE',
--             conditionals = 'NONE',
--             constants = 'NONE',
--             numbers = 'NONE',
--             operators = 'NONE',
--             strings = 'NONE',
--             types = 'NONE',
--         },
--     }
-- })


require("darkrose").setup({
    -- Override colors
    colors = {
        -- orange = "#F87757",
    },
    -- Override existing or add new highlight groups
    transparent_background = true,
    -- overrides = function(c)
    --     return {
    --         -- Type = { fg = "#aa67ca" },
    --         String = { fg = "#9a8000" },
    --         ["@string"] = { fg = "#9a8000" },
    --         ["@comment"] = { fg = "#7b9b9a" },
    --         Comment = { fg = "#7b9b9a" },
    --         CursorLine = { bg = "#1a1a1a" },
    --     }
    -- end,
    -- Styles to enable or disable
    styles = {
        bold = false, -- Enable bold highlights for some highlight groups
        italic = false, -- Enable italic highlights for some highlight groups
        underline = true, -- Enable underline highlights for some highlight groups
    },
})

-- Lua
require('onedark').setup  {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none',
        Methods = 'none',
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

require("mellifluous").setup({
    styles = {
        main_keywords = { bold = false },
    },
    mellifluous = {
        neutral = true,
    },
})

require("lualine").setup({
    options = {
        icons_enabled = true,
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

-- Set options before loading the scheme
vim.g.sonokai_style = 'default'
vim.g.sonokai_enable_italic = 0
vim.g.sonokai_better_performance = 1
vim.keymap.set("n", "<leader>tt", require("oasis").toggle_transparency, { desc = "Toggle Transparency" })

-- Oasis.nvim
-- Styles: "night", "midnight", "abyss", "starlight", "desert", "sol", "canyon", "dune", "cactus", "mirage", "lagoon", "twilight", "rose"
require("oasis").setup({
  style = "lagoon",                     -- Primary style, the default used when colorscheme is set to "oasis"
  dark_style = nil,                     -- Applies to primary style only: Overrides dark mode with another theme (e.g., "abyss")
  light_style = nil,                    -- Applies to primary style only: Overrides light mode with another theme (e.g., "dune")
  light_intensity = 3,                  -- Light background intensity (1-5): 1=subtle, 5=saturated
  use_legacy_comments = false,          -- For "desert" style only, uses the loud skyblue comment color from desert.vim for a more retro experience
  themed_syntax = true,                 -- Uses the theme's primary color for statements/keywords. Set to false for the classic yellow syntax from desert.vim for a more retro experience

  -- Text styling - toggle individual styles
  styles = {
    bold = false,                        -- Enable bold text (keywords, functions, etc.)
    italic = false,                      -- Enable italics (comments, certain keywords)
    underline = true,                   -- Enable underlined text (matching words)
    undercurl = true,                   -- Enable undercurl for diagnostics/spelling
    strikethrough = true,               -- Enable strikethrough text (deprecations)
  },

  -- Display options
  transparent = false,                  -- Set to true for transparent backgrounds (bye-bye theme backgrounds)
  terminal_colors = true,               -- Apply Oasis colors to Neovim's built-in terminal
  match_paren_bg = false,               -- Enable/disable background on MatchParen highlight

  -- Contrast controls (WCAG: AA = 4.5, AAA = 7.0)
  contrast = {
    -- Note: Light themes obey the targets below. All dark themes target 7.0 by default with only a couple of exceptions that dip to 6.5.
    min_ratio = 5.8,                    -- Clamp 4.5–7.0; target contrast for syntax/terminal colors. Increase for more contrast, decrease for more pop.
    force_aaa = false,                  -- When true, forces AAA (7.0) wherever possible; as a result some colors will appear muddy (bye bye non-primary colors).
  },

  palette_overrides = {},               -- Override colors in specific palettes
  highlight_overrides = {},             -- Override specific highlight groups

  -- Plugin integrations
  integrations = {
    default_enabled = true,             -- Default behavior: true = enable all, false = disable all
    -- For each plugin: nil = use default_enabled, true = enable, false = disable
    plugins = {
      fzf_lua = nil,
      gitsigns = nil,
      lazy = nil,
      mini = nil,
      render_markdown = nil,
      snacks = nil,
      which_key = nil,
    },
  },
})

-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false},
    statementStyle = { bold = false },
    typeStyle = { bold = false},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none",
                }
            }
        }
    }
})

-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = true
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = false

require("tokyonight").setup({
    style = "night",
    transparent = false,
    styles = {
        functions = {},
        comments = { italic = false },
        keywords = { italic = false },
        variables = {},
    },
})

require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = false,
        italic = false,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    palette = {
        -- Override the builtin palette per variant
        -- moon = {
        --     base = '#18191a',
        --     overlay = '#363738',
        -- },
    },

	-- NOTE: Highlight groups are extended (merged) by default. Disable this
	-- per group via `inherit = false`
    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- StatusLine = { fg = "love", bg = "love", blend = 15 },
        -- VertSplit = { fg = "muted", bg = "muted" },
        -- Visual = { fg = "base", bg = "text", inherit = false },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})

require("black-metal").setup({
  -----MAIN OPTIONS-----
  --
  -- Can be one of: bathory | burzum | dark-funeral | darkthrone | 
  -- emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
  theme = "burzum",
  cursorline_gutter = true,
  -- If true, highlights the gutter darker than the bg
  dark_gutter = false,
  -- if true favor treesitter highlights over semantic highlights
  favor_treesitter_hl = false,
  -- Don't set background of floating windows. Recommended for when using floating
  -- windows with borders.
  plain_float = false,
  -- Show the end-of-buffer character
  show_eob = true,
  -- If true, enable the vim terminal colors
  term_colors = true,
  -- Keymap (in normal mode) to toggle between light and dark variants.
  toggle_variant_key = "<leader>bt",
  -- Don't set background
  transparent = true,
  alt_bg = false,

  diagnostics = {
    darker = true, -- Darker colors for diagnostic
    undercurl = true, -- Use undercurl for diagnostics
    background = true, -- Use background color for virtual text
  },
  -- The following table accepts values the same as the `gui` option for normal
  -- highlights. For example, `bold`, `italic`, `underline`, `none`.
  code_style = {
    comments = "italic",
    conditionals = "none",
    functions = "none",
    keywords = "none",
    headings = "none", -- Markdown headings
    operators = "none",
    keyword_return = "none",
    strings = "none",
    variables = "none",
  },

  -- The following options allow for more control over some plugin appearances.
  plugin = {
    lualine = {
      -- Bold lualine_a sections
      bold = true,
      -- Don't set section/component backgrounds. Recommended to not set
      -- section/component separators.
      plain = false,
    },
    cmp = { -- works for nvim.cmp and blink.nvim
      -- Don't highlight lsp-kind items. Only the current selection will be highlighted.
      plain = false,
      -- Reverse lsp-kind items' highlights in blink/cmp menu.
      reverse = false,
    },
  },
})

local function set_transparent() -- set UI component to transparent
	local groups = {
		"Normal",
		"NormalNC",
		"EndOfBuffer",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"ColorColumn",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

-- Can be one of: bathory | burzum | dark-funeral | darkthrone | 
-- emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "darkthrone",
--     callback = function()
--         local hl_groups = {
--             "Normal",
--             "NormalFloat",
--             "SignColumn",
--             "NormalNC", -- background for non-current windows
--             "EndOfBuffer",
--             "MsgArea",
--             "FloatBorder",
--             "StatusLine",
--             "StatusLineNC",
--             "ColorColumn",
--             "TabLine",
--             "TabLineFill",
--             "TabLineSel",
--         }
--         for _, group in ipairs(hl_groups) do
--             vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
--         end
--     end,
-- })

vim.cmd("colorscheme burzum")

set_transparent()

