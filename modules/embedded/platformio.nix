{ config, pkgs, lib, ... }:
{
  options.custom.embedded.platformio.enable = lib.mkEnableOption "Platformio configuration";
  config = lib.mkIf config.custom.embedded.platformio.enable {
    environment.systemPackages = [
      pkgs.platformio-core
      pkgs.avrdude
    ];

    services.udev.packages = [
      pkgs.platformio-core.udev
      pkgs.openocd
    ];
  };
}
