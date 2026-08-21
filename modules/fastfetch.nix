{ config, ... }:
{
	programs.fastfetch = {
		enable = true;
		settings = {
			"$schema"= "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

			"logo" = {
				"type" = "small";
			};

			"display" = {
				"separator" = "→\t";
				"color" = {
					"separator" = "red";
				};
			};

			"modules" = [
				"title"
				"separator"
				{ "type" = "os"; "key" = "OS      "; "format" = "{name}"; }

				{ "type" = "host"; "key" = "Host    "; "format" = "{family}"; }

				{ "type" = "kernel"; "key" = "Kernel  "; }

				{ "type" = "wm"; "key" = "WM      "; }

				{ "type" = "cpu"; "key" = "CPU     "; }

				{ "type" = "memory"; "key" = "Memory  "; }

				"break"

				{ "type" = "colors"; "paddingLeft" = 6; "symbol" = "circle"; }
			];
		};
	};
}
