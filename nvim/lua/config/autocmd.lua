vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Add Xcode-style author info to the top of new Swift files",
	pattern = "*.swift",
	callback = function()
		if vim.api.nvim_buf_line_count(0) > 1 or vim.api.nvim_get_current_line() ~= "" then
			return
		end
		local filename = vim.fn.expand("%:t")
		local author = vim.fn.system("git config user.name"):gsub("\n", "")
		local date = os.date("%m/%d/%y")
		local lines = {
			"//",
			"//  " .. filename,
			"//",
			"//",
			"//  Created by " .. author .. " on " .. date .. ".",
			"//",
			"",
		}

		vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
	end,
})
