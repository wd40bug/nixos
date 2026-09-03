{
  pkgs,
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
            name = "Outlook";
            url = "https://outlook.cloud.microsoft/mail";
            manifestUrl = "https://outlook.cloud.microsoft/mail/manifests/pwa.json?culture=en";
            desktopEntry.icon = pkgs.fetchurl {
              url = "https://res.public.onecdn.static.microsoft/assets/mail/pwa/v4/pngs/Outlook.48x48x32.png";
              hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
            };
          };
        };
        "01M1KR8XS8ESHDP3XY0QTTTN5V".sites = lib.mkIf config.custom.pwa.chat {
          "01M1KRFMACWXRVBYD6J2QZACFE" = {
            name = "Google Chat";
            url = "https://chat.google.com/app/home";
            manifestUrl = "https://chat.google.com/u/0/manifest.json";
            desktopEntry.icon = pkgs.fetchurl {
              url = "https://ssl.gstatic.com/dynamite/images/favicons_20260602/chat_2026_logo_favicon_no_dot_64px.png";
              hash = "sha256-DgLjgCYkkIAT3P5WIaCR6SrNd30asp4PDeRQclsPsEo=";
            };
          };
        };
      };
    };
  };
}
