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
      profiles."01M1KQHK9PAEYS7J9419CPAVVA".sites = {
        "01M1KQJ28CV0S3JDWZK1C3AN94" = {
          url = "outlook.cloud.microsoft";
        };
      };
    };
  };
}
