alias ..='cd ..'
alias -- -='cd -'
alias x='exit'
alias vim='nvim'
alias t='tmuxinator'
alias p='t start project'
alias k='killall -9'
alias icat="kitty +kitten icat"

# Manage dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Reset MAC address which can fool some airport timed wifi sessions
alias airport_hell="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"
