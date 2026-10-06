return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                section_separators = {},
                component_separators = {}
            },
            sections = {
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'diagnostics',
                        symbols = {
                            error = "E",
                            warn = "W",
                            info = "I",
                            hint = "H",
                        },
                    }
                },
            },
        })
    end,
}
