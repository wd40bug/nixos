{
  nixpkgs,
  nixos-wsl,
  home-manager,
}:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    nixos-wsl.nixosModules.default
    {
      system.stateVersion = "26.05";
      wsl.enable = true;
      wsl.defaultUser = "wd40bug";
    }
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.wd40bug = ./home/wd40bug/home.nix;
    }
    ./configuration.nix
  ];
}
