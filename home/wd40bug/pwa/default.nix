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

    nixpkgs.overlays = [
      (final: prev: {
        firefoxpwa = prev.firefoxpwa.overrideAttrs (oldAttrs: {
          postInstall = (oldAttrs.postInstall or "") + ''
            mkdir -p $out/lib/firefoxpwa
            touch $out/lib/firefoxpwa/is-packaged-app
          '';
        });
      })
    ];

    programs.firefox.nativeMessagingHosts = [ pkgs.firefoxpwa ];
  };
}
