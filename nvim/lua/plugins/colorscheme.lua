local colorschemes = {
	github = {
		source = "projekt0n/github-nvim-theme",
		name = "github-theme",
		scheme = "github_dark_high_contrast",
	},
	onedark = {
		source = "navarasu/onedark.nvim",
		name = "onedark",
		scheme = "onedark",
	},
	nightfox = {
		source = "EdenEast/nightfox.nvim",
		name = "nightfox",
		scheme = "terafox",
	},
}

local colorscheme = colorschemes.github
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
