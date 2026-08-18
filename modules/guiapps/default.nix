{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.custom.guiapps = {
    enable = lib.mkEnableOption "GUI system packages";
    wireshark.enable = lib.mkEnableOption "Wireshark";
    wireshark.users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "Users to put in the Wireshark group";
    };
  };

  config =
    let
      guiappconf = config.custom.guiapps;
    in
    lib.mkIf guiappconf.enable {
      environment.systemPackages =
        with pkgs;
        [
        ]
        ++ lib.optional guiappconf.wireshark.enable wireshark;

      users.groups.wireshark.members = guiappconf.wireshark.users;
    };
}
