{ config, pkgs, inputs, ... }:

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
  networking.firewall.allowedTCPPorts = [
    53317
  ];
  networking.firewall.allowedUDPPorts = [
    53317
  ];
  programs.steam.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.agave
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
  ];
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      keyboardShortcut
    ];
    theme = spicePkgs.themes.dracula;
  };

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
      { appId = "de.schmidhuberj.tubefeeder"; origin = "flathub"; }
    ];
  };
  hardware.keyboard.qmk.enable = true;
  networking.networkmanager.enable = true;
}
