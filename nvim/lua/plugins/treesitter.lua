return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
        local ensure_installed = {
            'c',
            'diff',
            'go',
            'lua',
            'zig',
        }
        local already_installed = require('nvim-treesitter.config').get_installed()
        local parsers_to_install = vim.iter(ensure_installed)
            :filter(function(parser)
                return not vim.tbl_contains(already_installed, parser)
            end)
            :totable()
        require('nvim-treesitter').install(parsers_to_install)

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}

