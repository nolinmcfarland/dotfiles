return {
    'vcraescu/islands-dark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('islands-dark')
        vim.o.winborder = 'rounded'
    end,
}
