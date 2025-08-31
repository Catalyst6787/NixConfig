{ pkgs, ... }:

let
  pname = "retoswap";
  version = "1.2.0";
  src = pkgs.fetchurl {
    url = "https://github.com/retoaccess1/haveno-reto/releases/download/1.2.1-1/haveno-v1.2.0-linux-x86_64.AppImage";
    sha256 = "sha256-Ej9IdEi9IGgmRSf/0Ybw3oKfid0DleSGF4KIArrwTs4=";
  };
  appimageContents = pkgs.appimageTools.extract { inherit pname version src; };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  pkgs = pkgs;
  extraInstallCommands =
    #shell
    ''
      # install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      # substituteInPlace $out/share/applications/${pname}.desktop \
      #   --replace 'Exec=AppRun' 'Exec=${pname}'
      # cp -r ${appimageContents}/usr/share/icons $out/share

      # unless linked, the binary is placed in $out/bin/cursor-someVersion
      # ln -s $out/bin/${pname}-${version} $out/bin/${pname}
    '';

  extraBwrapArgs = [
    "--bind-try /etc/nixos/ /etc/nixos/"
  ];

  # vscode likes to kill the parent so that the
  # gui application isn't attached to the terminal session
  dieWithParent = false;

  # extraPkgs =
  #   pkgs: with pkgs; [
  #     unzip
  #     autoPatchelfHook
  #     asar
  #     # override doesn't preserve splicing https://github.com/NixOS/nixpkgs/issues/132651
  #     (buildPackages.wrapGAppsHook.override { inherit (buildPackages) makeWrapper; })
  #   ];
}
