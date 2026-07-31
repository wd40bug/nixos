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
    luajit
    taplo
    jetbrains-mono
  ] ++ lib.optionals osConfig.hostConfig.GUI [kitty];

  programs.firefox = {
    enable = osConfig.hostConfig.GUI;
  };

  home.file = {
    "dotfiles/dot_config/nvim/lua/system.lua" = {
      text = ''
        Os = "linux";
	System = "nixos";
      '';
    };
  };

  xdg.configFile = {
    "nvim" = basic_conf "nvim";
    "starship.toml" = {
      source = symlink "${dotfilesConfig}/starship.toml";
    };
    "starship-jj" = basic_conf "starship-jj";
    "fish" = basic_conf "fish";
    "gh" = basic_conf "gh";
    "crush" = basic_conf "crush";
    "helix" = basic_conf "helix";
    "jj" = basic_conf "jj";
    "kitty" = basic_conf if osConfig.hostConfig.GUI then basic_conf "kitty" else null;
  };

  home.sessionVariables = {
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

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "blue";
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "ctrl:nocaps" ];
    };
  }; 

}
