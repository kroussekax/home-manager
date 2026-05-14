{ config, pkgs, ... }:

{
	xdg.configFile."waybar/config.jsonc".source = /home/kax/dotfiles/modules/waybar/config.jsonc;
	xdg.configFile."waybar/style.css".source = /home/kax/dotfiles/modules/waybar/style.css;
}
