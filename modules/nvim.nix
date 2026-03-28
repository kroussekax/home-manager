{pkgs, inputs, ...}:
{
	/*
	nixpkgs = {
		overlays = [
			(final: prev: {
				vimPlugins = prev.vimPlugins // {
					own-platformio-nvim = prev.vimUtils.buildVimPlugin {
						name = "nvim-platformio";
						src = inputs.plugin.platformio;
					};
				};
			 })
		];
	};*/

	programs.neovim = 
	{
		enable = true;

		initLua = ''
			${builtins.readFile ./nvim/set.lua}
			${builtins.readFile ./nvim/remap.lua}
			${builtins.readFile ./nvim/neovide.lua}
			${builtins.readFile ./nvim/plugins.lua}
		'';

		plugins = with pkgs.vimPlugins; [
			cord-nvim
			plenary-nvim
			cloak-nvim
			vim-fugitive
			harpoon

			# lsp dependencies
			mason-nvim
			mason-lspconfig-nvim
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

			nvim-treesitter

			# colorschemes
			rose-pine
			kanagawa-nvim
			gruvbox-nvim
			tokyonight-nvim
			];
	};
}
