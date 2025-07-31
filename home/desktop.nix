{ config, pkgs, spicetify, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    bemenu
    fuzzel
    hyprpanel
    upower
    vlc
    networkmanagerapplet
    obsidian
    nushell
    bitwarden-desktop
    zathura
    rofi-bluetooth
    rofi-power-menu
    rofi-network-manager
    yt-dlp
    prismlauncher
    solaar
  ];
  imports = [
  ];
  # services.udisks2.enable = true;
  services.udiskie = {
    enable = true;
    settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {
            # replace with your favorite file manager
            file_manager = "${pkgs.kdePackages.dolphin}/bin/dolphin";
	    };
    automount = true;
    notify = true;
    tray = "auto";
    };
  };
  # services.dunst.enable = false;
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload =
        [ "~/custom/wallpapers/dracula-leaves-6272a4-dark.png"  ];
      wallpaper = [ "eDP-1,~/custom/wallpapers/dracula-leaves-6272a4-dark.png" ];
    };
  };
  
  programs = {
    fish.loginShellInit = "Hyprland";
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = "~/nix/home/templates/rofi-dracula.rasi";
      plugins = [
        pkgs.rofi-calc
        pkgs.rofi-games
        pkgs.rofi-power-menu
        pkgs.rofi-file-browser
        pkgs.rofi-network-manager
      ];
      terminal = "kitty";
      
    };
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
    kitty = {
      enable = true;
      themeFile = "Dracula";
      shellIntegration.enableFishIntegration = true;
      settings = {
        confirm_os_window_close = 0;
      };

    };
    
    # some other programs
  };
  gtk.enable = true;
  gtk.theme = {
    name = "dracula-theme";
    package = pkgs.arc-theme;
  };
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "dracula";
  qt.style.package = pkgs.dracula-qt5-theme;
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 24;
  };
}
