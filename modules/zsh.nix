{ pkgs, config, ...}:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			ls = "ls --color";
		};

		initContent = ''
			autoload -Uz compinit
			compinit -C

			zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

			autoload -Uz edit-command-line
			zle -N edit-command-line

			bindkey '^E' edit-command-line

			if command -v fzf >/dev/null; then
				source <(fzf --zsh)
			fi'';
	};
}
