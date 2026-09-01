{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.custom.stylix.enable = lib.mkEnableOption "Custom Stylix Setup";

  config = lib.mkIf config.custom.stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";
      override = {
        base02 = "555555";
      };
      image = ./inna.jpg;
      targets.grub.enable = true;
      targets.grub.useWallpaper = true;
      targets.qt.platform = lib.mkForce "qtct";
    };

    environment.systemPackages = with pkgs; [
      gnomeExtensions.accent-icons-theme
    ];
  };
}
