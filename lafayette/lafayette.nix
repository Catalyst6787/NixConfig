{ config, pkgs, ... }:

{
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "lafayette";
    xkb.extraLayouts.lafayette = {
      description = "qwerty-lafayette";
      languages = [ "fr" "en" ];
      symbolsFile = ./lafayette_linux_v0.9.xkb_custom;
    };
  };
}
