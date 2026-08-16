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
    ./gh
    ./gnome
    ./helix
    ./jj
    ./kitty
    ./neovim
    ./oh-my-posh
    ./starship
    ./stylix
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
  };

  home.username = "wd40bug";
  home.homeDirectory = "/home/wd40bug";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages =
    with pkgs;
    [
      fish
      gh
      clang-tools
      ripgrep
      starship
      starship-jj
      jujutsu
      zoxide
      bat
      helix
      go
      charm-freeze
      luarocks
      taplo
      jetbrains-mono
      fastfetch
    ]
    ++ lib.optionals osConfig.hostConfig.GUI [ discord ];

  programs.firefox = {
    enable = osConfig.hostConfig.GUI;
  };

  xdg.enable = true;

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "William Dale";
        email = "wd40bug@gmail.com";
      };
    };
  };
}
