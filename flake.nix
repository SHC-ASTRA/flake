{
  description = "Home Manager configuration of ASTRA";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    hardware.url = "github:nixos/nixos-hardware";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      ...
    }:
    {
      nixosConfigurations = {
        astra = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            ./hardware-configuration.nix

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
}
