# Use c-z to both bg and fg a process
function Resume {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

# Share history across sessions
HISTFILE=~/.config/zsh/history.zsh
HISTSIZE=10000
SAVEHIST=1000
setopt share_history
