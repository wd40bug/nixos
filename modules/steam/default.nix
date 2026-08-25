{config, lib, ...}:
{
  options.custom.steam.enable = lib.mkEnableOption "Custom Steam setup";

  config = lib.mkIf config.custom.steam.enable {
    programs.steam = {
      enable = true;
      gamescopeSession = true;
    };

    programs.gamemode = {
      enable = true;
    };
  };
}
