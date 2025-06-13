{ config, pkgs, ... }:

{
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
  programs.nix-ld.enable = true;
  services.tailscale.enable = true;
  # documentation.man = {
  #   enable = true;
    
  # }
  documentation.dev.enable = true;
  documentation.man.generateCaches = false;
}
