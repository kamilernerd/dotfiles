return {
	{
			"nvim-telescope/telescope-file-browser.nvim",
			dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
			"nvim-lua/plenary.nvim",
			{
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
		},
    config = function()
      require("telescope").setup({
				defaults = {
					extensions = {
						fzf = {
							fuzzy = true
						}
					},
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						}
					},
					file_ignore_patterns = {
						"node_modules",
						"target",
						"vendor",
						"public",
						"build",
						"bin",
					}
				}
      })

			pcall(require("telescope").load_extension, 'fzf')
			pcall(require("telescope").load_extension, "file_browser")

			local builtin = require("telescope.builtin")

			-- Only files
			vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", { desc = "Show file browser"})
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>lf", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "Old files" })
      vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Show opened buffers" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Grep string" })
      vim.keymap.set("n", "<leader>f", builtin.current_buffer_fuzzy_find, { desc = "Fzf current buffer" })
      vim.keymap.set("n", "<leader>tn", ":TodoTelescope<CR>", { desc = "Fzf current buffer" })

			-- Git files	
      vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Show git files" })
    end,
  },
}
