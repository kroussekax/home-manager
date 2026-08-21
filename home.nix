{pkgs, inputs, ...}:
{
	imports = [
		inputs.zen-browser.homeModules.beta

		./modules
	];

	home.enableNixpkgsReleaseCheck = false;

	home.username = "kax";
	home.homeDirectory = "/home/kax";

	home.stateVersion = "26.05";

	home.sessionVariables = {
		QT_QPA_PLATFORM = "wayland";

		GTK_THEME = "Dracula";

		QT_QPA_PLATFORMTHEME = "gtk3";

		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = "24";

		NIXOS_OZONE_WL = "1";
	};

	home.sessionPath = [
		"$HOME/.cargo/bin"
	];

	home.file = {
		".local/share/rofi/themes/spotlight.rasi".source = ./modules/rofi/spotlight.rasi;
	};

	home.packages = with pkgs; [
		# Communication
		vesktop
		localsend
		qbittorrent
		filezilla

		# Games
		steam
		prismlauncher
		azahar

		# Creatives
		gnome-tweaks
		kitty
		aseprite
		vial
		mpv
		papers
		(gimp-with-plugins.override {
			plugins = with gimpPlugins; [ 
			resynthesizer

		];})
		obsidian
		nextcloud-client
		pavucontrol

		# KDE
		kdePackages.kdeconnect-kde

		# Screenshots
		swappy
		grim
		slurp
		grimblast

		# Thunar
		thunar
		thunar-archive-plugin
		thunar-volman
		unrar
		file-roller

		# CLI
		libinput
		typescript
		typescript-language-server
		android-tools
		davfs2
		tmux
		ani-cli
		git
		gh
		ripgrep
		unzip
		wget
		fzf
		scrcpy
		ffmpeg
		nodejs
		playerctl
		notify-desktop
		cava
		brightnessctl
		wl-clipboard
		cliphist
		v4l-utils
		geoclue2

		# Coding
		clang-tools
		zsh
		lua
		lua54Packages.luarocks
		lua-language-server
		python313Packages.pip
		jdk25
		go
		zig
		(pkgs.python3.withPackages (ps: with ps; []))

		# Fonts and Icons
		dejavu_fonts
		font-awesome_4
		nerd-fonts.jetbrains-mono
		bibata-cursors
		papirus-icon-theme
		dconf-editor
		inter
		dracula-theme
		kdePackages.qtstyleplugin-kvantum
		dracula-icon-theme

		# Hyprland
		hyprpicker
		waybar
		hyprlock
		inputs.awww.packages.${system}.awww
		qt6.qtwayland
		rofi
		wvkbd
	];
}
