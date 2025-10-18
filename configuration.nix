{ ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # DO NOT CHANGE THIS
  system.stateVersion = "25.05"; # Did you read the comment?

}
