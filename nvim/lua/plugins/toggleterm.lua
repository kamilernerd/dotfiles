return {
  'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
			vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = "Open floating terminal" }),
			vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=50<CR>', { desc = "Open vertical terminal" }),
			vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal size=15<CR>', { desc =  "Open horizontal terminal" }),
			vim.keymap.set('n', '<leader>tb', ':ToggleTerm direction=tab', { desc = "Open terminal in new tab" })
    }
}

