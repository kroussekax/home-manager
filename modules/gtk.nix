{ pkgs, ...}:
{
	qt = {
		enable = true;

		platformTheme.name = "gtk3";

		style = {
			name = "kvantum";
			package = pkgs.kdePackages.qtstyleplugin-kvantum;
		};
	};

	gtk = {
		enable = true;

		theme = {
			name = "Dracula";
			package = pkgs.dracula-theme;
		};

		iconTheme = {
			name = "Papirus-Dark";
			package = pkgs.papirus-icon-theme;
		};

		cursorTheme = {
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
			size = 24;
		};

		font = {
			name = "Inter";
			size = 11;
		};

		gtk3.extraConfig = {
			gtk-application-prefer-dark-theme = true;
		};
	};

	xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
		[General]
		theme=Dracula
			'';

	dconf.settings = {
		"org/gnome/desktop/interface" = {
			gtk-theme = "Dracula";
			color-scheme = "prefer-dark";

			icon-theme = "Papirus-Dark";
			cursor-theme = "Bibata-Modern-Ice";
			font-name = "Inter 11";
		};

		"org/gnome/desktop/wm/preferences" = {
			theme = "Dracula";
		};
	};

	xdg.portal = {
		enable = true;
		xdgOpenUsePortal = true;

		extraPortals = [
			pkgs.xdg-desktop-portal-gtk
				pkgs.xdg-desktop-portal-hyprland
		];

		configPackages = [ pkgs.hyprland ];
	};

	fonts.fontconfig.enable = true;
}
