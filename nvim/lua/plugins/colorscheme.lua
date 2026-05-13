return {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
    config = function()
        require('ayu').setup({
            overrides = {
                Comment = {
                    italic = false,
                },
            },
        })
        vim.cmd.colorscheme('ayu-mirage')
    end,
}

