{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    kitty
    librewolf
    stremio
    spotify
    freetube
    gparted
  ];
}
