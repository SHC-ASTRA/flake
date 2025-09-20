{ host, ... }: {
  imports = [ ./configuration.nix ./packages.nix ./network.nix ]
    ++ (if host.isGraphical then [ ./graphical ] else [ ]);
}
