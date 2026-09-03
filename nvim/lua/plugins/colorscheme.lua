return {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
    config = function()
        require('ayu').setup({
            overrides = {
                LineNr = { fg = '#5f666d' },
            },
        })
        vim.cmd.colorscheme('ayu')
        vim.o.winborder = 'rounded'
    end,
}
