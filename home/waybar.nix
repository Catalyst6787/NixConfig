{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    playerctl
    acpi
  ];
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
    modules-left = [ "hyprland/workspaces" "custom/media" "custom/wifi" "battery" "custom/clock" ];
    "hyprland/workspaces" = {
      disable-scroll = false;
    };
    "custom/media" = {
      interval = 1;
      exec = pkgs.writeShellScript "getmediainfo" ''
        playerctl metadata --format '{{ title }} - {{ artist }}' 
      '';
    };
    "custom/wifi" = {
      interval = 50;
      exec = pkgs.writeShellScript "getwifi" ''
      nmcli -t -f ACTIVE,SSID dev wifi | grep 'yes' | cut -d':' -f2  
      '';
    };
    "battery" = {
      bat = "BAT0";
      interval = 60;
      format = "{capacity}% {icon}";
      format-icons = ["" "" "" "" ""];
    };
    "custom/clock" = {
      interval = 1;
      exec = pkgs.writeShellScript "gettime" ''
      date '+%H:%M'
      '';
    }; 
    };
  };
}
