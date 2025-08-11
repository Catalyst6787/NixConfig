{
  description = "nix laptop flake";
  inputs = {
    # NixOS official unstable branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    # flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest"; # unstable branch. Use github:gmodena/nix-flatpak/?ref=<tag> to pin releases.
    # hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
     nix-flatpak,
    # hyprpanel,
    spicetify-nix,
    ...
    }: {
    nixosConfigurations = {
      #v-- 'nixos' being the hostname
      nix-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # import stuff here
          ./nix-laptop/configuration.nix
          ./gui/gui.nix
          ./lafayette/lafayette.nix
          ./essentials/essentials.nix
          ./laptop.nix
          # tmp enable docker – remove later
          # ./docker.nix 
          # {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
          nix-flatpak.nixosModules.nix-flatpak
          inputs.spicetify-nix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.oldcat.imports = [
              ./home.nix
            ];
          }
        ];
        specialArgs = { inherit inputs; };
      };
      # generic-desktop = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [
      #     # import stuff here
      #     ./device/configuration.nix
      #     ./gui/gui.nix
      #     ./lafayette/lafayette.nix
      #     ./essentials/essentials.nix
            # if laptop ./laptop.nix

      #     home-manager.nixosModules.home-manager
      #     {
      #       home-manager.useGlobalPkgs = true;
      #       home-manager.useUserPackages = true;
            
      #       home-manager.users.oldcat = import ./home.nix;
      #     }
      #   ];
      # };
      nix-server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # import stuff here
          ./nix-server/configuration.nix
          ./essentials/essentials.nix
          ./server/server.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            home-manager.users.oldcat = import ./home-headless.nix;
          }
        ];
      };
    };
  };
}
