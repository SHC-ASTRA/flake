{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System
    gh
    git
    socat
    usbutils
    silver-searcher

    # Programming
    nil
    nixd
    nixfmt
    neovim
    ripgrep

    # Build stuff
    gcc
    colcon
    gnumake
    python312Packages.pyserial
  ];
}
