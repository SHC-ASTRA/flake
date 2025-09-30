{ ... }: {
  networking = {
    # Firewall needs to be disabled
    firewall.enable = false;
    # Enable networking
    networkmanager.enable = true;
  };

  # Doesn't actually work for some reason.
  systemd.network.wait-online.timeout = 5;
}
