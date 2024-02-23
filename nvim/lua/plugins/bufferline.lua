return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require("bufferline")
      vim.o.termguicolors = true
      bufferline.setup({
        options = {
          mode = "buffers",
          themable = true,
          style_preset = bufferline.style_preset.minimal
        }
      })
    end
  }

