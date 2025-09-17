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
    };

  nixConfig = {
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys =
      [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };
}
