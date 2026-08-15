{config, lib, ...}: {
  options.hostConfig = {
    GUI = lib.mkOption {
      type = lib.types.bool;
      description = "Does the host support GUI applications";
    };
    hostName = lib.mkOption {
      type = lib.types.singleLineStr;
      description = "networking.hostName";
    };
  };

  config = {
    networking.hostName = config.hostConfig.hostName;
  };
}
