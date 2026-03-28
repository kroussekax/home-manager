require("cloak").setup({
	enabled = true,
	cloak_character = "*",
	-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
	highlight_group = "Comment",
	patterns = {
		{
			-- Match any file starting with ".env".
			-- This can be a table to match multiple file patterns.
			file_pattern = {
				".env*",
				"wrangler.toml",
				".dev.vars",
			},
			-- Match an equals sign and any character after it.
			-- This can also be a table of patterns to cloak,
			-- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
			cloak_pattern = "=.+"
		},
	},
})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	require('lspconfig')[ls].setup({
		capabilities = capabilities
		-- you can add other fields for setting up lsp server in this table
	})
end
require('ufo').setup()

require("trouble").setup({
	icons = false,
})

vim.keymap.set("n", "<leader>tt", function()
	require("trouble").toggle()
end)

vim.keymap.set("n", "[t", function()
	require("trouble").next({skip_groups = true, jump = true});
end)

vim.keymap.set("n", "]t", function()
	require("trouble").previous({skip_groups = true, jump = true});
end)

require("nvim-treesitter").setup({
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
	auto_install = false,

	indent = {
		enable = true
	},

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = { "markdown" },
	},
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

require("transparent").setup({
	-- table: default groups
	groups = {
		'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
		'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
		'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
		'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
		'EndOfBuffer',
	},
	-- table: additional groups that should be cleared
	extra_groups = {},
	-- table: groups you don't want to clear
	exclude_groups = {},
	-- function: code to be executed after highlight groups are cleared
	-- Also the user event "TransparentClear" will be triggered
	on_clear = function() end,
})

vim.keymap.set('n', "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set('n', "<C-l>", "<cmd> TmuxNavigateRight<CR>")
vim.keymap.set('n', "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set('n', "<C-k>", "<cmd> TmuxNavigateUp<CR>")

require('telescope').setup({})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pws', function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>pWs', function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

local ls = require("luasnip")
ls.filetype_extend("javascript", { "jsdoc" })

--- TODO: What is expand?
vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

require "lsp_signature".setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "rounded" -- double, rounded, single, shadow, none
	},
	hint_enable = true, -- virtual hint enable
	hint_prefix = "🐼 ",  -- Panda for parameter
	hi_parameter = "Search", -- Highlight group for active parameter
	floating_window = true, -- Show function signature in floating window
	floating_window_above_cur_line = true,  -- Try to place the floating above the current line when possible
	fix_pos = false,  -- Set to true, the floating window won't auto-close until finish all parameters
	hint_scheme = "String",
	use_lspsaga = false,  -- Set to true if you want to use lspsaga
})

local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	cmp_lsp.default_capabilities()
)

capabilities.textDocument.completion.snippetSupport = false

require("fidget").setup({})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
	},
	handlers = {
		function(server_name) -- default handler (optional)

			require("lspconfig")[server_name].setup {
				capabilities = capabilities
			}
		end,

		["lua_ls"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup {
				capabilities = capabilities,
				cmd = { vim.fn.expand("~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true;
						},
					},
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = { "vim", "it", "describe", "before_each", "after_each" },
						}
					}
				}
			}
		end,
	}
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",     -- icon prefix (you can change to "", ">>", etc)
		spacing = 2,      -- space between code and message
	},
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

local harpoon = require("harpoon").setup({
	global_settings = {
		refresh_projects_b4update = true,
		save_on_toggle = true,
		save_on_change = true,
		enter_on_sendcmd = false,
		tmux_autoclose_windows = false,
		excluded_filetypes = {},
		mark_branch = false,
	}
})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-y>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-f>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = ThePrimeagen_Fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = {buffer = bufnr, remap = false}
		vim.keymap.set("n", "<leader>p", function()
			vim.cmd.Git('push')
		end, opts)

		-- rebase always
		vim.keymap.set("n", "<leader>P", function()
			vim.cmd.Git({'pull',  '--rebase'})
		end, opts)

		-- NOTE: It allows me to easily set the branch i am pushing and any tracking
		-- needed if i did not set the branch up correctly
		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
	end,
})


vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
