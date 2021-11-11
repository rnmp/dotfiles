source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/improvements.zsh
source ~/.config/zsh/path.zsh
source ~/.config/zsh/prompt.zsh

source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/gcloud.zsh
source ~/.config/zsh/node.zsh
source ~/.config/zsh/ruby.zsh
source ~/.config/zsh/vim.zsh
source ~/.config/zsh/tmux.zsh

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.credentials

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/rolando/code/AirLabsTeam/backend/node_modules/tabtab/.completions/slss.zsh
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
