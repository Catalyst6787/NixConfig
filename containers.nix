{ config, pkgs, ... }:

{
  networking.nat = {
    enable = true;
    enableIPv6 = true;
  };
  
  containers.htb = {
    autoStart = false;
    privateNetwork = true;
    config = { config, pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        nmap
      ];
      system.stateVersion = "25.05";
    };
  };
}
