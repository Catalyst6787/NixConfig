{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  helix
  git
  pkg-config
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
      };
    };
    command-not-found.enable = false;
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "dracula";
        # editor.whitespace = {
          # render = "all";
        # };
      };
    };
    # some other programs
  };
}
