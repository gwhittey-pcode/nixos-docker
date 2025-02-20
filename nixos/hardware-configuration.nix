# # Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/69700a6b-c304-4bd9-8cfc-a651cb490988";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1CB6-9073";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  fileSystems."/HD/HD1" =
    { device = "/dev/disk/by-label/HD1";
      fsType = "ext4";
    };

  fileSystems."/HD/HD2" =
    { device = "/dev/disk/by-label/HD2";
      fsType = "ext4";
    };

  fileSystems."/HD/HD3" =
    { device = "/dev/disk/by-label/HD3";
      fsType = "ext4";
    };
  # fileSystems."/HD/HD2" = {
  #   device = "192.168.1.5:/HD2";
  #   fsType = "nfs";
    
  # };
  # fileSystems."/HD/HD3" = {
  #   device = "192.168.1.5:/HD3";
  #   fsType = "nfs";
    
  # };
  #   fileSystems."/HD/HD1" = {
  #   device = "192.168.1.5:/HD1";
  #   fsType = "nfs"; 
  #  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  #networking.useDHCP = lib.mkDefault true;
   #networking.interfaces.ens18.useDHCP = lib.mkDefault true;
  networking.interfaces.ens18.ipv4.addresses = [ {
    address = "192.168.1.3";
    prefixLength = 24;
  } ];
   networking.defaultGateway = "192.168.1.254";
  networking.nameservers = [ "192.168.1.94" "8.8.8.8" ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
