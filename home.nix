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

	home.packages = with pkgs; [
		vesktop
		kitty

		git

		prismlauncher

		tmux
		zsh
		ripgrep
		unzip
		wget
		yad
		fzf
		scrcpy
		ffmpeg
		lzip
		rnote

		fastfetch
		notify-desktop
		xsettingsd

		nodejs
		zola

		gcc
		cmake
		ninja
		gnumake

		lua
		lua54Packages.luarocks

		python313Packages.pip

		jdk25

		go
		rustup
		zig
		gawk

		dejavu_fonts
		font-awesome_4

		playerctl

		nerd-fonts.jetbrains-mono
		gnome-themes-extra
		papirus-icon-theme
		bibata-cursors

		steam
		heroic

		gh
		vial
		platformio
		localsend
		bear
		bluez
		bluez-headers
		oh-my-posh
		(gimp-with-plugins.override {
		 plugins = with gimpPlugins; [ resynthesizer ];
		 })

		thunar
		thunar-archive-plugin
		thunar-volman
		unrar
		file-roller
		blender

		wineWow64Packages.stable
		winetricks

		qt6.qtwayland
		
		#hyprland stuff
		hyprpicker
		brightnessctl
		blueman
		quickshell
		waybar
		 
		inputs.awww.packages.${system}.awww

		#(builtins.getFlake "git+file:///home/kax/gits/ReallyGoodShell?rev=dbaba71853dab3dc6a0d165f44be5d947edd25b9").packages.${pkgs.system}.default
	];
}
