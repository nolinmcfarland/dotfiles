local colorschemes = {
	catppuccin = {
		source = "catppuccin/nvim",
		name = "catppuccin",
		scheme = "catppuccin-mocha",
	},
	github = {
		source = "projekt0n/github-nvim-theme",
		name = "github-theme",
		scheme = "github_dark",
	},
	tokyonight = {
		source = "folke/tokyonight.nvim",
		name = "tokyonight",
		scheme = "tokyonight-night",
	},
    onedark = {
        source = "navarasu/onedark.nvim",
        name = "onedark",
        scheme = "onedark",
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
    }
}

local colorscheme = colorschemes.rosepine
local hide_background = true

return {
	colorscheme.source,
	name = colorscheme.name,
	lazy = false,
	priority = 1000,
	config = function()
        require("rose-pine").setup({
            styles = {
                bold = true,
                italic = false,
                transparency = false,
            },
        })

		vim.cmd.colorscheme(colorscheme.scheme)

		if hide_background then
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end
	end,
}
