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
      specialArgs = { inherit home-manager; }; # Pass home-manager to your modules
      modules = [
        ./configuration.nix

        # Add the home-manager module to your system
        home-manager.nixosModules.default
      ];
    };
  };
}
