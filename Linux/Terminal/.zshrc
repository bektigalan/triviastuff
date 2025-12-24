# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- OH-MY-ZSH CONFIG ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Updates: Disabled as requested
zstyle ':omz:update' mode disabled
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

# --- PLUGINS ---
plugins=(
  fzf
  git
  podman
  sudo
  extract
  web-search
  copypath
  zsh-autosuggestions
  fast-syntax-highlighting # Must be last
)
# Note: 'z' plugin removed in favor of zoxide (configured below)

source $ZSH/oh-my-zsh.sh

# --- USER CONFIGURATION ---
export LANG=en_US.UTF-8

# History Optimization
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicates
setopt SHARE_HISTORY          # Share history immediately
setopt INC_APPEND_HISTORY     # Append immediately

# Case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# --- ALIASES & TOOLS ---

# 1. ZOXIDE (Better 'cd')
# Replaces the 'z' plugin. "cd" now remembers where you go.
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

# 2. BAT (Better 'cat')
# Syntax highlighting for file reading
if command -v bat &> /dev/null; then
  alias cat='bat --style=plain' # simple output
  alias catp='bat'              # pretty output with line numbers
elif command -v batcat &> /dev/null; then
  alias cat='batcat --style=plain'
  alias catp='batcat'
fi

# 3. EZA (Better 'ls')
if command -v eza &> /dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -l --icons --group-directories-first --git'
  alias la='eza -la --icons --group-directories-first --git'
  alias tree='eza --tree --icons'
fi

# 4. PODMAN TOOLS
# "Nuclear" cleanup for Podman (removes unused containers/images/volumes)
alias pclean='podman system prune -a --volumes'
# Prune only dangling images
alias pprune='podman image prune'

# 5. UTILITIES
# Kill process on specific port (Usage: killport 3000)
function killport() {
  if [ -z "$1" ]; then
    echo "Usage: killport <port_number>"
    return 1
  fi
  local pid=$(lsof -ti tcp:$1)
  if [ -z "$pid" ]; then
    echo "No process found on port $1"
  else
    echo "Killing process $pid on port $1..."
    kill -9 $pid
  fi
}

# --- KEYBINDINGS ---
# Fix Ctrl+Left/Right arrow navigation
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-kill-word
# Autosuggest accept (Ctrl+Space is standard, or just Right Arrow)
bindkey '^ ' autosuggest-accept

# --- RUNTIME CONFIG ---

# NVM (Node Version Manager) - LAZY LOAD
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