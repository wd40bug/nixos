{config, lib, ...}:
{
  options.custom.wireshark.enable = lib.mkEnableOption "Custom Wireshark Module";

  config = lib.mkIf config.custom.wireshark.enable {
    programs.wireshark = {
      enable = true;
    };
  };
}
