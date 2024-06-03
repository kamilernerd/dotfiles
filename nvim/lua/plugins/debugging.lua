return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
    require("dapui").setup()
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpointo "})
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>", { desc = "Continue to next breakpoint "})
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>", { desc = "Terminate at breakpoint "})
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", { desc = "StepOver breakpoint "})
	end,
}
