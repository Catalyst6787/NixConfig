{ config, pkgs, ... }:

{
  home.username = "oldcat";
  home.homeDirectory = "/home/oldcat";
  
  home.packages = with pkgs; [
    fastfetch
  ];

  programs.git = {
    enable = true;
    userName = "lucien" ;
    userEmail = "faurelucien@proton.me";
  };
 
  programs.fish = {
    enable = true;
    shellAliases = {
      g = "git";
      gc = "gcc -g -Wall -Wextra -Werror";
      rs = "sudo nixos-rebuild switch --flake ~/nix"; # expects flake to be in /home/user/nix
      no = "echo 'FUCK OFF'";
    };
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  
}

      


  
  
  
