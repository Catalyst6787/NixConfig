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
  programs.steam.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.agave
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
  ];

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
