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
      base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
      polarity = "dark";
      targets = {
        gnome.enable = true;
        fish.override = {
          base01 = "ffffff";
        };
      };
    };
  };
}
