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

local monokai = colorscheme(
    "loctvl842/monokai-pro.nvim",
    "monokai-pro",
    function()
        require("monokai-pro").setup {
            -- transparent_background = true,
            styles = {
                comment = { italic = false },
                keyword = { italic = false },
                type = { italic = false },
                storageclass = { italic = false },
                structure = { italic = false },
                parameter = { italic = false },
                annotation = { italic = false },
                tag_attribute = { italic = false },
            },
        }
    end
)

local ayu = colorscheme(
    "Shatur/neovim-ayu",
    "ayu-mirage",
    function()
        -- No config needed
    end
)

return ayu
