# NOTE: This is system-level not home-manager level
{config, lib, ...}:
{
  options.custom.users.wd40bug = {
    enable = lib.mkEnableOption "Enable wd40bug user";
  };

  options.custom.secrets.passwords.wd40bug = lib.mkOption {
    type = lib.types.str;
    description = "Hashed password value for wd40bug user";
  };

  config = {
    users.users.wd40bug = {
      isNormalUser = true;
      description = "William Dale (main profile)";
      extraGroups = [
        "networkManager"
        "wheel"
      ];
      hashedPassword = config.custom.secrets.passwords.wd40bug;
    };
  };
}
