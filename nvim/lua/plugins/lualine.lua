return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
        require("lualine").setup({
            options = {
                section_separators = {},
                component_separators = {}
            },
            sections = {
                lualine_b = {
                    "branch",
                    "diff",
                    {
                        "diagnostics",
                        symbols = {
                            error = vim.g.diagnostic_symbol.error,
                            warn = vim.g.diagnostic_symbol.warn,
                            info = vim.g.diagnostic_symbol.info,
                            hint = vim.g.diagnostic_symbol.hint,
                        },
                    }
                },
            },
        })
    end,
}
