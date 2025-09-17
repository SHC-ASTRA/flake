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
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nix-ros-overlay, nixpkgs, home-manager, zen-browser, ... }: {
      nixosConfigurations = {
        astra = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            ./hardware-configuration.nix
            nix-ros-overlay.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.astra = import ./home.nix;
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
        specialArgs = { inherit inputs; };
      };

      systemTypes = {
        basestation = {
          isGraphical = true;
        };
        tracking-antenna = {
          isGraphical = false;
        };
        rover = {
          isGraphical = false;
        };
      };

      hosts = {
        antenna = mkHost {
          name = "antenna";
	  inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = systemTypes.tracking-antenna;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = systemTypes.tracking-antenna;
          };
          isGraphical = false;
        };

        clucky = mkHost {
          name = "clucky";
	  inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = systemTypes.rover;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = systemTypes.rover;
          };
          isGraphical = false;
        };

        testbed = mkHost {
          name = "testbed";
	  inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = systemTypes.rover;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = systemTypes.rover;
          };
          isGraphical = false;
        };

        deck = mkHost {
          name = "deck";
	  inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = systemTypes.basestation;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = systemTypes.basestation;
          };
          isGraphical = true;
        };

        panda = mkHost {
          name = "panda";
	  inherit username;

          extraSpecialArgs = {
            inherit self inputs;
            host = systemTypes.basestation;
          };
          homeSpecialArgs = {
            inherit self inputs;
            host = systemTypes.basestation;
          };
          isGraphical = true;
        };
      };
    in
    {
      nixosConfigurations = builtins.mapAttrs (name: host: host.nixosConfig) hosts;
    };

  nixConfig = {
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys =
      [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };
}
