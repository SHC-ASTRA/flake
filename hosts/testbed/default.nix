{ config, ... }:
{
  imports = [
    ./hardware.nix
    ./network.nix
  ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.rtl88xxau-aircrack
  ];
}
