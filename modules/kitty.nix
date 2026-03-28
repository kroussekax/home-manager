{ config, pkgs, ... }:

{
	programs.kitty = {
		enable = true;

		font = {
			name = "JetBrainsMono Nerd Font";
			size = 9;
		};

		settings = {
			bold_font = "JetBrainsMono Nerd Font Bold";
			bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
			disable_ligatures = "never";

			background_opacity = "0.5";

			force_ltr = "yes";

			cursor_blink_interval = "0.6";
			cursor_stop_blinking_after = "0";
			cursor_trail = "3";

			repaint_delay = "8";
			input_delay = "0";

			confirm_os_window_close = "0";

			theme = "hazy";
		};
	};
}
