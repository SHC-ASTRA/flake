{ inputs, pkgs, host, ... }:
# only install zen browser if we have a graphical system
if host.isGraphical then
{
  home.packages = [
    inputs.basestation-cameras.packages.${pkgs.system}.default
  ];
}
else
  { }
