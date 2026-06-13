{ config, pkgs, ... }:

{
	xdg.configFile."$HOME/.config/waybar/config.jsonc".source = /home/kax/dotfiles/modules/waybar/config.jsonc;
	xdg.configFile."$HOME/.config/waybar/style.css".source = /home/kax/dotfiles/modules/waybar/style.css;
}
