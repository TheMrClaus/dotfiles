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
# Completion System
# ==============================
autoload -Uz compinit
zstyle ':completion:*' rehash true
if [[ -n $ZDOTDIR && -f "$ZDOTDIR/.zcompdump" ]]; then
  compinit -C
else
  compinit
fi
zmodload zsh/complist

# ==============================
# Key Bindings
# ==============================
bindkey "^R" history-incremental-search-backward
# Ghostty fixes
bindkey ";5D" backward-word
bindkey ";5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# ==============================
# Environment Variables
# ==============================
export CLICOLOR=1
export LS_COLORS=""
export FZF_DEFAULT_OPTS="--height 40% --reverse --border"

# Path Management
export PATH="$HOME/.npm-global/bin:$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"

# ==============================
# Plugin Management
# ==============================
# FZF
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
bindkey -M emacs '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

# Syntax Highlighting
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto-suggestions
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ==============================
# Custom Configurations
# ==============================
# Git branch parsing for prompt
parse_git_branch() {
  git branch --show-current 2>/dev/null
}
export PS1="%n@%m %~ \$(parse_git_branch) %# "

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

# Starship
[[ -t 1 ]] && eval "$(starship init zsh)"

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ==============================
# Custom Files Sourcing
# ==============================
ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Source order: env -> functions -> aliases
[[ -f "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"

if [ -d "$ZSH_CONFIG_DIR/functions" ]; then
    for file in "$ZSH_CONFIG_DIR"/functions/*.zsh; do
        [[ -f "$file" ]] && source "$file"
    done
fi

[[ -f "$ZSH_CONFIG_DIR/aliases.zsh" ]] && source "$ZSH_CONFIG_DIR/aliases.zsh"
