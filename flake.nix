{
  description = "nix laptop flake";
  inputs = {
    # NixOS official unstable branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      #v-- 'nixos' being the hostname
      nix-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # import stuff here
          ./nix-laptop/configuration.nix
	  ./gui/gui.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            home-manager.users.oldcat = import ./home/home.nix;
          }
        ];
      };
    };
  };
}
