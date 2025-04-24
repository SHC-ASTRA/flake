{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true; # required for vscode to be installed

  home = {
    username = "astra";
    homeDirectory = "/home/astra";

    # please read home manager release notes and docs before changing!
    stateVersion = "24.11";

    packages = with pkgs; [
      ghostty
      vscode
      keepassxc
      discord
      vim
    ];

    file = {
    };

    sessionVariables = {
    };
  }; # end home

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
