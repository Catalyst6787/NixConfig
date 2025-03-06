{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
  ];
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
    modules-left = [ "hyprland/workspaces" "custom/hello" ];
    "hyprland/workspaces" = {
      disable-scroll = false;
    };
    "custom/hello" = {
      interval = "once";
      exec = pkgs.writeShellScript "hello-from-waybar" ''
        echo "from within waybar"
      '';
      };
    };
  };
}
