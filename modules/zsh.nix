{ pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		package = pkgs.zsh;

		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			ls = "ls --color";
		};

		initContent = ''
			autoload -Uz edit-command-line
			zle -N edit-command-line

			zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

			if command -v fzf >/dev/null; then
				source <(fzf --zsh)
					fi
					'';
	};
}
