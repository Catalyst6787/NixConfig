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
    vial
    via
  ];
  fonts.packages = with pkgs; [ nerdfonts ];
  services.udev.packages = with pkgs; [
    qmk
    qmk-udev-rules
    vial
    via
  ];
  hardware.keyboard.qmk.enable = true;
}
