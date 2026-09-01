{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
  ];

  options.custom.gnome = {
    enable = lib.mkEnableOption "Gnome Setup";
  };

  config = lib.mkIf config.custom.gnome.enable {
    custom.stylix.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    programs.gnome-shell.extensions = [
      pkgs.gnomeExtensions.accent-icons-theme
    ];
  };

}
