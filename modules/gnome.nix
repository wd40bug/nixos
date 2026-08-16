{
  config,
  lib,
  ...
}:

{

  imports = [
    ./stylix
  ];

  options.custom.gnome = {
    enable = lib.mkEnableOption "Gnome Setup";
  };

  config = lib.mkIf config.custom.gnome.enable {
    custom.stylix.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };

}
