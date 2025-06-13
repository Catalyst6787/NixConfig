{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    os-prober
    apacheHttpd
  ];
  virtualisation = {
    containers.enable = true;
    docker.enable = true;
    docker.enableOnBoot = true;
  };
  users.users.oldcat.extraGroups = [ "docker" ];

  boot.kernel.sysctl = { "vm.swapiness" = 10;};
  boot.kernel.sysctl = { "vm.vfs_cache.pressure" = 50;};
  boot.kernel.sysctl = { "fs.inotify.max_user_watches" = 262144;};


  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 80 443 ];
  };


  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
}
