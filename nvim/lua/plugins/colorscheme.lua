local function colorscheme(source, theme, config)
    return {
        source,
        lazy = false,
        priority = 1000,
        config = function()
            config()
            vim.cmd.colorscheme(theme)
        end,
    }
end

local github = colorscheme(
    "projekt0n/github-nvim-theme",
    "github_dark_high_contrast",
    function()
        -- No config needed
    end
)

local modus = colorscheme(
    "miikanissi/modus-themes.nvim",
    "modus",
    function()
        require("modus-themes").setup({
            styles = {
                comments = { italic = false },
                keywords = { 
                    italic = false,
                    bold = true
                },
            },
            line_nr_column_background = false,
            sign_column_background = false,
        })
    end
)

return modus
