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
    cargo
    valgrind
    vscode-langservers-extracted
    pkg-config
    steel
    gdb
    man-pages
  ];
  imports = [
  ];
  programs = {
  };
}
