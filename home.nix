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

		EDITOR = "nvim";
		VISUAL = "nvim";
	};

	home.sessionPath = [
		"$HOME/.cargo/bin"
	];
}
