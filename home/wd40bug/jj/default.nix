{ lib, config, ... }:
{
  options.custom.jj.enable = lib.mkEnableOption "Enable jj configuration";
  config = lib.mkIf config.custom.jj.enable {
    xdg.configFile."jj" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/jj/jj";
      recursive = true;
    };
  };
}
