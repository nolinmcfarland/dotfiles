vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.mouse = ""
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.scrolloff = 8
vim.opt.breakindent = true
vim.opt.confirm = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Sync OS and vim clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
