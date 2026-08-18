{
  ...
}:
{

  imports = [
    ./hardware-configuration.nix
    ./stylix
    ./../../modules/gnome.nix
    ./../../modules/xserver.nix
    ./../../modules/secrets.nix
    ./../../modules/core
    ./../../modules/guiapps
    ./../../home/wd40bug/user.nix
  ];

  config = {
    hostConfig = {
      GUI = true;
      hostName = "seville";
    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    custom = {
      gnome = {
        enable = true;
      };
      xserver = {
        enable = true;
      };
      guiapps = {
        enable = true;
        wireshark.enable = true;
      };
      users = {
        wd40bug.enable = true;
      };
    };

    users.mutableUsers = false;
  };

}
