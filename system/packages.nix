{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ffmpeg
    nixfmt
    nil
    gh
    socat

    git
    pkgs.dotnetCorePackages.sdk_9_0-bin
    ripgrep
    silver-searcher
    neovim
    fastfetch

    # build stuff
    colcon
    python312Packages.pyserial
    gnumake
    gcc
  ];
}
