return {
	'EdenEast/nightfox.nvim',
	name = 'nightfox',
	lazy = false,
	config = function()
		require('nightfox').setup({
			-- ...
		})

		vim.cmd.colorscheme('nightfox')
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}
