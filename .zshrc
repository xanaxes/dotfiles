#
# Custom Zsh Configuration File (.zshrc)
# --- NOW CONFIGURED FOR OH MY ZSH (OMZ) ---
# Created by Gemini
#

#####################################################################
# 1. ZSH AND PATH CONFIGURATION
#####################################################################

# Set up common user binary paths
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# --- CUSTOM USERNAME FOR PROMPT DISPLAY (Carried over) ---
# This is required for Termux environments to set the user display name.
export USER="nick"

# Define the custom folder for external plugins/themes (Standard OMZ setting)
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
#
# Custom Zsh Configuration File (.zshrc)
# --- NOW CONFIGURED FOR OH MY ZSH (OMZ) ---
# Created by Gemini
#

#####################################################################
# 1. ZSH AND PATH CONFIGURATION
#####################################################################

# Set up common user binary paths
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# --- CUSTOM USERNAME FOR PROMPT DISPLAY (Carried over) ---
# This is required for Termux environments to set the user display name.
export USER="ZshNinja"

# Define the custom folder for external plugins/themes (Standard OMZ setting)
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

#####################################################################
# 2. OH MY ZSH CORE CONFIGURATION
#####################################################################

# If you installed OMZ to a non-default path, change this.
export ZSH="$HOME/.oh-my-zsh"

# -----------------
# 2a. ZSH THEME (Set to blank to use Starship)
# -----------------
# Setting the theme to blank to disable OMZ's built-in prompt theme.
# Starship will take over the prompt rendering.
ZSH_THEME=""

# -----------------
# 2b. OMZ PLUGINS
# -----------------
# We are loading eight essential plugins. Note that 'fast-syntax-highlighting'
# and 'zsh-autosuggestions' require manual installation (git clone).
plugins=(
    git                         # Core Git aliases and status integration
    fast-syntax-highlighting    # Fast command highlighting (requires install)
    zsh-autosuggestions         # Suggests commands from history (requires install)
    colored-man-pages           # Improves readability of man pages
    dirhistory                  # Quickly navigate backward/forward in directory history
    extract                     # Adds a universal 'x' command to extract any archive type
    web-search                  # Adds aliases for quick web searches (e.g., google, ddg)
    docker                      # Adds shortcuts for Docker and Docker-Compose commands
)

# -----------------
# 2c. OMZ Options
# -----------------
# Uncomment the following line to disable OMZ auto-update.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often auto-updates happen (in days).
# export UPDATE_ZSH_DAYS=13

#####################################################################
# 3. HISTORY SETTINGS (Carried over from previous config)
#####################################################################

# Set the history file path
HISTFILE=~/.zsh_history

# Keep 5000 lines of history in memory and 100000 lines on disk
HISTSIZE=5000
SAVEHIST=10000

# Share history between all running zsh sessions
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

#####################################################################
# 4. ALIASES (Adjusted for OMZ compatibility)
#####################################################################

# Using lsd (LSDeluxe) for enhanced file listing. Requires 'pkg install lsd' or equivalent.
# lsd includes colors, icons, and human-readable sizes by default.
alias ls='lsd'             # Basic lsd listing (icons, colors, tree)
alias ll='lsd -l'          # Long format
alias la='lsd -a'          # List almost all files (excludes . and ..)
alias lall='lsd -la'       # List all files in long format

# --- Community Favorites ---
alias ..='cd ..'           # Shortcut for going up one directory
alias ...='cd ../..'       # Shortcut for going up two directories
alias h='history'          # Simple history alias
alias psg='ps aux | grep -v grep | grep -i' # Find processes by name
alias chx='chmod +x'       # Make file executable
alias myip='curl ipinfo.io/ip' # Get external IP address (requires 'curl')
alias gcl="git branch --merged | grep -v '^*' | xargs git branch -d" # Cleanup merged git branches

# Productivity aliases (kept)
alias zshrc='vim ~/.zshrc'
alias reload='source ~/.zshrc'
alias ip='ip -color=auto'
alias please='sudo'

#####################################################################
# 5. OMZ SOURCE AND POST-CONFIG
#####################################################################

# --- STARSHIP INITIALIZATION ---
# This must run before the OMZ source line but after everything else.
# Ensure you run 'pkg install starship' first!
eval "$(starship init zsh)"

# Initialize Oh My Zsh. This must be the last line of the configuration.
source $ZSH/oh-my-zsh.sh

# Post-OMZ ZSH Options (These will override or reinforce OMZ defaults)
setopt EXTENDED_GLOB    # Extended globbing (e.g., rm **/*.o)
setopt CORRECT          # Fix minor typos in commands automatically
setopt AUTOCD           # Typing a directory name changes to it
setopt AUTO_CD          # Automatically correct a directory name if it's slightly misspelled

# Colorize the output of ls and other utilities (Fallback)
export CLICOLOR=1
export LSCOLORS='ExGxBxDxCxEgEdcdAhhb'

# Disable flow control (stops terminal freezing with Ctrl+S/Ctrl+Q)
stty -ixon
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
