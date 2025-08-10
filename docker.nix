{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
  ];
  networking.firewall.allowedTCPPorts = [
  ];
  networking.firewall.allowedUDPPorts = [
  ];
  # enable docker
  virtualisation.docker.enable = true;
  users.users.oldcat.extraGroups = [ "docker" ];
}
