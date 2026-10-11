{pkgs, inputs, ... }:
{
	home.packages = with pkgs; [
		# Communication
		vesktop
		qbittorrent
		filezilla
		telegram-desktop
		nextcloud-client

		# Games
		osu-lazer-bin

		steam
		heroic
		prismlauncher

		azahar
		ryubing

		protonup-qt
		gamemode
		mangohud
		ryzenadj

		# Creatives
		proton-vpn
		obsidian
		rnote
		kitty
		aseprite
		vial
		mpv
		(gimp-with-plugins.override {
		 plugins = with gimpPlugins; [ 
		 resynthesizer
		 ];})
		pavucontrol

		# Screenshots
		swappy
		grim
		grimblast

		# File Managers
		thunar
		thunar-archive-plugin
		thunar-volman
		unrar
		file-roller

		# CLI
		postgresql
		wayvnc
		ntfs3g
		exfat
		fetch
		libinput
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
		nixd
		tree-sitter
		gcc
		gnumake
		pkg-config
		vscode-langservers-extracted
		antigravity
		clang-tools
		zsh
		lua
		lua54Packages.luarocks
		lua-language-server
		python313Packages.pip
		jdk25
		go
		zig
		python3

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
		kdePackages.dolphin
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
