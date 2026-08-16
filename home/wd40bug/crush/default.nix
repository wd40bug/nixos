{lib, config, ...}:
{
  options.custom.crush.enable = lib.mkEnableOption "Enable crush configuration";
  config = lib.mkIf config.custom.crush.enable {
    xdg.configFile = {
      "crush"."crush.json" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/crush/crush.json";
        recursive = true;
      };
    };
  };
}
