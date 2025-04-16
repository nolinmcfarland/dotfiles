return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        local lspconfig = require('lspconfig')
        local default_capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'ts_ls' },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = default_capabilities
                    })
                end,
                ['lua_ls'] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = default_capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = {
                                    globals = { 'vim' }
                                }
                            }
                        }
                    })
                end,
            }
        })

        -- Sourcekit
        lspconfig.sourcekit.setup({
            capabilities = default_capabilities
        })

        -- Setup cmp
        vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local select_opts = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            sources = {
                { name = 'path' }, -- Autocomplete file paths
                { name = 'nvim_lsp', keyword_length = 1 }, -- Show suggestions from LSP response
                { name = 'buffer', keyword_length = 3 }, -- Show suggestions from current buffer
                { name = 'luasnip', keyword_length = 2 }, -- Show available snippets and expand when selected
            },
            window = {
                documentation = cmp.config.window.bordered()
            },
            formatting = {
                fields = { 'menu', 'abbr', 'kind' },
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = 'L',
                        luasnip = 'S',
                        buffer = 'B',
                        path = 'P'
                    }

                    item.menu = menu_icon[entry.source.name]
                    return item
                end
            },
            mapping = {
                -- 
                ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
                ['<Down>'] = cmp.mapping.select_next_item(select_opts),

                ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-y>'] = cmp.mapping.confirm({select = true}),
                ['<CR>'] = cmp.mapping.confirm({select = false}),

                -- Jump to next placeholder in snippet
                ['<C-w>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, {'i', 's'}),

                -- Jump to previous placeholder in snippet
                ['<C-b>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {'i', 's'}),

                -- Autocomplete with tab
                ['<Tab>'] = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1

                    if cmp.visible() then
                        cmp.select_next_item(select_opts)
                    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, {'i', 's'}),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item(select_opts)
                    else
                        fallback()
                    end
                end, {'i', 's'}),
            }
        })

        -- Setup diagnostics
        vim.diagnostic.config({
            virtual_text = false,
            severity_sort = true,
            float = {
                border = 'rounded',
                source = 'always',
            },
        })

        local sign = function(opts)
            vim.fn.sign_define(opts.name, {
                texthl = opts.name,
                text = opts.text,
                numhl = ''
            })
        end

        sign({name = 'DiagnosticSignError', text = '✘'})
        sign({name = 'DiagnosticSignWarn', text = '▲'})
        sign({name = 'DiagnosticSignHint', text = '⚑'})
        sign({name = 'DiagnosticSignInfo', text = '»'})

        -- Code action bindings
        vim.api.nvim_create_autocmd('LSPAttach', {
            desc = 'LSP Actions',
            callback = function(args)
                local opts = { buffer = args.buf, silent = true }

                -- Displays hover info about the sybmol under the cursor
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

                -- Jump to definition
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

                -- Jump to declaration
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

                -- Lists all implementations for the symbol under the cursor
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

                -- Jumps to the definition of the type symbol
                vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)

                -- Lists all the references
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

                -- Displays a function's signature info
                vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)

                -- Renames all references to the symbol under the cursor
                vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)

                -- Selects a code action available at the cursor position
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.code_action, opts)

                -- Show diagnostics in a floating window
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)

                -- Move to the previous diagnostic
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

                -- Move to the next diagnostic
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            end
        })
    end
}
