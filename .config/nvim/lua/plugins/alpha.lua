return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#00FF41"})
		vim.api.nvim_set_hl(0, "DashboardButton", { fg = "#008F11" })
		vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#003B00", italic = true })

		-- Custom ASCII header
		dashboard.section.header.val = {
			"███╗   ██╗███████╗ ██████╗ ",
			"████╗  ██║██╔════╝██╔═══██╗",
			"██╔██╗ ██║█████╗  ██║   ██║",
			"██║╚██╗██║██╔══╝  ██║   ██║",
			"██║ ╚████║███████╗╚██████╔╝",
			"╚═╝  ╚═══╝╚══════╝ ╚═════╝ ",
		}
		dashboard.section.header.opts.hl = "DashboardHeader"

		-- Menu buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("f", "󰱼  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}
		dashboard.section.buttons.opts.hl = "DashboardButton"

		-- Footer
		dashboard.section.footer.val = "There is no spoon"
		dashboard.section.footer.opts.hl = "DashboardFooter"

		-- Apply config
		require("alpha").setup(dashboard.config)
	end,
}
