{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  helix
  git
  pkg-config
  nushell
  ];
  imports = [
  ];

  services = {
	};
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
        update = "sudo nix flake update";
      	cat="bat";
        vim="hx";
        ms="make -s";
        c="clear";
        mfs="make fclean -s";
        v="valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all";
      };
    };
    command-not-found.enable = false;
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "dracula";
        editor = {
          whitespace.render = {
            space = "all";
            tab = "all";
            nbsp = "none";
            nnbsp = "none";
            newline = "none";
          };
          smart-tab.enable = false;
          indent-guides.render = true;
        };
      };
    };
    # some other programs
  };
}
