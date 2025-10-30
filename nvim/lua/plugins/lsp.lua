return {
	"neovim/nvim-lspconfig",
    commit = "61e5109",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gn", vim.lsp.buf.rename, "[R]e[n]ame")

				map("ga", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

				map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

				map("gt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

				map("[d", vim.diagnostic.goto_prev, "Goto Previous Diagnostic")

				map("]d", vim.diagnostic.goto_prev, "Goto Next Diagnostic")
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.signcolumn_diagnostics and {
				text = {
					[vim.diagnostic.severity.ERROR] = vim.g.diagnostic_symbol.error,
					[vim.diagnostic.severity.WARN] = vim.g.diagnostic_symbol.warn,
					[vim.diagnostic.severity.INFO] = vim.g.diagnostic_symbol.info,
					[vim.diagnostic.severity.HINT] = vim.g.diagnostic_symbol.hint,
				},
			} or {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
            },
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local servers = {
            basedpyright = {},
			clangd = {},
            gopls = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
							disable = { "missing-fields" },
						},
					},
				},
			},
			ts_ls = {},
            rust_analyzer = {},
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, { "stylua" })
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[server_name].setup(server)
				end,
			},
		})

		lspconfig.sourcekit.setup({
			capabilities = capabilities,
		})
	end,
}
