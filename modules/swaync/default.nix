{ ... }:
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
						command = "toggle_auto_rotate.sh";
					}
					{
						label = "⏾";
						command = "systemctl suspend-then-hibernate";
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

	home.file.".local/bin/toggle_auto_rotate.sh".source = ./scripts/toggle_auto_rotate.sh;
}
