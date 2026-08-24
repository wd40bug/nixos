{config, lib, ...}:
{
  options.custom.git.enable = lib.mkEnableOption "Custom git config";

  config = lib.mkIf config.custom.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "William Dale";
          email = "wd40bug@gmail.com";
        };
      };
    };
  };
}
