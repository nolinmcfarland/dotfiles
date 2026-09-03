return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'go', 'lua' },
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
