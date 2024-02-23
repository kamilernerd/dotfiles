return {
  'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
			vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', {}),
			vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=50<CR>', {}),
			vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal size=15<CR>', {})
    }
}

