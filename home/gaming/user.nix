# NOTE: This is system-level not home-manager level
{config, lib, ...}:
{
  options.custom.users.wd40bug = {
    enable = lib.mkEnableOption "Enable gaming user";
  };

  config = lib.mkIf config.custom.users.wd40bug.enable {
    users.users.gaming = {
      isNormalUser = true;
      description = "Gaming Account";
      extraGroups = [
        "networkManager"
        "wheel"
      ];
    };
  };
}
