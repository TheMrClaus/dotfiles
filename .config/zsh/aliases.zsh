alias ll='ls -lah'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias vi='nvim'
alias vim='nvim'
alias rmrf='rm -rf'
alias reload='source ~/.zshrc'
alias tree='tree -la'

#SSH alias for WSL to use sshkeys from 1Password on host
#alias ssh='ssh.exe'
#alias ssh-add='ssh-add.exe'

alias k='kubectl'
alias frmonit='flux reconcile kustomization monitoring --with-source'
alias frmedia='flux reconcile kustomization media --with-source'

alias k8stree='tree ~/k8s-media-stack -L 3 -I ".git|__pycache__|node_modules|*.md|*.sample|*.lock|*.log|COMMIT_EDITMSG|ORIG_HEAD|FETCH_HEAD|index|description|hooks|info|logs|objects|refs|exclude"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
