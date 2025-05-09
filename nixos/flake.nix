{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nix-desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs home-manager;}; # Pass home-manager here
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager # Add home-manager module for NixOS
      ];
    };
    # Add a homeConfigurations output
    homeConfigurations."chris" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux; # or your system
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ../home-manager/home.nix # Path to your home-manager configuration
      ];
    };
  };
}
