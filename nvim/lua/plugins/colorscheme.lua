return {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
    config = function()
        require('ayu').setup({
            overrides = {
                Comment = {
                    italic = true,
                },
            },
        })
        vim.cmd.colorscheme('ayu-mirage')
        vim.o.winborder = "rounded"
    end,
}

