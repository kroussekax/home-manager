{ config, ...}:
{
	services.swaync = {
		enable = true;

		settings = {
			positionX = "right";
			positionY = "top";

			layer = "overlay";

			control-center-width = 420;

			notification-grouping = true;

			widgets = [
				"title"
				"volume"
				"dnd"
				"buttons-grid"
			];

			widget-config = {
				buttons-grid = {
					actions = [
					{
						label = "󰤥";
						command = "nmcli radio wifi \"\$( [ \"\$(nmcli radio wifi)\" = \"enabled\" ] && echo off || echo on )\"";
					}
					{
						label = "⟳";
						command = "$HOME/dotfiles/modules/swaync/auto_rotate_toggle.sh";
					}
					{
						label = "⏾";
						command = "systemctl hybrid-sleep";
					}
					{
						label = "⌨";
						command = "pkill -RTMIN -x wvkbd-mobintl";
					}
					];
				};
			};
		};

		style = builtins.readFile ./style.css;
	};
}
