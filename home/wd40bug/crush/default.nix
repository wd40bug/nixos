{ lib, config, ... }:
{
  options.custom.crush.enable = lib.mkEnableOption "Enable crush configuration";
  config = lib.mkIf config.custom.crush.enable {
    xdg.configFile."crush" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/crush/crush";
      recursive = true;
    };
  };
}
