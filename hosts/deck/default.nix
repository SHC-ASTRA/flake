{ config, pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./network.nix
  ];
  environment.systemPackages = with pkgs; [
    zed-editor
  ];
}
