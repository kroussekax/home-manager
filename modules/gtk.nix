{ pkgs, ...}:
{
	gtk = {
		enable = true;

		theme = {
			name = "Adwaita-dark";
			package = pkgs.adwaita-icon-theme;
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

		gtk4.theme = {
			name = "Adwaita-dark";
			package = pkgs.adwaita-icon-theme;
		};

		font = {
			name = "Inter";
			size = 11;
		};
	};
}
