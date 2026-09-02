{ lib, config, ... }:
{
  options.custom.gh.enable = lib.mkEnableOption "Enable gh configuration";
  options.custom.secrets.github.PAT = lib.mkOption {
    type = lib.types.str;
    description = "Github Personal Access Token";
  };

  config = lib.mkIf config.custom.gh.enable {
    programs.gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
        hosts = [
          "github.com"
          "gist.github.com"
        ]; # Optional: defaults to github.com
      };
    };

    home.sessionVariables = {
      GH_TOKEN = config.custom.secrets.github.PAT;
    };
  };
}
