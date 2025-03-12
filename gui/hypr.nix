{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    banana-cursor
    kitty
    librewolf
    hyprcursor
    hyprpolkitagent
    waybar
    dunst
    eww
    hyprpaper
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.udisks2.enable = true;
  services.getty.autologinUser = "oldcat";

  qt.enable = true;
}
