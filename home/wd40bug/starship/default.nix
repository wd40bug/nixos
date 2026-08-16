{lib, config, ...}:
{
  options.custom.starship.enable = lib.mkEnableOption "Enable starship configuration";
  config = lib.mkIf config.custom.starship.enable {
    xdg.configFile = {
      "starship.toml" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/starship/starship.toml";
        recursive = true;
      };
      "starship-jj" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/starship/starship-jj";
        recursive = true;
      };
    };
  };
}
