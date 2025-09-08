{ pkgs, ... }:
with pkgs;
[
  # System
  baobab
  ffmpeg
  ghostty
  keepassxc

  # Programming
  gh
  git
  pkgs.dotnetCorePackages.sdk_9_0-bin

  # Creative
  vlc
  logseq
  neovim
  vscode-fhs

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
]
