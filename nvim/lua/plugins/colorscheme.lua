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
    "github_dark_default",
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
                -- comments = { italic = false },
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

local oxocarbon = colorscheme(
    "nyoom-engineering/oxocarbon.nvim",
    "oxocarbon",
    function()
    end
)

local material = colorscheme(
    "marko-cerovac/material.nvim",
    "material",
    function()
        vim.g.material_style = "deep ocean"
    end
)

return github
