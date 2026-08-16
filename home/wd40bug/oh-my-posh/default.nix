{ lib, config, ... }:
{
  options.custom.oh-my-posh.enable = lib.mkEnableOption "Enable oh-my-posh configuration";
  config = lib.mkIf config.custom.oh-my-posh.enable {
    home.file."mytheme.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/oh-my-posh/mytheme.toml";
      recursive = true;
    };
  };
}
