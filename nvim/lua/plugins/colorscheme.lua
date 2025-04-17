local colorschemes = {
	catppuccin = {
		source = "catppuccin/nvim",
		name = "catppuccin",
		scheme = "catppuccin-mocha",
	},
	nightfox = {
		source = "EdenEast/nightfox.nvim",
		name = "nightfox",
		scheme = "nightfox",
	},
	rosepine = {
		source = "rose-pine/neovim",
		name = "rose-pine",
		scheme = "rose-pine",
	},
	github = {
		source = "projekt0n/github-nvim-theme",
		name = "github-theme",
		scheme = "github_dark_dimmed",
	},
	dracula = {
		source = "Mofiqul/dracula.nvim",
		name = "dracula",
		scheme = "dracula",
	},
	tokyonight = {
		source = "folke/tokyonight.nvim",
		name = "tokyonight",
		scheme = "tokyonight-night",
	},
}

local colorscheme = colorschemes.tokyonight
local hide_background = false

return {
	colorscheme.source,
	name = colorscheme.name,
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme(colorscheme.scheme)
		if hide_background then
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end
	end,
}
