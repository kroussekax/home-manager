{ pkgs, ...}:
{
	qt = {
		enable = true;
		platformTheme.name = "gtk";
	};

	gtk = {
		enable = true;

		theme = {
			name = "Adwaita";
			package = pkgs.gnome-themes-extra;
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

		gtk4.extraConfig = {
			gtk-application-prefer-dark-theme = true;
		};
	};

	dconf.settings."org/gnome/desktop/interface" = {
		gtk-theme = "Adwaita";
		icon-theme = "Papirus-Dark";
		cursor-theme = "Bibata-Modern-Ice";
		font-name = "Inter 11";
		color-scheme = "prefer-dark";
	};
}
