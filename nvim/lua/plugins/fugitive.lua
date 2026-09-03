return {
	'tpope/vim-fugitive',
	config = function()
		vim.cmd("cnoreabbrev <expr> git getcmdtype() == ':' && getcmdpos() == 4 ? 'Git' : 'git'")
	end,
}
