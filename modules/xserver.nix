{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ];

  options.custom.xserver = {
    enable = lib.mkEnableOption "Xserver enable";
  };

  config = lib.mkIf config.custom.xserver.enable {
    services.xserver.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    services.xserver.excludePackages = [ pkgs.xterm ];
  };

}
