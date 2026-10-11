{ inputs,... }:
{
	imports = [
		inputs.noctalia.homeModules.default
	];

	programs.noctalia = {
		enable = true;

		settings = {
			theme = {
				mode = "dark";
				source = "builtin";
				builtin = "Catppuccin";
			};

			wallpaper = {
				enabled = true;
				default.path = "~/nextcloud/Wallpapers/SORRY.png";
			};
		};
	};

	#niri
	xdg.configFile."niri/config.kdl".source = ./niri.kdl;
}
