{ lib, config, ... }:
{
  options.custom.gh.enable = lib.mkEnableOption "Enable gh configuration";
  config = lib.mkIf config.custom.gh.enable {
    xdg.configFile."gh" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/gh/gh";
      recursive = true;
    };
  };
}
