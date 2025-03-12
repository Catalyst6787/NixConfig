{ config, pkgs, ... }:

{
  home.username = "oldcat";
  home.homeDirectory = "/home/oldcat";
  home.packages = with pkgs; [
  helix
  bat
  git
  ];
  imports = [
    ./waybar.nix
    ./essentials.nix
    ./desktop.nix
  ];
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
