# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- OH-MY-ZSH CONFIG ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Updates: Disabled as requested (speed optimization)
zstyle ':omz:update' mode disabled
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

# --- PLUGINS ---
plugins=(
  fzf
  git
  podman
  z
  sudo
  extract
  web-search
  copypath
  zsh-autosuggestions
  fast-syntax-highlighting
  #zsh-syntax-highlighting # MUST BE LAST
)

source $ZSH/oh-my-zsh.sh

# --- USER CONFIGURATION ---
export LANG=en_US.UTF-8

# History Optimization
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space (secrets)
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicates
setopt SHARE_HISTORY          # Share history between tabs immediately
setopt INC_APPEND_HISTORY     # Append to history file immediately, not when shell exits

# Case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# --- ALIASES & TOOLS ---

# EZA / EXA (Modern ls replacement)
if command -v eza &> /dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -l --icons --group-directories-first --git'
  alias la='eza -la --icons --group-directories-first --git'
  alias tree='eza --tree --icons'
elif command -v exa &> /dev/null; then
  alias ls='exa --icons --group-directories-first'
  alias ll='exa -l --icons --group-directories-first --git'
  alias la='exa -la --icons --group-directories-first --git'
  alias tree='exa --tree --icons'
fi

# NVM (Node Version Manager) - LAZY LOAD
# Only loads NVM when you run a node command. Speeds up shell start by ~0.5s.
export NVM_DIR="$HOME/.nvm"
nvm_commands=(nvm node npm npx pnpm yarn)
function $nvm_commands {
  unset -f $nvm_commands
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  $0 "$@"
}

# Bun completions
[ -s "/home/bektigalan/.bun/_bun" ] && source "/home/bektigalan/.bun/_bun"

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey '^ ' autosuggest-accept