{lib, config, pkgs, ...}: {
  options.custom.embedded = {
    enable = lib.mkEnableOption "Enable Embedded Module";
    tangnano.enable = lib.mkEnableOption "Enable Tang Nano 20k";
  };

  config = lib.mkIf config.custom.embedded.enable (with config.custom.embedded;{
    users.groups.dialout.members = ["wd40bug"];

    environment.systemPackages = lib.mkIftangnano.enable [pkgs.openfpgaloader];

    hardware.openfpgaloader.enable = tangnano.enable;
  });
}
