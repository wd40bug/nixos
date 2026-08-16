{
  config,
  lib,
  osConfig,
  ...
}:
{
  options.custom.stylix.enable = lib.mkEnableOption "Home-level stylix";

  config = lib.mkIf config.custom.stylix.enable {
    stylix = {
      enable = true;
      targets.firefox.profileNames = lib.optional osConfig.hostConfig.GUI "default";
    };
  };
}
