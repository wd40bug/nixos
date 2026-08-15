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
  ];

  custom = {
    neovim.enable = true;
    kitty.enable = true;
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

  dconf = {
    enable = osConfig.custom.gnome.enable;
    settings = {
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
        color-scheme = "prefer-dark";
        clock-format = "12h";
        clock-show-weekday = true;
      };
      "org/gnome/desktop/input-sources" = {
        xkb-options = [ "caps:escape" ];
      };
      "org/gnome/settings-daemon/plugings/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>t";
        command = "kitty";
        name = "Open Kitty";
      };
      "org/gtk/settings/file-chooser" = {
        clock-format = "12h";
      };
      # "org/gnome/settings-daemon/plugings/media-keys/custom-keybindings" = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
    }; 
  };
}
