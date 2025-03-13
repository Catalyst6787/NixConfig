{ config, pkgs, ... }:

{
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
  programs.nix-ld.enable = true;
}
