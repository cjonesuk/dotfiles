# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
# Home Manager (when installing the oh-my-zsh package) typically sets the $ZSH
# environment variable to point to the correct path in the Nix store.
# This line provides a fallback if $ZSH isn't set, which is useful for non-Nix systems.
# export ZSH="${ZSH:-$HOME/.oh-my-zsh}" # <--- Commenting out the original line

# echo "[.zshrc DEBUG] ZSH at top of .zshrc: '$ZSH'" # Removing debug echo

# New conditional ZSH setting: <--- This entire block should still be commented out from the previous step
# if [[ -z "$ZSH" || ! "$ZSH" == /nix/store/* ]]; then
#   echo "[.zshrc] DEBUG: Condition (ZSH empty or not /nix/store/*) is TRUE."
#   echo "[.zshrc] DEBUG: ZSH before override: '$ZSH'"
#   export ZSH="$HOME/.oh-my-zsh"
#   echo "[.zshrc] DEBUG: ZSH after override: '$ZSH'"
# else
#   echo "[.zshrc] DEBUG: Condition (ZSH empty or not /nix/store/*) is FALSE."
#   echo "[.zshrc] DEBUG: ZSH not overridden: '$ZSH'"
# fi
# Ensure ZSH is exported (it might have been set by zshenv but not exported,
# though `export` in initExtra should handle that. This is just for safety).
# export ZSH # Temporarily commented out
# echo "[.zshrc DEBUG] ZSH before sourcing OMZ: '$ZSH'" # Removing debug echo

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# We are setting it to Powerlevel10k
# ZSH_THEME="powerlevel10k" # Commenting out to let P10k take over via direct sourcing

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS_STRING="%F{yellow}waiting...%f"
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of an existing format name, or a custom format with strftime
# options.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(git bundler ruby pip python)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  sudo
  z # zoxide (ensure zoxide is in home.packages in home.nix)
  fzf # (ensure fzf is in home.packages in home.nix)
  # Add other plugins you want here
)

# This sources Oh My Zsh
# Make sure Oh My Zsh is installed and $ZSH is set correctly.
# (Home Manager's oh-my-zsh package should handle this)
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
else
  echo "Error: Oh My Zsh not found at $ZSH. Please check your installation."
fi

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set up your environment variables during the transition period.
# For example source ~/.bash_profile

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim' # or 'code -w' for VS Code
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For example:
# alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="nvim $ZSH"
# alias hm-switch="home-manager switch --flake ~/.dotfiles/nixos#chris"

# To customize Powerlevel10k prompt, run `p10k configure` or edit ~/.p10k.zsh.
# This will be created by `p10k configure` and symlinked by Home Manager
# from your config/zsh/.p10k.zsh file.
# It's important to source it *after* Oh My Zsh and ZSH_THEME is set.
 
if [[ -f "${POWERLEVEL10K_PATH}/powerlevel10k.zsh-theme" ]] then 
  source "${POWERLEVEL10K_PATH}/powerlevel10k.zsh-theme"
else
  echo "[.zshrc DEBUG] No .p10k.zsh found to source."
fi

if [[ -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
else
  echo "[.zshrc DEBUG] No .p10k.zsh found to source."
fi

if [[ -f "${ZSH_PLUGIN_AUTOSUGGESTIONS_DIR}/zsh-autosuggestions.zsh" ]]; then
  source "${ZSH_PLUGIN_AUTOSUGGESTIONS_DIR}/zsh-autosuggestions.zsh"
else
  echo "[.zshrc DEBUG] No zsh-autosuggestions found to source."
fi

# Example for fzf configuration (if you use the fzf plugin)
# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd --type d . --hidden --exclude .git"
