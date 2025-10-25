{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System
    gh
    socat
    usbutils
    silver-searcher

    # Programming
    nil
    nixd
    neovim
    ripgrep
    nixfmt-rfc-style
    tmux

    # Build stuff
    gcc
    colcon
    gnumake
    python312Packages.pyserial
  ];
}
