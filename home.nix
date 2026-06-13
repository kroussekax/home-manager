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
		NIXOS_OZONE_WL = "1";
		QT_QPA_PLATFORM = "wayland";
	};

	home.sessionPath = [
		"$HOME/.cargo/bin"
	];

	services.swaync.enable = true;

	home.file = {
		".config/wallust".source = ./modules/wallust;

		".local/share/rofi/themes/spotlight.rasi".source = ./modules/rofi/spotlight.rasi;
	};

	home.packages = with pkgs; [
		# Communication
		vesktop
		localsend

		# Games
		steam
		prismlauncher

		# Creatives
		kitty
		blender
		blueman
		aseprite
		vial
		obsidian
		(gimp-with-plugins.override { plugins = with gimpPlugins; [ resynthesizer ]; })

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
		tmux
		git
		gh
		fastfetch
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
		wallust

		# Coding
		zsh
		gcc
		clang-tools
		cmake
		ninja
		gnumake
		lua
		lua54Packages.luarocks
		lua-language-server
		python313Packages.pip
		jdk25
		go
		rustup
		zig
		gawk
		platformio
		(pkgs.python3.withPackages (ps: with ps; []))

		# Fonts and Icons
		dejavu_fonts
		font-awesome_4
		nerd-fonts.jetbrains-mono
		bibata-cursors
		papirus-icon-theme
		dconf-editor

		# Hyprland
		hyprpicker
		waybar
		hyprlock
		inputs.awww.packages.${system}.awww
		qt6.qtwayland
		rofi
	];
}
