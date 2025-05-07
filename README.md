# dotfiles

This contains my personal nixos configuration, dotfiles and scripts.
Clone this repository to ~/.dotfiles.

## NIXOS

The nixos directory contains my current nixos configuration files.
The hardware-configuration.nix file is excluded and should be copied in from `/etc/nixos` after a fresh install.

### Initial Setup

Similar to the instructions from [nixos-and-flakes](https://nixos-and-flakes.thiscute.world/nixos-with-flakes/other-useful-tips#managing-the-configuration-with-git), backup the original nixos config, symlink to the new nixos config and rebuild.

```
sudo mv /etc/nixos /etc/nixos-bak
sudo ln -s ~/.dotfilkes/nixos /etc/nixos

sudo nixos-rebuild switch
```
