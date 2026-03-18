return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- Enable true color
		vim.opt.termguicolors = true

		-- Load Catppuccin colorscheme
		vim.cmd([[colorscheme catppuccin]])

		-- Make core background transparent
		vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight VertSplit guibg=NONE ctermbg=NONE
      highlight StatusLine guibg=NONE ctermbg=NONE
      highlight StatusLineNC guibg=NONE ctermbg=NONE
    ]])

		-- Neo-tree transparency
		vim.cmd([[
      highlight NeoTreeNormal guibg=NONE ctermbg=NONE
      highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
      highlight NeoTreeFloat guibg=NONE ctermbg=NONE
      highlight NeoTreeFloatBorder guibg=NONE ctermbg=NONE
    ]])

		-- Telescope transparency
		vim.cmd([[
      highlight TelescopeNormal guibg=NONE ctermbg=NONE
      highlight TelescopeBorder guibg=NONE ctermbg=NONE
      highlight TelescopePromptNormal guibg=NONE ctermbg=NONE
      highlight TelescopePromptBorder guibg=NONE ctermbg=NONE
      highlight TelescopeResultsNormal guibg=NONE ctermbg=NONE
      highlight TelescopeResultsBorder guibg=NONE ctermbg=NONE
      highlight TelescopePreviewNormal guibg=NONE ctermbg=NONE
      highlight TelescopePreviewBorder guibg=NONE ctermbg=NONE
    ]])

		-- LSP floating windows
		vim.cmd([[
      highlight LspFloatWinNormal guibg=NONE ctermbg=NONE
      highlight LspFloatWinBorder guibg=NONE ctermbg=NONE
    ]])

		-- Which-key transparency (if used)
		vim.cmd([[
      highlight WhichKeyFloat guibg=NONE ctermbg=NONE
      highlight WhichKeyBorder guibg=NONE ctermbg=NONE
    ]])
	end,
}
