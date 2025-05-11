{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnumake
    llvmPackages_19.clang-tools
    gccgo14
    lldb_19
    docker-compose-language-service
    yaml-language-server
    gopls
    delve
    marksman
    nil
    python312Packages.python-lsp-server
    rust-analyzer
    zls
    # rustup
    cargo
    valgrind
    vscode-langservers-extracted

    # minilibx
    # xorg.libXext
    # xorg.libX11
    pkg-config
  ];
  imports = [
  ];
  programs = {
  };
}
