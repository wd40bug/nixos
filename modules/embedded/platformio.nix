{ config, pkgs, lib, ... }:
{
  options.custom.embedded.platformio.enable = lib.mkEnableOption "Platformio configuration";
  config = lib.mkIf config.custom.platformio.enable {
    environment.systemPackages = [
      pkgs.platformio
      pkgs.avrdude
    ];

    services.udev.packages = [
      pkgs.platformio-core
      pkgs.openocd
    ];
  };
}
