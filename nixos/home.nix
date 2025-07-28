# This is your home-manager configuration file
{ pkgs, ... }:

{
  # Set your username and home directory
  home.username = "basile";
  home.homeDirectory = "/home/basile";
  home.stateVersion = "25.05";

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
    oh-my-zsh
    zsh-powerlevel10k


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
  ];

  # Manage your git configuration
  programs.git = {
    enable = true;
    userName = "Basile"; # Your name
    userEmail = "your-email@example.com"; # Your email
  };
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      lg = "lazygit";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      oldvim = "\\vim";
    };
    initContent = "source ~/.p10k.zsh";
    plugins = [   
    {                                                                                   
      name = "powerlevel10k";                                                           
      src = pkgs.zsh-powerlevel10k;                                                     
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
    }
    ];
  };
  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
