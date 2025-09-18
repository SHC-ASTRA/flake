{ host, ... }: {
  imports = [ ./configuration.nix ./packages.nix ]
    ++ (if host.isGraphical then [ ./graphical ] else [ ]);
}
