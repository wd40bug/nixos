{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options.custom.pwa = {
    enable = lib.mkEnableOption "Enable PWAs";
    chat = lib.mkEnableOption "Google Chat";
    outlook = lib.mkEnableOption "Outlook";
  };

  config = lib.mkIf config.custom.pwa.enable {
    # home.packages = with pkgs-unstable; [
    #   firefoxpwa
    # ];

    # programs.firefox.nativeMessagingHosts = [ pkgs-unstable.firefoxpwa ];

    programs.firefoxpwa = {
      enable = true;
      package = pkgs-unstable.firefoxpwa;
      profiles = {
        "01M1KQHK9PAEYS7J9419CPAVVA".sites = lib.mkIf config.custom.pwa.outlook {
          "01M1KQJ28CV0S3JDWZK1C3AN94" = {
            manifestURL = "https://outlook.cloud.microsoft/mail/manifests/pwa.json?culture=en";
          };
        };
      };
    };
  };
}
