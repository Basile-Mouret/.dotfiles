# ~/.dotfiles/nixos/flake.nix

{
  description = "Basile's NixOS Flake";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      # Make sure home-manager's nixpkgs input follows the one from your system
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.zephyrus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        # This line is crucial and was likely missing or incorrect.
        # It loads all the necessary Home Manager options.
        home-manager.nixosModules.default
      ];
    };
  };
}
