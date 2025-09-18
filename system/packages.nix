{ pkgs, host, ... }: {
  environment.systemPackages = with pkgs;
    [
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
    ] ++ (if host.isGraphical then [
      # Apps
      vlc
      logseq
      vscode-fhs
      baobab
      keepassxc

      # GStreamer
      go2rtc
      gst_all_1.gstreamer
      # Common plugins like "filesrc" to combine within e.g. gst-launch
      gst_all_1.gst-plugins-base
      # Specialized plugins separated by quality
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      # Plugins to reuse ffmpeg to play almost every video format
      gst_all_1.gst-libav
      # Support the Video Audio (Hardware) Acceleration API
      gst_all_1.gst-vaapi

    ] else
      [ ]);
}
