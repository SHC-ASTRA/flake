{ ... }:
{
  networking = {
    # Firewall needs to be disabled
    firewall.enable = false;
    # Enable networking
    networkmanager.enable = true;
  };
}
