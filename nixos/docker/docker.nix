{ pkgs, lib, ... }:

{
  # Runtime
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
  virtualisation.oci-containers.backend = "docker";
 imports = [
    ./media_stack.nix
    ./vpn_transmission.nix
    ./portainer.nix
 ];
}