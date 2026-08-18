{pkgs, config, lib, ...}:
{
  options.custom.guipkgs = {
    enable = lib.mkEnableOption "GUI system packages";
    wireshark.enable = lib.mkEnableOption "Wireshark";
  };

  config = {
    systemPackages = let guipkconf = config.custom.guipkgs; in with pkgs;[
    ] ++ lib.optional guipkconf.wireshark.enable wireshark;
  };
}
