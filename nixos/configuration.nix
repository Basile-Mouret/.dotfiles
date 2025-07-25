# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];




 
  # NVIDIA
    # Enable OpenGL
  hardware.graphics.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    prime = {
    offload.enable = true;
    amdgpuBusId = "PCI:65:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };
};












 
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zephyrus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  ## Configure Gnome Shell

  services.xserver.enable = true;
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # services.xserver.xkb.options = "ctrl:nocaps";
  # console.useXkbConfig = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # for thunderbolt support
  # services.hardware.bolt.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.basile = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Basile";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    gemini-cli
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # For flatpak connection
  services.flatpak.enable = true;
  
  services.accounts-daemon.enable = true;
  
  # Programs

  programs.nix-ld.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };

  programs.git.enable = true;
 
  programs.dconf.enable = true;

  # Install Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  

  # Sunshine 
  #services.sunshine = {
  #  enable = true;
  #  autoStart = true;
  #  capSysAdmin = true;
  #  openFirewall = true;
  #  
  #};

  # Enable Zsh, with oh my zsh and pwl10k
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true; # Useful if you also use bash scripts
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git" # Example plugin, add more as needed
        # "z" # Example for a common plugin
        # "fzf" # If you also install fzf
      ];
      # You can also add custom plugins by specifying their path, e.g.:
      # custom = "${pkgs.fetchFromGitHub {
      #   owner = "some-user";
      #   repo = "some-omz-plugin";
      #   rev = "commit-hash";
      #   sha256 = "sha256-of-repo";
      # }}";
    };
    promptInit = ''
      # Source Powerlevel10k theme
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
  };
  
  # Supergfxctl : to manage Nvidia gpu/ amd igpu
  services.supergfxd.enable = true;
  # Asusctl and ROG control center
  services = {
      asusd = {
        enable = true;
        enableUserService = true;
      };
  };

  environment.systemPackages = with pkgs; [
  # terminal
  wezterm 
  vim_configurable # vim doesn't have a lot of options
  neovim
  wget
  curl
  tmux
  lazygit
  btop
  fastfetch
  julia-bin
  xclip # for clipboard support in vim
  just # like Make
  typst


  # Gui apps
  discord
  obsidian
  lutris
  mediawriter
  gimp
  gearlever
  warehouse
  zsh-powerlevel10k

  # Gnome Shell Extensions
  gnomeExtensions.blur-my-shell
  gnomeExtensions.gpu-supergfxctl-switch
  gnomeExtensions.gsconnect
  gnomeExtensions.tiling-shell
  gnomeExtensions.open-bar
  gnomeExtensions.caffeine

  # system usage
  ];


  # --- FONT CONFIGURATION  ---
  fonts = {
    packages = with pkgs; [
      meslo-lgs-nf # Nerd Font for Powerlevel10k
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.geist-mono
      fira-code
    ]; 
  };
# Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
