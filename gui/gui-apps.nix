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
    calibre
    qbittorrent
    nautilus
    mpv
    eog
    localsend
    webcord
  ];
  fonts.packages = with pkgs; [ nerdfonts ];
}
