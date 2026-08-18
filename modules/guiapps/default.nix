{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.custom.guiapps = {
    enable = lib.mkEnableOption "GUI system packages";
    wireshark.enable = lib.mkEnableOption "Wireshark";
  };

  config = {
    systemPackages =
      let
        guiappconf = config.custom.guipkgs;
      in
      with pkgs;
      [
      ]
      ++ lib.optional guiappconf.wireshark.enable wireshark;
  };
}
