{ config, pkgs, ... }:

{
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
}
