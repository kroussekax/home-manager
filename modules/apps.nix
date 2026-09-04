{ config, pkgs, inputs, ... }:
{
	home.packages = with pkgs; [
		# Communication
		vesktop
		localsend
		qbittorrent
		filezilla
		telegram-desktop
		firefox

		# Games
		steam
		prismlauncher
		azahar
		ryubing
		gamemode
		bottles

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
		qt6.qtwayland
		rofi
		wvkbd
		inputs.awww.packages.${system}.awww
		quickshell
		];
}
