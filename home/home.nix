{ config, pkgs, ... }:

{
  home.username = "oldcat";
  home.homeDirectory = "/home/oldcat";
  
  home.packages = with pkgs; [
    fastfetch
  ];

  programs = {
    git = {
      enable = true;
      userName = "lucien" ;
      userEmail = "faurelucien@proton.me";
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      shellAliases = {
        g = "git";
        gc = "gcc -g -Wall -Wextra -Werror";
        rs = "sudo nixos-rebuild switch --flake ~/nix"; # expects flake to be in /home/user/nix
      };
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      plugins = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ];
      extraConfig = ''
        set number relativenumber
	set nowrap
      '';
    };
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  
}

      


  
  
  
