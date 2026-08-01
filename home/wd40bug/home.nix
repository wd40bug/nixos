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
  ] ++ import ./neovim.nix pkgs {} ++ lib.optionals osConfig.hostConfig.GUI [discord];

  programs.kitty = {
    enable = osConfig.hostConfig.GUI;
    # Your existing settings...
    extraConfig = ''
      # Force Kitty's built-in Nerd Font for symbols, bypassing DejaVu
      symbol_map U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono

      # Force symbols to take up 2 terminal cells so they render thicker/larger
      narrow_symbols U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 2

      placement_strategy top-left
      editor nvim
      shell fish
      hide_window_decorations yes
      map ctrl+shift+d launch --cwd=current --type=tab
      map ctrl+shift+enter new_window_with_cwd 
      enabled_layouts tall, horizontal
      map ctrl+shift+tab focus_visible_window
      map ctrl+shift+left neighboring_window left
      map ctrl+shift+right neighboring_window right
      map ctrl+shift+up neighboring_window top
      map ctrl+shift+down neighboring_window bottom

      map ctrl+alt+right next_tab
      map ctrl+alt+left previous_tab
      # BEGIN_KITTY_FONTS
      font_family      family="JetBrains Mono"
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      # END_KITTY_FONTS
    '';
  };

  programs.firefox = {
    enable = osConfig.hostConfig.GUI;
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
    enable = "gnome" == osConfig.hostConfig.desktop;
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
