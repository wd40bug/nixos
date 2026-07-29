{ config, lib, ... }: {

  options.hostConfig = lib.mkOption{
    type = lib.types.attrsOf lib.types.anything;
    default = {};
    description = "Custom host metadata passed to Home Manager";
  };

  config = {
    hostConfig = {
      GUI = true;
      hostName = "Madrid";
    };
    networking.hostName = "madrid";
  };
}
