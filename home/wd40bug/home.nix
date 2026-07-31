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
  ] ++ lib.optionals osConfig.hostConfig.GUI [discord];

  programs.kitty = {
    enable = osConfig.hostConfig.GUI;
    # Your existing settings...
    extraConfig = ''
      # Force Kitty's built-in Nerd Font for symbols, bypassing DejaVu
      symbol_map U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono
    '';
  };

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
    "kitty" = if osConfig.hostConfig.GUI then basic_conf "kitty" else null;
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
