{ config, lib, ... }:
{

  imports = [
    ./../../modules/core
  ];

  hostConfig = {
    GUI = true;
    hostName = "madrid";
  };
}
