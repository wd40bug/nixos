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
    programs.firefox.nativeMessagingHosts = [ pkgs-unstable.firefoxpwa ];

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
              url = "https://res.public.onecdn.static.microsoft/assets/mail/pwa/v4/pngs/Outlook.128x128x32.png";
              hash = "sha256-DGaxJuGazCnlqyK3lvCvjY/mvVzG51S6Bj2JIWlsbQM=";
            };
          };
        };
        "01M1KR8XS8ESHDP3XY0QTTTN5V".sites = lib.mkIf config.custom.pwa.chat {
          "01M1KRFMACWXRVBYD6J2QZACFE" = {
            name = "Google Chat";
            url = "https://chat.google.com/app/home";
            manifestUrl = "https://chat.google.com/u/0/manifest.json";
            desktopEntry.icon = pkgs.fetchurl {
              url = "https://ssl.gstatic.com/dynamite/images/favicons_20260602/chat_2026_logo_favicon_no_dot_256px.png";
              hash = "sha256-r5H4R6QFadGiYrC1Iw/O++J+MpGOU5XRKBVBvGwsbvw=";
            };
          };
        };
        "01M1KTWTR7RXZ0WYNMQPGBKHVY".sites = {
          "01M1KTXJCEK3Y89KRCDTK87610" = {
            name = "NixOS Search";
            url = "https://search.nixos.org";
            manifestUrl = "";
            desktopEntry.icon = pkgs.fetchurl {
              url = "https://search.nixos.org/images/nixos-logomark-default-gradient-none.svg";
              hash = "sha256-UL/Eyk/e7Yrfz8uR9MZwB80a+S4HC9CjixpW8tpJMvY=";
            };
          };
        };
      };
    };
  };
}
