{lib, config, ...}: {
  options.custom.embedded = {
    enable = lib.mkEnableOption "Enable Embedded Module";
    tangnano.enable = lib.mkEnableOption "Enable Tang Nano 20k";
  };

  config = lib.mkIf config.custom.embedded.enable {
    users.groups.dialout.members = ["wd40bug"];
  };
}
