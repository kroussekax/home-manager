{ pkgs, inputs, ...}:
{
	xdg.configFile."fcitx5/conf" = {
		source = ./.;
		recursive = true;
	};

	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";

		fcitx5.addons = with pkgs; [
			inputs.fcitx-virtualkeyboard-adapter.packages.${system}.default
		];
	};
}
