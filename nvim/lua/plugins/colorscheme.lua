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

local embark = colorscheme(
    "embark-theme/vim",
    "embark",
    function()
        -- No config needed
    end
)

return embark
