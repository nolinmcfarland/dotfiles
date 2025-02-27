local colorschemes = {
    catppuccin = {
        source = 'catppuccin/nvim',
        name = 'catppuccin',
        scheme = 'catppuccin-mocha'
    },
    nightfox = {
        source = 'EdenEast/nightfox.nvim',
        name = 'nightfox',
        scheme = 'terafox'
    },
    rosepine = {
        source = 'rose-pine/neovim',
        name = 'rose-pine',
        scheme = 'rose-pine'
    },
}

local colorscheme = colorschemes.rosepine
local hide_background = false

return {
    colorscheme.source,
    name = colorscheme.name,
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme(colorscheme.scheme)
        if hide_background then
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    end
}
