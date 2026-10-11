{pkgs,...}:
{

	programs.neovim = 
	{
		enable = true;

		initLua = ''
			${builtins.readFile ./set.lua}
			${builtins.readFile ./remap.lua}
			${builtins.readFile ./neovide.lua}
			${builtins.readFile ./plugins.lua}
		'';

		plugins = with pkgs.vimPlugins; [
			cord-nvim
			plenary-nvim
			cloak-nvim
			vim-fugitive
			harpoon
			codesnap-nvim

			# lsp dependencies
			nvim-lspconfig
			cmp-nvim-lsp
			cmp-buffer
			cmp-path
			cmp-cmdline
			nvim-cmp
			cmp_luasnip
			fidget-nvim
			friendly-snippets
			luasnip
			nvim-lspconfig
			lsp_signature-nvim
			telescope-nvim
			vim-tmux-navigator
			transparent-nvim
			undotree
			trouble-nvim
			nvim-ufo

			(nvim-treesitter.withPlugins
			 (p: [
			  p.nix
			  p.rust
			  p.cpp
			  p.lua
			  p.html
			  p.css
			 ]))

			# colorschemes
			rose-pine
			kanagawa-nvim
			gruvbox-nvim
			tokyonight-nvim
			];
	};
}
