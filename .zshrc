# ==============================
# Core ZSH Configuration
# ==============================
setopt correct
setopt auto_cd
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ==============================
# Environment Variables
# ==============================
export CLICOLOR=1
export LS_COLORS=""

# Path Management
export PATH="$HOME/.npm-global/bin:$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"
export FZF_BASE=/usr/share/fzf

# Oh-My-Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugin Management
plugins=(
  git
  fzf
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# ==============================
# Tool Initializations
# ==============================
# Pyenv
eval "$(pyenv init - zsh)"

# SSH Agent
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/github 2>/dev/null
fi

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ==============================
# Custom Files Sourcing
# ==============================
ZSH_CONFIG_DIR="$HOME/.config/zsh"

source $HOME/.agent-bridge.sh

# Source order: env -> functions -> aliases
[[ -f "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"
if [ -d "$ZSH_CONFIG_DIR/functions" ]; then
    for file in "$ZSH_CONFIG_DIR"/functions/*.zsh; do
        [[ -f "$file" ]] && source "$file"
    done
fi
[[ -f "$ZSH_CONFIG_DIR/aliases.zsh" ]] && source "$ZSH_CONFIG_DIR/aliases.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
