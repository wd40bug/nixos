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

  outputs =
    {
      nixpkgs,
      nixos-wsl,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        madrid = import ./hosts/madrid {inherit nixpkgs nixos-wsl home-manager;};
        seville = import ./hosts/seville {inherit nixpkgs home-manager;};
      };
    };
}
