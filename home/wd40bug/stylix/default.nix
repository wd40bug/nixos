{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.custom.stylix.enable = lib.mkEnableOption "Home-level stylix";

  config = lib.mkIf config.custom.stylix.enable {
    stylix = {
      enable = true;
      targets.firefox.profileNames = [ "default" ];
    };
  };
}
