# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/hardware/nvidia.nix
    ./modules/desktop/audio.nix
    ./modules/desktop/locale.nix
    ./modules/desktop/gnome.nix
    ./modules/programs/gaming.nix
  ];
  boot.kernelParams = [ 
    "amdgpu.virtual_display=1"  # Creates virtual display on AMD GPU
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zephyrus";
  networking.networkmanager.enable = true;

  # User configuration
  users.users.basile = {
    isNormalUser = true;
    description = "Basile";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  home-manager.users.basile = import ./home.nix;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Programs
  programs.nix-ld.enable = true;
  programs.zsh.enable = true;
  programs.dconf.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
