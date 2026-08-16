{lib, config, ...}:
{
  options.custom.fish.enable = lib.mkEnableOption "Enable fish configuration";
  config = lib.mkIf config.custom.fish.enable {
    xdg.configFile."fish" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/fish/fish";
      recursive = true;
    };
  };
}
