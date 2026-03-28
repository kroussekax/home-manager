{
	description = "Home Manager configuration of kax";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		flake-utils.url = "github:numtide/flake-utils";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			inputs = {
				nixpkgs.follows = "nixpkgs";
				home-manager.follows = "home-manager";
			};
		};

		spicetify-nix.url = "github:Gerg-L/spicetify-nix";
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs:
		let
		system = "x86_64-linux";
		pkgs = import nixpkgs {
		inherit system;
		config = {
				allowUnfree = true;
			};
		};
	in
	{
		homeConfigurations."kax" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = { inherit inputs; };

			modules = [
				./home.nix
			];
		};
	};
}
