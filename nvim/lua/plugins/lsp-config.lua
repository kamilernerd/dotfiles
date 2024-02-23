return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
				ensure_installed = vim.tbl_keys({
					gopls = {},
					tsserver = {},
					rust_analyzer = {},
				})
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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})

			-- On cursor hover documentation/diagnostics
			vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]
			vim.cmd [[autocmd CursorHoldI * silent! lua vim.buf.signature_help()]]

			-- Disable annoying lsp messages at the EOL
			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
					underline = true,
					signs = true,
				}
			)
    end,
  },
}
