{ config, ...}:
{
	xdg.configFile."waybar" = {
		source = ./.;
		recursive = true;
	};
}
