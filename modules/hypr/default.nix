{ ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		extraConfig = builtins.readFile ./hyprland.lua;
	};

	home.file.".local/bin/auto_rotate.sh".source = ./scripts/auto_rotate.sh;
}
