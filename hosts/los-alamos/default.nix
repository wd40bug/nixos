{nixpkgs, nixpkgs-unstable, home-manager, stylix}:
nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";
  modules = [
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.wd40bug = ./../../home/wd40bug/home.nix;
      home-manager.users.gaming = ./../../home/gaming/home.nix;
      home-manager.extraSpecialArgs = {pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};};
    }
    stylix.nixosModules.stylix
    ./configuration.nix
  ];
}
