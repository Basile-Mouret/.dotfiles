{ config, pkgs, ... }:

{
  # Configure Gnome Shell
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Enable CUPS to print documents
  services.printing.enable = true;

  # For flatpak connection
  services.flatpak.enable = true;
  services.accounts-daemon.enable = true;

  # Gnome Shell Extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gpu-supergfxctl-switch
    gnomeExtensions.gsconnect
    gnomeExtensions.tiling-shell
    gnomeExtensions.open-bar
    gnomeExtensions.caffeine
  ];
}