return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',

	dependencies = {
		'nvim-lua/plenary.nvim'
	},

	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')

		-- Project file
		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

		-- Git file
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})

		-- Project search
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({
				search = vim.fn.input("Grep > ")
			})
		end)
	end
}

