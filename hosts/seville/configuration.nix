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
    ./../../modules/guiapps
  ];

  config = let 
    secrets = builtins.fromJSON (builtins.readFile ../../secrets/secrets.json);
  in{
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
    };

    users.mutableUsers = false;

    users.users.wd40bug = {
      isNormalUser = true;
      description = "William Dale";
      extraGroups = [
        "networkmanager"
        "wheel"
        "wireshark"
      ];
      hashedPassword = secrets.passwords.wd40bug;
    };
  };

}
