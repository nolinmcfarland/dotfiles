return {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            version = '2.*',
            build = (function()
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                {
                    'rafamadriz/friendly-snippets',
                    config = function()
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end,
                },
            },
            opts = {},
        },
        'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
        keymap = {
            -- <c-y> to accept ([y]es) the completion.
            -- <tab>/<s-tab>: move to right/left of your snippet expansion
            -- <c-space>: Open menu or open docs if already open
            -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
            -- <c-e>: Hide menu
            -- <c-k>: Toggle signature help
            preset = 'default',
        },

        appearance = {
            nerd_font_variant = 'mono',
        },

        completion = {
            documentation = { auto_show = false, auto_show_delay_ms = 500 },
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'lazydev' },
            providers = {
                lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
            },
        },

        snippets = { preset = 'luasnip' },

        fuzzy = { implementation = 'lua' },

        signature = { enabled = true },
    },
}
