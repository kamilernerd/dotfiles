return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
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
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
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
			-- Styling
      require("telescope").load_extension("ui-select")
			pcall(require('telescope').load_extension, 'fzf')

			local builtin = require("telescope.builtin")

			-- Only files
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>lf", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "Old files" })
      vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Show opened buffers" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Grep string" })
      vim.keymap.set("n", "<leader>f", builtin.current_buffer_fuzzy_find, { desc = "Fzf current buffer" })

			-- Git files	
      vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Show git files" })
    end,
  },
}
