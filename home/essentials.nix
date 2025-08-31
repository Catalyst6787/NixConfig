{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
  helix
  git
  pkg-config
  nushell
  zoxide
  fzf
  ripgrep
  stow
  wakatime-cli
  inputs.wakatime-ls.packages.${pkgs.system}.default
  ];
  imports = [
  ];

  services = {
	};
  programs = {
    git = {
      enable = true;
      userName = "lucien" ;
      userEmail = "faurelucien@proton.me";
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      shellAliases = {
        g = "git";
        gc = "gcc -g -Wall -Wextra -Werror";
        rs = "sudo nixos-rebuild switch --flake ~/nix"; # expects flake to be in /home/user/nix
        update = "sudo nix flake update";
      	cat="bat";
        vim="hx";
        ms="make -s";
        c="clear";
        mfs="make fclean -s";
        v="valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all";
      };
      functions = {
        wakatime_heartbeat = {
          body =
          # fish
          ''
          set cmd (string join ' ' $argv)
          set project (current_project)

          # echo "[DEBUG] wakatime_heartbeat: cmd='$cmd' project='$project'" >> ~/.wakatime-fish-debug.log

          wakatime-cli \
            --entity (pwd) \
            --entity-type app \
            --project $project \
            --plugin "fish/1.0.0" \
            --category coding
            # --verbose >> ~/.wakatime-fish-debug.log 2>&1
          '';
          # onEvent = "fish_preexec";
        };
        current_project = {
          body =
          # fish
          ''
          if git rev-parse --show-toplevel >/dev/null 2>&1
            basename (git rev-parse --show-toplevel)
          else
            basename (pwd)
          end
          '';
        };
      };
      shellInit =
      #fish
      ''
      source ~/.config/fish/functions/wakatime_heartbeat.fish
      '';
    };
    direnv = {
      enable = true;
    };
    yazi = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    command-not-found.enable = false;
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "dracula";
        editor = {
          whitespace.render = {
            space = "all";
            tab = "all";
            nbsp = "none";
            nnbsp = "none";
            newline = "none";
          };
          smart-tab.enable = true;
          indent-guides.render = true;
          };
        };
        extraConfig =
        # toml
        ''
          [editor.auto-save]
          after-delay.enable = true
          after-delay.timeout = 3000
        '';
      };
    bat = {
      enable = true;
      themes = {
        dracula = {
          src = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "sublime"; # Bat uses sublime syntax for its themes
            rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
            sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
          };
          file = "Dracula.tmTheme";
        };
      };
    };
    # some other programs
  };
}
