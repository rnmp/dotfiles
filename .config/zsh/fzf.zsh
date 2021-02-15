export FZF_DEFAULT_COMMAND='ag --ignore node_modules -g ""'
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/share/zsh/site-functions
export FZF_TMUX=1

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
