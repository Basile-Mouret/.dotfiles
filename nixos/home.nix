# This is your home-manager configuration file
{ pkgs, ... }:

{
  # Set your username and home directory
  home.username = "basile";
  home.homeDirectory = "/home/basile";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage.
  home.stateVersion = "25.05"; # Or "23.11" or whatever version you want to start with.

  nixpkgs.config = {
    allowUnfree = true;
  };
  # This is where you will manage your packages
  home.packages = with pkgs; [

    # Packages from environment.systemPackages
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
    unzip
    tree
    gemini-cli

    # Gui apps
    discord
    obsidian
    qutebrowser
    lutris
    mediawriter
    gimp
    gearlever
    warehouse
    # etc...

    # themes
    zsh-powerlevel10k
  ];

  # Manage your git configuration
  programs.git = {
    enable = true;
    userName = "Basile"; # Your name
    userEmail = "your-email@example.com"; # Your email
  };
  
  # Manage your zsh config here
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    # You no longer need the promptInit if you install zsh-powerlevel10k with home-manager
  };
  # programs.oh-my-zsh = {
  # enable = true;
  # plugins = [ "git" "sudo" ];
  # theme = "agnoster";
  #};

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
