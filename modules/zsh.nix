{ pkgs, config, ...}:
{
	programs.zsh = {
		enable = true;

		shellAliases = {
			ls = "ls --color";
		};

		initContent = ''
			eval "$(oh-my-posh init zsh --config $HOME/.config/omp/zen.toml)"

			zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
			zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
			zstyle ':completion:*' menu no
			zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

			eval "$(fzf --zsh)"

			stty -ixon
			'';

		plugins = [
		{
			name = "zinit";
			src = pkgs.fetchFromGitHub {
				owner = "zdharma-continuum";
				repo = "zinit";
				rev = "main";
				sha256 = "sha256-wmNk0HIqwayU2ISbn6vzDetbM2TWmSn4CZzJNpR8E+s=";
			};
		}
		];
	};
}
