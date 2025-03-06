{ config, pkgs, ... }:

{
  home.username = "oldcat";
  home.homeDirectory = "/home/oldcat";
  home.packages = with pkgs; [
    fastfetch
    bemenu
    wofi
    fuzzel
    helix
    # CODE
    gnumake
    rocmPackages_5.llvm.clang-tools-extra
    lldb_19
    docker-compose-language-service
    yaml-language-server
    gopls
    delve
    marksman
    nil
    python312Packages.python-lsp-server
    rust-analyzer
    zls
  ];
  imports = [
    ./waybar.nix
  ];

  services.udiskie = {
    enable = true;
    settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {
            # replace with your favorite file manager
            file_manager = "${pkgs.dolphin}/bin/dolphin";
	};
    };
  };
  services.dunst.enable = true;

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload =
        [ "~/custom/wallpapers/dracula/first-collection/nixos.png" ];
      wallpaper = [ "eDP-1,~/custom/wallpapers/dracula/first-collection/nixos.png" ];
    };
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
 #    neovim = {
 #      enable = true;
 #      viAlias = true;
 #      vimAlias = true;
 #      plugins = [
 #        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
 #        pkgs.vimPlugins.dracula-nvim
 #      ];
 #      extraConfig = ''
 #        set number relativenumber
	# set nowrap
	# colorscheme dracula
 #      '';
 #    };
    fuzzel = {
      enable = true;
      settings = {
        main = {
	  terminal = "${pkgs.kitty}/bin/kitty";
	  layer = "overlay";
	};
        colors.background = "6272a4ff";
	colors.text = "282A36ff";
	colors.promt = "282A36ff";
      };
    };
    command-not-found.enable = false;
    kitty = {
      enable = true;
      themeFile = "Dracula";
      settings = {
        confirm_os_window_close = 0;
      };
    };
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "dracula";
      };
    };

    # some other programs

  };
  gtk.enable = true;
  gtk.theme = {
    name = "dracula-theme";
    package = pkgs.arc-theme;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 24;
  };


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  
}
