HISTFILE=~/code/dotfiles/zsh/history.zsh
HISTSIZE=10000
SAVEHIST=1000
setopt share_history
setopt prompt_subst
export PROMPT='%~%F{49}$(git_branch) %F{200}→ %F{15}\n'

export WORDCHARS=''

source ~/code/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

alias ..='cd ..'
alias -- -='cd -'
alias x='exit'
alias vim='nvim'

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/@\1/'
}

function ide () {
  tmux split-window -v -p 30
  tmux split-window -h -p 50
}

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rolando/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rolando/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rolando/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rolando/google-cloud-sdk/completion.zsh.inc'; fi

source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
export FZF_TMUX=1
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Manage dotfiles
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
