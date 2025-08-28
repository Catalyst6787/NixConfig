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
    # dunst
    eww
    hyprpaper
    brightnessctl
    hyprshot
    xdg-desktop-portal-hyprland
    grim
    slurp
    wl-clipboard-rs
    grimblast
    pamixer
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
  services.upower.enable = true;

  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";
    XDG_PICTURES_DIR = "$HOME/Pictures";
  };
  hardware.graphics.enable = true;



  programs.gnome-disks.enable = true;
  services.udisks2.enable = true;
  services.getty.autologinUser = "oldcat";
  qt.enable = true;

}
