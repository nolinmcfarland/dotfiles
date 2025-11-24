vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.signcolumn_diagnostics = true
vim.g.diagnostic_symbol = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
}

-- Remap <C-c> delay in SQL files
vim.g.ftplugin_sql_omni_key = "<C-j>"
