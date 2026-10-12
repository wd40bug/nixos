{config, pkgs, lib, ...}: {
  options.custom.embedded.kingst.enable = lib.mkEnableOption "Kingst Embedded";

  config = lib.mkIf config.custom.embedded.kingst.enable {
    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="77a1", MODE="0666", GROUP="plugdev"
    '';

    environment.systemPackages = with pkgs;[
      kingstvis
      pulseview
      sigrok-cli
    ];
  };
}
