{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.custom.pwa = {
    enable = lib.mkEnableOption "Enable PWAs";
    chat = lib.mkEnableOption "Google Chat";
  };

  config = lib.mkIf config.custom.pwa.enable {
    home.packages = with pkgs; [
      firefoxpwa
    ];

    programs.firefox.nativeMessagingHosts = [pkgs.firefoxpwa];
  };
}
