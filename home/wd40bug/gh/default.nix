{ lib, config, ... }:
{
  options.custom.gh.enable = lib.mkEnableOption "Enable gh configuration";
  options.custom.secrets.github.PAT = lib.mkOption {
    type = lib.types.str;
    description = "Github Personal Access Token";
  };

  config = lib.mkIf config.custom.gh.enable {
    xdg.configFile."gh" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/gh/gh";
      recursive = true;
    };

    home.sessionVariables = {
      GH_PAT = config.custom.secrets.github.PAT;
    };
  };
}
