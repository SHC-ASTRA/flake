{ config, pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./network.nix
  ];
  environment.systemPackages = with pkgs; [
    zed-editor
  ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.rtl88xxau-aircrack
  ];
}
