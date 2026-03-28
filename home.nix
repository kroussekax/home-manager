{pkgs, inputs, ...}:
{
	imports = [
		inputs.zen-browser.homeModules.beta

		./modules
	];

	home.enableNixpkgsReleaseCheck = false;

	home.username = "kax";
	home.homeDirectory = "/home/kax";

	home.stateVersion = "25.11";

	home.sessionVariables = {
		NIXOS_OZONE_WL = "1";
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
		pavucontrol
		ripgrep
		unzip
		wget
		lua54Packages.luarocks
		nodejs
		fd
		rustup
		cmake
		ninja
		dfu-util
		python3
		ccache
		chromium
		yad

		zig
		fzf
		fastfetch
		nerd-fonts.jetbrains-mono

		notify-desktop

		steam

		gnome-themes-extra
		papirus-icon-theme
		bibata-cursors

		xsettingsd

		libreoffice

		lsb-release
		mesa-demos
		cabextract
		samba
		bc
		gawk
		mokutil
		gettext
		vscode
		gh
		vial
		platformio
		gimp
		localsend
		bear
		bluez
		bluez-headers
		oh-my-posh

		thunar
		thunar-archive-plugin
		thunar-volman
		unrar
		file-roller
		blender

		#EwineWow64Packages.stable
		#wineWow64Packages.waylandFull
		#winetricks

		(builtins.getFlake "git+file:///home/kax/gits/Ambxst?rev=857d8ce843eaa121e066f2ed91add7bb02caeb46").packages.${pkgs.system}.default
	];
}
