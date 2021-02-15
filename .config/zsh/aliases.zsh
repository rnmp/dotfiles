# Aliases
alias ..='cd ..'
alias -- -='cd -'
alias x='exit'
alias vim='nvim'
alias t='tmuxinator'
alias k='killall -9'

# Manage dotfiles
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Reset MAC address which can fool some airport timed wifi sessions
alias airport_hell="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"
