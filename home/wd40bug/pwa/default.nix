{
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
    # home.packages = with pkgs-unstable; [
    #   firefoxpwa
    # ];

    # programs.firefox.nativeMessagingHosts = [ pkgs-unstable.firefoxpwa ];

    programs.firefoxpwa = {
      enable = true;
      profiles.default.sites = {
        outlook = {
          url = "outlook.cloud.microsoft";
        };
      };
    };
  };
}
