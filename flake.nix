{
  description = "System configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=26.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, nixos-wsl, home-manager, ... }@inputs: {
    nixosConfigurations = {
      madrid = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default {
            system.stateVersion = "26.05";
            wsl.enable = true;
            wsl.defaultUser = "wd40bug";
          }
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wd40bug = ./home/wd40bug/home.nix;
          }
          ./modules/core.nix
          ./hosts/madrid
        ];
      };
      seville = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wd40bug = ./home/wd40bug/home.nix;
          }
          ./modules/core.nix
          ./hosts/seville
        ];
      };
    };
  };
}
