{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  environment.systemPackages = [
    pkgs.banana-cursor
    pkgs.kitty
    pkgs.librewolf
    pkgs.hyprcursor
    pkgs.hyprpolkitagent
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
