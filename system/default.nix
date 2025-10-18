{ host, ... }:
{
  imports = [
    ./configuration.nix
    ./packages.nix
    ./network.nix
    ./age.nix
  ]
  ++ (if host.isGraphical then [ ./graphical ] else [ ]);
}
