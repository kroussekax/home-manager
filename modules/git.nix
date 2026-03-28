{ config, ...}:
{
	programs.git = {
		enable = true;
		settings = {
			user.name = "kroussekax";
			user.email = "jcskax@gmail.com";

			init.defaultBranch = "main";
			credential.helper = "store";
		};
	};
}
