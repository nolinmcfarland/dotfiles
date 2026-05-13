return {
    'neovim/nvim-lspconfig',
    config = function()
        -- Lua
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        })
        vim.lsp.enable('lua_ls')

        -- Go
        vim.lsp.config('gopls', {
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                },
            }
        })
        vim.lsp.enable('gopls')

        -- C
        vim.lsp.enable('clangd')

        -- Zig
        vim.lsp.enable('zls')

        -- Auto-attach LSP with keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local function map(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end
                local function diag_jump(count)
                    return function()
                        vim.diagnostic.jump({
                            count = count,
                            on_jump = function(diagnostic, bufnr)
                                if not diagnostic then
                                    return
                                end
                                vim.diagnostic.open_float({
                                    bufnr = bufnr,
                                    scope = 'cursor',
                                    focus = false,
                                })
                            end,
                        })
                    end
                end
                local telescope = require('telescope.builtin')
                map('gn', vim.lsp.buf.rename, 'Re[n]ame')
                map('ga', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
                map('gK', vim.lsp.buf.hover, 'Hover Documentation')
                map('gS', vim.lsp.buf.signature_help, 'Signature Help')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
                map('gr', telescope.lsp_references, '[G]oto [R]eferences')
                map('gi', telescope.lsp_implementations, '[G]oto [I]mplementation')
                map('gO', telescope.lsp_document_symbols, 'Open Document Symbols')
                map('gW', telescope.lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
                map('gt', telescope.lsp_type_definitions, '[G]oto [T]ype Definition')
                map('[d', diag_jump(-1), 'Goto Previous Diagnostic')
                map(']d', diag_jump(1), 'Goto Next Diagnostic')
            end,
        })
    end,
}

