{ config, ...}:
{
	home.file.".local/bin/waybar" = {
		source = ./.;
		recursive = true;
	};
}
