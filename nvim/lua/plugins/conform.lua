return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            c = { 'clang-format' },
            go = { 'gofmt' },
            lua = { 'stylua' },
            zig = { 'zigfmt' },
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}

