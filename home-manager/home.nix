# /home/chris/.dotfiles/home-manager/home.nix
{ config, pkgs, lib, inputs, ... }:

let
  # Path to the directory where your actual dotfiles are stored
  dotfilesDir = ../config;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "chris";
  home.homeDirectory = "/home/chris";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05"; # Adjust to your Home Manager version (e.g., "23.11", "24.05")

  # Nicely reload systemd units when changing configurations.
  systemd.user.startServices = "sd-switch";

  # Symlink dotfiles from the 'config' directory, Stow-compatible
  # The target path (e.g., ".zshrc") is relative to home.homeDirectory
  # The source path is relative to this home.nix file, pointing into the 'config' dir.

  # Example for .zshrc (source: config/zsh/.zshrc -> target: ~/.zshrc)
  home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/zsh/.zshrc";

  # Example for .gitconfig (source: config/git/.gitconfig -> target: ~/.gitconfig)
  # home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/git/.gitconfig";

  # Example for Neovim (stow structure often puts .config inside the app folder)
  # (source: config/nvim/.config/nvim/init.lua -> target: ~/.config/nvim/init.lua)
  # home.file.".config/nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/nvim/.config/nvim/init.lua";
  # Or, if your nvim config is directly in config/nvim/init.lua and you want it at ~/.config/nvim/init.lua
  # home.file.".config/nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/nvim/init.lua";

  # Example: Configure Zsh
  programs.zsh = {
    enable = true;
    # If you symlink .zshrc using home.file, zsh should pick it up automatically.
    # You might still want to manage plugins or other zsh settings here.
    # Example: enable oh-my-zsh
    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" "sudo" ];
    #   theme = "robbyrussell";
    # };
  };

  # Example: Configure Git
  programs.git = {
    enable = true;
    # If you symlink .gitconfig, these settings might be redundant or conflict
    # unless your .gitconfig sources system/global git configs.
    # userName = "Chris"; # Managed by .gitconfig symlink
    # userEmail = "chris@example.com"; # Managed by .gitconfig symlink
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You can import other modules here if you split your configuration
  # imports = [
  #   ./modules/git.nix
  #   ./modules/zsh.nix
  # ];
}
