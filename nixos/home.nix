# This is your home-manager configuration file
{ config, pkgs, ... }:

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
    vim_configurable # vim doesn't have a lot of options
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
    claude-code


    # Gui apps
    discord
    obsidian
    qutebrowser
    lutris
    mediawriter
    gimp
    gearlever
    warehouse

    # fonts
    meslo-lgs-nf # Nerd Font for Powerlevel10k
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.geist-mono
    fira-code
  ];

  # Font configuration
  fonts.fontconfig.enable = true;
  
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm/wezterm.lua;
  };



  # Manage your git configuration
  programs.git = {
    enable = true;
    userName = "Basile Mouret";
    userEmail = "Basile-Mouret@users.noreply.github.com";
  };
  
programs.zsh = {
  enable = true;
  enableCompletion = true;
  shellAliases = {
    lg = "lazygit";
    v = "nvim";
    oldvim = "\\vim";
  };
  initContent = "source ~/.p10k.zsh";
  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.zsh-syntax-highlighting;
      file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
    }
    {
      name = "zsh-autosuggestions";
      src = pkgs.zsh-autosuggestions;
      file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
    }
  ];
};

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;  # This copies the entire directory structure
  };
  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
