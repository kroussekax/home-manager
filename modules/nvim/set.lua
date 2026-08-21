local vo = vim.opt

vo.number = true
vo.relativenumber = true
vo.autoindent = true
vo.tabstop = 4
vo.shiftwidth = 4
vo.smarttab = true
vo.softtabstop = 4

vo.wrap = false

vo.swapfile = false
vo.backup = false
vo.undodir = os.getenv("HOME") .. "/.vim/undodir"
vo.undofile = true

vo.hlsearch = false
vo.incsearch = true

vo.termguicolors = true

vo.scrolloff = 8
vo.signcolumn = "yes"
vo.isfname:append("@-@")

vo.updatetime = 50

vo.colorcolumn = "120"

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	fg =  "#ebdbb2"
	bg =  "#282828"

	vim.api.nvim_set_hl(0, "ColorColumn", {
		bg = bg,
	})

	vim.api.nvim_set_hl(0, "WinSeparator", {
		fg = bg,
	})

	vim.api.nvim_set_hl(0, "StatusLine", {
		fg = fg,
		bg = bg,
	})

	vim.api.nvim_set_hl(0, "StatusLineNC", {
		fg = "#928374",
		bg = bg,
	})
	vim.api.nvim_set_hl(0, "EndOfBuffer", {
		fg = bg,
	})
	vim.api.nvim_set_hl(0, "LineNr", {
		fg = "#665c54",
	})

	vim.api.nvim_set_hl(0, "Pmenu", {
		bg = bg,
	})

	vim.api.nvim_set_hl(0, "PmenuSel", {
		bg = "#3c3836",
	})

	vim.api.nvim_set_hl(0, "CursorLineNr", {
		fg = fg,
	})
	vim.api.nvim_set_hl(0, "FloatBorder", {
		fg = bg,
		bg = bg,
	})

	vim.api.nvim_set_hl(0, "FloatTitle", {
		fg = fg,
		bg = bg,
	})

	vim.api.nvim_set_hl(0, "TelescopePromptTitle", {
		fg = "#ebdbb2",
		bg = "#282828",
	})

	vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {
		fg = "#ebdbb2",
		bg = "#282828",
	})

	vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {
		fg = "#ebdbb2",
		bg = "#282828",
	})
end

ColorMyPencils()






















