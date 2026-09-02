{ inputs, pkgs, config, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		extraConfig = builtins.readFile ./hyprland.lua;
	};

	home.file.".local/bin/scripts/hypr" = {
		source = ./hypr;
		recursive = true;
	};
}
