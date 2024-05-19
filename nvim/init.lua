-- Basic configs for neovim 0.10+ that is suitable to use on VPS / Remote servers
-- Place this file in ~/.config/nvim/init.lua
local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd

opt.laststatus = 3 -- global statusline

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

g.mapleader = " "

vim.cmd.colorscheme("slate")

-------------------------------------------------------------

-- allows quit all buffers without saving
vim.api.nvim_create_user_command("Q", "qa<bang>", {
	bang = true,
})

-- Highlight yank text
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
	desc = "Highlight yank text",
})

-------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		init = function()
			vim.treesitter.language.register("twig", "nunjucks")
			-- vim.treesitter.language.register("glimmer", "handlebars")
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "vim", "javascript", "html", "css", "json" },
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "+",
						node_incremental = "+",
						scope_incremental = ")",
						node_decremental = "_",
					},
				},

				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		init = function()
			--
		end,
		opts = function()
			--
		end,
		config = function(_, opts)
			require("nvim-tree").setup({})
		end,
	},
})
