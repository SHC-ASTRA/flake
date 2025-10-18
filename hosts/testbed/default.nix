{ config, ... }:
{
  imports = [
    ./hardware.nix
    ./network.nix
  ];
}
