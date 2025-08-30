# { pkgs, ... }:

# appimage setup example
# let
#   wakatime-desktop = pkgs.appimageTools.wrapType2 {
#     pname = "wakatime-desktop";
#     version = "2.1.7";
#     src = pkgs.fetchurl {
#       url = "https://github.com/wakatime/desktop-wakatime/releases/download/v2.1.7/wakatime-linux-x86_64.AppImage";
#       sha256 = "sha256-/PUfMvPjtBz9X7+5wBdvJk2/odWjA5ZdXq45brkNU9U=";
#     };
#   };
# in {
#   environment.systemPackages = [
#     wakatime-desktop
#   ];
# }

