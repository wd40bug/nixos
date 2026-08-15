{ lib, config, ... }:
{
  options.custom.gnome.enable = lib.mkEnableOption "Custom GNOME configuration";

  config = lib.mkIf config.custom.gnome.enable {
    xdg.desktopEntries = {
      "org.gnome.Tour" = {
        name = "Tour";
        noDisplay = true;
      };
      "org.gnome.Documentation" = {
        name = "Help";
        noDisplay = true;
      };
      "epiphany" = {
        name = "Web";
        noDisplay = true;
      };
      "org.gnome.Maps" = {
        name = "Maps";
        noDisplay = true;
      };
      "org.gnome.Console" = {
        name = "Console";
        noDisplay = true;
      };
    };

    dconf = {
      enable = true;
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
        "org/gnome/shell" = {
          favorite-apps = [
            "firefox.desktop"
            "kitty.desktop"
            "discord.desktop"
            "org.gnome.Nautilus.desktop"
          ];
        };
      };
    };
  };
}
