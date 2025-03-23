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
    home/essentials.nix
    home/code.nix
  ];
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
