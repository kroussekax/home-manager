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
end

ColorMyPencils()
