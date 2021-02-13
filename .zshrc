export EDITOR='nvim'

# No delay for ESC key
KEYTIMEOUT=1


# vi mode
function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor
      viins|main) print -n '\033[5 q';; # line cursor
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
bindkey -v

function Resume {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

# ZSH Settings
HISTFILE=~/code/dotfiles/zsh/history.zsh
HISTSIZE=10000
SAVEHIST=1000
setopt share_history
setopt prompt_subst

source ~/code/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Manage dotfiles
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Prompt
export PROMPT='%K{brblack}%~%F{green}$(git_branch)%K{brblack}%k'$'\n''%F{200}> %F{15}'
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/@\1/'
}

# FZF
export FZF_DEFAULT_COMMAND='ag --ignore node_modules -g ""'
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/share/zsh/site-functions
export FZF_TMUX=1

# Aliases
alias ..='cd ..'
alias -- -='cd -'
alias x='exit'
alias vim='nvim'
alias t='tmuxinator'
alias k='killall -9'
alias :Bclose='exit'

function ide () {
  tmux split-window -v -p 30
  tmux split-window -h -p 50
}

# Ruby
eval "$(rbenv init -)"

# Node.js
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# GCloud
if [ -f '/Users/rolando/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rolando/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/rolando/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rolando/google-cloud-sdk/completion.zsh.inc'; fi

# PATH
export PATH="$HOME/.poetry/bin:/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$HOME/usr/local/bin:/.poetry/bin:/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Misc.
alias airport_hell="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"

# Dracula theme for FZF
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

# tmux autocomplete?
function tm() {
    [[ -z "$1" ]] && { echo "usage: tm <session>" >&2; return 1; }
    tmux has -t $1 && tmux attach -t $1 || tmux new -s $1
}

function __tmux-sessions() {
    local expl
    local -a sessions
    sessions=( ${${(f)"$(command tmux list-sessions)"}/:[ $'\t']##/:} )
    _describe -t sessions 'sessions' sessions "$@"
}
compdef __tmux-sessions tm

# NVM automation
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/slss.zsh
