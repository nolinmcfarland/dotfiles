return {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
    config = function()
        require('ayu').setup({})
        vim.cmd.colorscheme('ayu')
        vim.o.winborder = 'rounded'
    end,
}
