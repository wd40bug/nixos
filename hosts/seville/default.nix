{nixpkgs, home-manager}:
nixpkgs.lib.nixosSystem {
  system = "x86_64";
  modules = [
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.wd40bug = ./../../home/wd40bug/home.nix;
    }
    ./configuration.nix
  ];
}
