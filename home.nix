{ config, pkgs, inputs, ... }:

{
  home.username = "oldcat";
  home.homeDirectory = "/home/oldcat";
  home.packages = with pkgs; [
  helix
  bat
  git
  ];
  imports = [
    home/waybar.nix
    home/essentials.nix
    home/desktop.nix
    home/code.nix
  ];
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
