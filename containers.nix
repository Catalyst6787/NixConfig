{ config, pkgs, ... }:

{
  networking.nat = {
    enable = true;
    enableIPv6 = true;
  };
  
  containers.htb = {
    autoStart = false;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";
    hostAddress6 = "fc00::1";
    localAddress6 = "fc00::2";
    config = { config, pkgs, lib, ... }: {
      environment.systemPackages = with pkgs; [
        nmap
        openvpn
        fish
      ];
      users.users.oldcat = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.fish;
      };
      services.resolved.enable = true;
      nixpkgs.config.allowUnfree = true;
      programs.fish.enable = true;
      security.sudo.enable = true;
      security.sudo.wheelNeedsPassword = false;
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
      system.stateVersion = "25.05";
    };
  };
}
