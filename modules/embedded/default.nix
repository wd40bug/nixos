{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.custom.embedded = {
    enable = lib.mkEnableOption "Enable Embedded Module";
    tangnano.enable = lib.mkEnableOption "Enable Tang Nano 20k";
  };

  config = lib.mkIf config.custom.embedded.enable (
    with config.custom.embedded;
    {
      users.groups.dialout.members = [ "wd40bug" ];

      services.udev.packages = lib.mkIf tangnano.enable [
        pkgs.openfpgaloader
      ];

      users.groups.plugdev.members = lib.mkIf tangnano.enable [ "wd40bug" ];

      users.groups.tty.members = lib.mkIf tangnano.enable [ "wd40bug" ];

      services.udev.extraRules = lib.mkIf tangnano.enable ''
        # Sipeed / Bouffalo Lab BL702 (Tang Nano 20k)
        SUBSYSTEM=="usb", ATTR{idVendor}=="303a", ATTR{idProduct}=="1001", MODE="0666", GROUP="dialout"
        SUBSYSTEM=="usb", ATTR{idVendor}=="303a", ATTR{idProduct}=="1002", MODE="0666", GROUP="dialout"

        # Standard FTDI fallback
        SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6010", MODE="0666", GROUP="dialout"
      '';
    }
  );
}
