{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    bemenu
    wofi
    fuzzel
    vlc
    networkmanagerapplet
  ];
  imports = [
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
    fish.loginShellInit = "Hyprland";
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
