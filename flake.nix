{
  description = "nix laptop flake";
  inputs = {
    # NixOS official unstable branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    # "nixos" should be the hostname
    nixosConfigurations.nix-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # import stuff here
        ./configuration.nix
      ];
    };

  };
  
}
