{ config, inputs, ...}:
{
	imports = [ inputs.zen-browser.homeModules.beta ];

	programs.zen-browser = {
		enable = true;
	};

	home.file = {
		".config/zen/profiles.ini".text = ''
		[Profile0]
		Name=default
		IsRelative=1
		Path=default
		Default=1

		[General]
		StartWithLastProfile=1
		Version=2
			'';

		".config/zen/default/user.js".source = ./user.js;
		".config/zen/default/chrome".source = ./chrome;
		".config/zen/default/zen-keyboard-shortcuts.json".source =
			./zen-keyboard-shortcuts.json;
		".config/zen/default/zen-themes.json".source =
			./zen-themes.json;
		".config/zen/default/containers.json".source =
			./containers.json;
	};
}
