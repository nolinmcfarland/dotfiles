vim.g.diagnostic_symbol = {
    error = 'x',
    warn = '▲',
    hint = '•',
    info = '•',
}

vim.diagnostic.config({
    severity_sort = true,
    float = { border = 'rounded' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = vim.g.diagnostic_symbol.error,
            [vim.diagnostic.severity.WARN] = vim.g.diagnostic_symbol.warn,
            [vim.diagnostic.severity.INFO] = vim.g.diagnostic_symbol.info,
            [vim.diagnostic.severity.HINT] = vim.g.diagnostic_symbol.hint,
        },
    },
})

