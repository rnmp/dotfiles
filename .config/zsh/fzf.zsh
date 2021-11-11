export FZF_DEFAULT_COMMAND='ag --ignore node_modules -g ""'
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/share/zsh/site-functions
export FZF_TMUX=1

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
    --color=fg:-1,bg:#3B4252,hl:1
    --color=fg+:-1,bg+:#3B4252,hl+:1
    --color=info:-1,prompt:-1,pointer:-1
    --color=marker:-1,spinner:-1,header:-1"

export RIPGREP_CONFIG_PATH=~/.ripgreprc
