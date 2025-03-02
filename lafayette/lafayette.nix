{ config, pkgs, ... }:

{
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    
    
    xkb.layout = "lafayette";
    xkb.extraLayouts.lafayette = {
      description = "qwerty-lafayette";
      languages = [ "fr" ];
      symbolsFile = ./lafayette_linux_v0.9.xkb_custom;
    };
  };
}
