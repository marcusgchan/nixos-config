{
  description = "A MBA-2 NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, neorg-overlay, nix-darwin, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
      lenovo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/lenovo

          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [ neorg-overlay.overlays.default ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.marcus = import ./home;
          }
        ];
      };
    };

    darwinConfigurations = {
      m1-mac = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/m1-mac

          home-manager.darwinModules.home-manager
          {
            nixpkgs.overlays = [ neorg-overlay.overlays.default ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.marcus = import ./home/darwin.nix;
          }
        ];
      };
    };
  };
}
