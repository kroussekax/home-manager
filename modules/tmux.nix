{ config, pkgs, ... }:

let
  colors = builtins.fromJSON (builtins.readFile /home/kax/.cache/ambxst/colors.json);
in
{
	programs.tmux = {
		enable = true;
		terminal = "screen-256color";
		extraConfig = ''
			set -g status on
			set -g status-position top

			set -g @rose_pine_variant "main"
			set -g @rose_pine_transparent_background "on"

			set -g pane-border-style fg=${colors.surfaceBright} 
			set -g pane-active-border-style fg=${colors.surfaceBright}

			setw -g mode-keys vi
			set -g mouse on

			bind h select-pane -L
			bind j select-pane -D
			bind k select-pane -U
			bind l select-pane -R

			bind-key Space command-prompt -p "Switch to session: " "switch-client -t '%%'"
			bind-key e command-prompt -p "New session name:" "new-session -s '%%'"

			unbind n
			bind n next-window

			set -g prefix2 C-s

			unbind r
			bind r source-file ~/.config/tmux/tmux.conf
			'';

		plugins = with pkgs.tmuxPlugins; [
			sensible
				vim-tmux-navigator
				yank
				resurrect
				rose-pine
		];
	};
}

