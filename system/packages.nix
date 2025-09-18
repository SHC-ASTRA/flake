{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ffmpeg
    nixfmt
    gh
    git
    pkgs.dotnetCorePackages.sdk_9_0-bin
    ripgrep
    silver-searcher
    neovim

    # build stuff
    colcon
    python312Packages.pyserial
    gnumake
    gcc
  ];
}
