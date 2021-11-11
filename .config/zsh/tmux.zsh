# Thanks https://www.reddit.com/r/neovim/comments/aex45u/integrating_nvr_and_tmux_to_use_a_single_tmux_per/

if [[ -n $TMUX ]]; then
  export NVIM_LISTEN_ADDRESS=/tmp/nvim_$USER_`tmux display -p "#{window_id}"`
fi

function nv() {
  if [ ! -z "$TMUX" ]; then
    local ids="$(tmux list-panes -a -F '#{pane_current_command} #{window_id} #{pane_id}' | awk '/^nvim / {print $2" "$3; exit}')"
    local window_id="$ids[(w)1]"
    local pane_id="$ids[(w)2]"
    [ ! -z "$pane_id" ] && tmux select-window -t "$window_id" && tmux select-pane -t "$pane_id"
  fi
  nvr -s $@
  clear
}
