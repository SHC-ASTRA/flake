{ pkgs, ... }: {
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    elisa
    okular
    oxygen
    gwenview
  ];

  services = {
    xserver.enable = false;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
