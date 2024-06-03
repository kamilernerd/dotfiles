-- vim.cmd('colorscheme oxocarbon')
vim.cmd('colorscheme catppuccin-mocha')
vim.o.background = "dark"
vim.o.bg = "dark"

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Encoding
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- Fix backspace indent
vim.o.backspace = 'indent,eol,start'

-- Tabs. May be overridden by autocmd rules
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 2
vim.expandtab = true

-- Enable hidden bufferstrue
vim.o.hidden = true

-- Searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

--vim.o.mousemodel = 'popup'
vim.o.t_Co = 256
vim.o.guioptions = 'egmrti'
vim.o.gfn = 'Monospace\\ 10'

--Disable the blinking cursor.
vim.o.gcr = 'a:blinkon1'

--Status bar
vim.o.laststatus = 2

--Use modeline overrides
vim.o.modeline = true
vim.o.modelines = 10

vim.o.wrap = true
vim.o.wm = 2
vim.o.textwidth = 79

-- [[ Basic Keymaps ]]

-- Quality of life command overrides
vim.cmd('cnoreabbrev W! w!')
vim.cmd('cnoreabbrev Q! q!')
vim.cmd('cnoreabbrev Qall! qall!')
vim.cmd('cnoreabbrev Wq wq')
vim.cmd('cnoreabbrev Wa wa')
vim.cmd('cnoreabbrev wQ wq')
vim.cmd('cnoreabbrev WQ wq')
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')
vim.cmd('cnoreabbrev Qall qall')

-- Screen split
vim.keymap.set('n', '<leader>h', ':<C-u>split<CR>', { expr = false, silent = true, desc = "Split window horizontally" })
vim.keymap.set('n', '<leader>v', ':<C-u>vsplit<CR>', { expr = false, silent = true, desc = "Split window vertically" })

-- Tab navigation
--vim.keymap.set('n', '<Tab>', 'gt', { expr = false, silent = true, desc = "Next tab" })
--vim.keymap.set('n', '<S-Tab>', 'gT', { expr = false, silent = true, desc = "Prev tab" })
--vim.keymap.set('n', '<S-t>', ':tabnew<CR>', { expr = false, silent = true, desc = "New tab" })

-- Buffer navigation
vim.keymap.set('n', '<Tab>', ':bn<CR>', { expr = false, silent = true, desc = "Next buffer" })
vim.keymap.set('n', '<S-Tab>', ':bp<CR>', { expr = false, silent = true, desc = "Prev buffer" })
vim.keymap.set('n', '<S-x>', ':bd<CR>', { expr = false, silent = true, desc = "Close current buffer" })
vim.keymap.set('n', '<S-c>', ':enew<CR>', { expr = false, silent = true, desc = "Open new buffer" })

-- Window navigation
vim.keymap.set('n', '<C-w-j>', '<C-w>j', { expr = false, silent = true, desc = "Navigate window down" })
vim.keymap.set('n', '<C-w-k>', '<C-w>k', { expr = false, silent = true, desc = "Navigate window up" })
vim.keymap.set('n', '<C-w-l>', '<C-w>l', { expr = false, silent = true, desc = "Navigate window right" })
vim.keymap.set('n', '<C-w-h>', '<C-w>h', { expr = false, silent = true, desc = "Navigate window left" })

-- Clear search
vim.keymap.set('n', '<leader>z', ':noh<CR>', { expr = false, silent = true, desc = "Clean search" })

-- FIX TAB INDENTATION IN VISUAL AND INSERT MODE
local opts = { noremap = true, silent = true }
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N><<<C-\\><C-N>^i", opts)
vim.keymap.set("v",    "<Tab>",         ">gv", opts)
vim.keymap.set("v",    "<S-Tab>",       "<gv", opts)
