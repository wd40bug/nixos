{
  ...
}:
{

  imports = [
    ./hardware-configuration.nix
    ./stylix
    ./../../modules/gnome.nix
    ./../../modules/xserver.nix
    ./../../modules/core
    ./../../modules/wireshark.nix
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
      wireshark.enable = true;
    };

    users.users.wd40bug = {
      isNormalUser = true;
      description = "William Dale";
      extraGroups = [
        "networkmanager"
        "wheel"
        "wireshark"
      ];
    };
  };

}
