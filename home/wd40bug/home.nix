{ config, pkgs, lib, osConfig, ... }:
let
dotfilesConfig = "/etc/nixos/home/wd40bug/dotfiles/dot_config";
symlink = config.lib.file.mkOutOfStoreSymlink;
basic_conf = name : {
  source = symlink "${dotfilesConfig}/${name}";
  recursive = true;
};
in
{
  imports = [
    ./neovim
    ./kitty
    ./gnome
  ];

  custom = {
    neovim.enable = true;
    kitty.enable = osConfig.hostConfig.GUI;
    gnome.enable = osConfig.custom.gnome.enable;
  };
  
  home.username = "wd40bug";
  home.homeDirectory = "/home/wd40bug";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs;[
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
  ] ++ lib.optionals osConfig.hostConfig.GUI [discord];

  programs.firefox = {
    enable = osConfig.hostConfig.GUI;
  };

  xdg.enable = true;
  xdg.configFile = {
    "starship.toml" = {
      source = symlink "${dotfilesConfig}/starship.toml";
    };
    "starship-jj" = basic_conf "starship-jj";
    "fish" = basic_conf "fish";
    "gh" = basic_conf "gh";
    "crush" = basic_conf "crush";
    "helix" = basic_conf "helix";
    "jj" = basic_conf "jj";
  };

  xdg.desktopEntries."Helix" = {
    name = "Helix";
    noDisplay = true;
    exec = "hx %F";
    icon = "helix";
    terminal = true;
    type = "Application";
  };

  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -t 1 ]; then
        exec fish
      fi
    '';
  };

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
