{ ... }:
{
	programs.hyprlock = {
		enable = true;

		settings = {
			general = {
				ingore_empty_input = true;
			};
			auth = {
				pam.enabled = true;
			};
		};
	};
}
