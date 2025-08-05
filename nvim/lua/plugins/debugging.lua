return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()

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
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-dap", -- adjust as needed, must be absolute path
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				env = {
					DISPLAY = os.getenv("DISPLAY"),
					WAYLAND_DISPLAY = os.getenv("WAYLAND_DISPLAY"),
					LD_LIBRARY_PATH = os.getenv("LD_LIBRARY_PATH"), -- optional
				},

				stopOnEntry = false,
				args = {},

				-- 💀
				-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
				--
				--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
				--
				-- Otherwise you might get the following error:
				--
				--    Error on launch: Failed to attach to the target process
				--
				-- But you should be aware of the implications:
				-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
				-- runInTerminal = false,
			},
		}
		dap.adapters.coreclr = {
			type = "executable",
			command = "/usr/bin/netcoredbg",
			args = { "--interpreter=vscode" },
		}
		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
				end,
        args = function()
            local input = vim.fn.input("Application arguments (space separated): ")
            local args = {}
            for arg in string.gmatch(input, "%S+") do
                table.insert(args, arg)
            end
            return args
        end,
			},
		}
	end,
}
