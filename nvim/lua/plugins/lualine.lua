return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
        require("lualine").setup({
            sections = {
                lualine_b = { 
                    "branch",
                    "diff",
                    {
                        "diagnostics",
                        symbols = {
                            error = "•", 
                            warn = "•", 
                            info = "•", 
                            hint = "•" 
                        },
                    }
                },
            },
        })
    end,
}
