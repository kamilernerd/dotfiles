return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
	    })
    end
  }
}
