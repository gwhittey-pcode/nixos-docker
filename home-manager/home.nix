# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "gwhittey";
    homeDirectory = "/home/gwhittey";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  # programs.zsh = {
  #     enable = true;
  #     enableCompletion = true;
  #     autosuggestion.enable = true;
  #     shellAliases = {
  #       sl = "colorls";
  #       ls = "colorls";
  #       l = "colorls -l";
  #       la = "colorls -la";
  #       ip = "ip --color=auto";
  #       update = "sudo nixos-rebuild switch --flake .#gwhit-nixos";
  #       homeupdate = "home-manager switch --flake .#gwhittey@gwhit-nixos  ";
  #     };
  #     #initExtra = "source .p10k.zsh";
  #     plugins = [
  #       {
  #         name = "zsh-autosuggestions";
  #         src = pkgs.fetchFromGitHub {
  #           owner = "zsh-users";
  #           repo = "zsh-autosuggestions";
  #           rev = "v0.6.4";
  #           sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
  #         };
  #       }
  #       {
  #         name = "fast-syntax-highlighting";
  #         src = pkgs.fetchFromGitHub {
  #           owner = "zdharma";
  #           repo = "fast-syntax-highlighting";
  #           rev = "v1.55";
  #           sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
  #         };
  #       }
  #       {
  #         name = "powerlevel10k";
  #         src = pkgs.zsh-powerlevel10k;
  #         file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  #       }
  #       {
  #         name = "powerlevel10k-config";
  #         src = ./p10k-config;
  #         file = "p10k.zsh";
  #       }
  #     ];
  #   };
  programs.git = {
    extraConfig.credential.helper = "manager";
    extraConfig.credential."https://github.com".username = "gwhittey-pcode";
    extraConfig.credential.credentialStore = "cache";
    enable = true;
    userName  = "Gerard Whittey";
    userEmail = "gerard.whittey@gmail.com";
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
