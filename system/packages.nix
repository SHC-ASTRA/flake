{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # System
    gh
    git
    socat
    silver-searcher

    # Programming
    nil
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
