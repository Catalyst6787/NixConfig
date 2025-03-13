{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnumake
    rocmPackages_5.llvm.clang-tools-extra
    gccgo14
    lldb_19
    docker-compose-language-service
    yaml-language-server
    gopls
    delve
    marksman
    nil
    python312Packages.python-lsp-server
    # rust-analyzer
    zls
    rustup
    # cargo
  ];
  imports = [
  ];
  programs = {
  };
}
