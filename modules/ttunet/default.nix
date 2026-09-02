{config, lib, ...}: {
  options.custom.ttunet.enable = lib.mkEnableOption "Enable ttuNET configuration";
  options.custom.secrets.TTUnet.password = lib.mkOption {
    type = lib.types.str;
    description = "TTUnet password";
  };
  options.custom.secrets.TTUnet.username = lib.mkOption {
    type = lib.types.str;
    description = "TTUnet username";
  };

  config = lib.mkIf config.custom.ttunet.enable {
    networking.networkmanager.ensureProfiles.profiles = {
      "TTUnet" = {
        connection = {
          id = "TTUnet";
          type = "wifi";
          interface-name = "wlp0s20f3";
        };
        wifi = {
          mode = "infrastructure";
          ssid = "TTUnet";
        };
        wifi-security = {
          key-mgmt = "wpa-eap";
        };
        "802-1x" = {
          eap = "peap";
          phase2-auth = "mschapv2";
          domain = "ttu.edu";
          identity = config.custom.secrets.TTUnet.username;
          password = config.custom.secrets.TTUnet.password;
          # Bypasses the handshake drop by binding NixOS's system cert store
          ca-cert = "/etc/ssl/certs/ca-bundle.crt"; 
        };
      };
    };
  };
}
