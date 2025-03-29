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
    whatsie
  ];
  fonts.packages = with pkgs; [ nerdfonts ];
  services.udev.packages = with pkgs; [
    qmk
    qmk-udev-rules
    vial
    via
  ];
  services.flatpak = {
    enable = true;
    packages = [
      { appId = "org.jdownloader.JDownloader"; origin = "flathub"; }
    ];
  };
  hardware.keyboard.qmk.enable = true;
  networking.networkmanager.enable = true;
}
