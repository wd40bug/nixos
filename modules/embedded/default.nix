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

      users.groups.plugdev.members = lib.mkIf tangnano.enable ["wd40bug"];
    }
  );
}
