{ config, pkgs, ... }:

{
  # Install Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Asusctl and ROG control center
  services.asusd = {
    enable = true;
    enableUserService = true;
  };
}