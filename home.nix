{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true; # required for vscode to be installed

  home = {
    username = "astra";
    homeDirectory = "/home/astra";

    # please read home manager release notes and docs before changing!
    stateVersion = "24.11";

    packages = with pkgs; [
      firefox
      ghostty
      vscode
      keepassxc
      discord
      vim
      colcon
      vlc
    ] ++ (with pkgs.rosPackages.humble; [
      ros-core
    ]); # end packages

    pointerCursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 48;
      gtk.enable = true;
      x11.enable = true;
    }; # end pointerCursor

    file = {
    };

    sessionVariables = {
    };
  }; # end home

  qt = {
    enable = true;
  }; # end qt

  gtk = {
    enable = true;
    cursorTheme = {
      name = "phinger-cursors-light";
      size = 48;
    };
    iconTheme = {
      name = "Papirus-Dark";
    };
  }; # end gtk

  programs = {
    # let home manager manage itself
    home-manager.enable = true;
  }; # end programs

  wayland = {
    windowManager = {
      sway = {
        enable = true;
        checkConfig = true;

        config = {

        }; # end config
      }; # end sway
    }; # end windowManager
  }; # end wayland
}
