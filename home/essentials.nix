{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  helix
  git
  pkg-config
  nushell
  zoxide
  fzf
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
    zoxide = {
      enable = true;
      enableFishIntegration = true;
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
          smart-tab.enable = true;
          indent-guides.render = true;
        };
      };
    };
    bat = {
      enable = true;
      themes = {
        dracula = {
          src = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "sublime"; # Bat uses sublime syntax for its themes
            rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
            sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
          };
          file = "Dracula.tmTheme";
        };
      };
    };
    # some other programs
  };
}
