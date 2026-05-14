{ pkgs, ...}:
{
	gtk = {
		enable = true;

		theme = {
			name = "Adwaita-dark";
			package = pkgs.adwaita-icon-theme;
		};

		iconTheme = {
			name = "arashi";
			package = pkgs.arashi;
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

		gtk3.extraConfig = {
			gtk-application-prefer-dark-theme = true;
		};

		gtk4.extraConfig = {
			gtk-application-prefer-dark-theme = true;
		};
	};
}
