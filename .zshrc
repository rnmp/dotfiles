export EDITOR='nvim'

# vi mode
bindkey -v

# No delay for ESC key
KEYTIMEOUT=1

# Cursors a bit more consistent with nvim
# https://archive.emily.st/2013/05/03/zsh-vi-cursor/
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

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
export PROMPT='%K{brblack}%~%F{green}$(git_branch)%K{brblack}%k'$'\n''%F{200}→ %F{15}'
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/@\1/'
}

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
export FZF_TMUX=1

# Aliases
alias ..='cd ..'
alias -- -='cd -'
alias x='exit'
alias vim='nvim'
alias t='tmuxinator'

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
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
