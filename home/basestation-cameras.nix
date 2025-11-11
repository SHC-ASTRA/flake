{ inputs, pkgs, host, ... }:
# Only install basestation-cameras if we have a graphical system
if host.isGraphical then
{
  home.packages = [
    inputs.basestation-cameras.packages.${pkgs.system}.default
    inputs.basestation-cameras.packages.${pkgs.system}.cameracli
    inputs.basestation-cameras.packages.${pkgs.system}.launch-cameras
  ];
}
else
  { }
