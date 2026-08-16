{ lib, config, ... }:
{
  options.custom.helix.enable = lib.mkEnableOption "Enable helix configuration";
  config = lib.mkIf config.custom.helix.enable {
    xdg.configFile."helix" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/helix/helix";
      recursive = true;
    };

    xdg.desktopEntries."Helix" = {
      name = "Helix";
      noDisplay = true;
      exec = "hx %F";
      icon = "helix";
      terminal = true;
      type = "Application";
    };
  };

}
