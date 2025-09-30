{
  description = "Home Manager configuration of ASTRA";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
      follows = "nix-ros-overlay/nixpkgs";
    };
    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    basestation-cameras.url = "github:SHC-ASTRA/basestation-cameras";
  };

  outputs =
  # Ingests variables described in prior 'inputs' function (#4), outputs as 'inputs'
  inputs@{ self, nix-ros-overlay, nixpkgs, home-manager, zen-browser, basestation-cameras, ... }:
    let
      system = "x86_64-linux";
      username = "astra";

      # Sends 'inputs' variable (#21) to all hosts via specialArgs and extraSpecialArgs inside of mkHost.
      # Also identifies the global system configuration for packages.
      mkHost = import ./lib/mkHost.nix { inherit inputs system; };

      hostsConfig = {
        antenna = {
          ip = "192.168.1.33";
          isGraphical = false;
        };
        clucky = {
          ip = "192.168.1.69";
          isGraphical = false;
        };
        deck = {
          ip = "192.168.1.31";
          isGraphical = true;
        };
        panda = {
          ip = "192.168.1.32";
          isGraphical = true;
        };
        testbed = {
          ip = "192.168.1.70";
          isGraphical = false;
        };
      };

      # Copypaste section, aggregates previously defined information.
      hosts = {
        antenna = mkHost {
          name = "antenna";
          inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.antenna;
            hosts = hostsConfig;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.antenna;
            hosts = hostsConfig;
          };
          isGraphical = hostsConfig.antenna.isGraphical;
        };

        clucky = mkHost {
          name = "clucky";
          inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.clucky;
            hosts = hostsConfig;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.clucky;
            hosts = hostsConfig;
          };
          isGraphical = hostsConfig.clucky.isGraphical;
        };

        testbed = mkHost {
          name = "testbed";
          inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.testbed;
            hosts = hostsConfig;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.testbed;
            hosts = hostsConfig;
          };
          isGraphical = hostsConfig.testbed.isGraphical;
        };

        deck = mkHost {
          name = "deck";
          inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.deck;
            hosts = hostsConfig;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.deck;
            hosts = hostsConfig;
          };
          isGraphical = hostsConfig.deck.isGraphical;
        };

        panda = mkHost {
          name = "panda";
          inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.panda;
            hosts = hostsConfig;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = hostsConfig.panda;
            hosts = hostsConfig;
          };
          isGraphical = hostsConfig.panda.isGraphical;
        };
      };
    in {
      nixosConfigurations =
        builtins.mapAttrs (name: host: host.nixosConfig) hosts;
    };

  nixConfig = {
    # Required to acquire ROS packages
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys =
      [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };
}
