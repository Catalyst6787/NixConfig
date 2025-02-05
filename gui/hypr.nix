{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  environment.systemPackages = [
    pkgs.kitty
    pkgs.librewolf
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
