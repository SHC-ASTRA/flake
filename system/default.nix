{ config, host, ... }: {
  imports = [ ./configuration.nix ./packages.nix ./network.nix ]
    ++ (if host.isGraphical then [ ./graphical ] else [ ]);
  
  boot.extraModulePackages = [
    config.boot.kernelPackages.rtl88xxau-aircrack
  ];
}
