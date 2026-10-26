{ pkgs, ... }:
{
	programs.retroarch = {
		enable = true;

		package = pkgs.retroarch-bare;

		cores = {
			dolphin.enable = true;
			azahar.enable = true;
		};
	};

}
