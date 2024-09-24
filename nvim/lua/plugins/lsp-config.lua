return {
	-- Visual stuff
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		opts = {},
	},
	{
		"folke/neodev.nvim",
	},
	-- Actual LSP stuff
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = vim.tbl_keys({
					gopls = {},
					tsserver = {},
					rust_analyzer = {},
					clangd = {},
				}),
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local lspconfig = require("lspconfig")

			-- local servers = { "clangd", "rust_analyzer", "pyright", "tsserver", "gopls" }
			-- for _, lsp in ipairs(servers) do
			-- 	lspconfig[lsp].setup({
			-- 		-- on_attach = my_custom_on_attach,
			-- 		capabilities = capabilities,
			-- 	})
			-- end

			-- Dynamically loads and configures installed LSP's
			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({})
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show description " })
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature " })
			vim.keymap.set("n", "gDD", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gII", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "Show references" })
			vim.keymap.set("n", "caa", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "gdd", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", ",,", vim.diagnostic.open_float, { desc = "Open diagnostic" })

			-- vim.keymap.set('n', '<space>f', function()
			-- 	vim.lsp.buf.format { async = true }
			-- end, { })

			-- On cursor hover documentation/diagnostics
			-- vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]
			vim.cmd([[autocmd CursorHoldI * silent! lua vim.buf.signature_help()]])

			-- Disable annoying lsp messages at the EOL
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
					underline = false,
					signs = true,
				})
		end,
	},
}
