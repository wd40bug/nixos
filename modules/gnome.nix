{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [ ];

  options.custom.gnome = {
    enable = lib.mkEnableOption "Gnome Setup";
  };

  config = lib.mkIf config.custom.gnome.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };

}
