{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  imports = [
    ./crush
    ./fish
    ./gnome
    ./helix
    ./jj
    ./kitty
    ./neovim
    ./oh-my-posh
    ./starship
    ./stylix
    ./secrets.nix
    ./git
    ./gh
    ./pwa
  ];

  custom = {
    crush.enable = true;
    fish.enable = true;
    gh.enable = true;
    gnome.enable = osConfig.custom.gnome.enable;
    helix.enable = true;
    jj.enable = true;
    kitty.enable = osConfig.hostConfig.GUI;
    neovim.enable = true;
    oh-my-posh.enable = false;
    starship.enable = true;
    stylix.enable = true;
    git.enable = true;
    pwa.enable = true;
  };

  home.username = "wd40bug";
  home.homeDirectory = "/home/wd40bug";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages =
    with pkgs;
    [
      clang-tools
      ripgrep
      zoxide
      bat
      go
      charm-freeze
      luarocks
      taplo
      jetbrains-mono
      fastfetch
    ]
    ++ lib.optionals osConfig.hostConfig.GUI [
      discord
      freecad
      godot
      blender
      onlyoffice-desktopeditors
      signal-desktop
    ];

  programs.firefox = {
    enable = osConfig.hostConfig.GUI;
  };

  xdg.enable = true;

  programs.home-manager.enable = true;
}
