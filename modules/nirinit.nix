{ ... }:
{
	services.nirinit = {
		enable = true;
		settings = {
			# Map app_id to launch command (useful for PWAs, flatpaks, etc.)
			launch = {
			};
			# Apps to skip during restore
		};
	};
}
