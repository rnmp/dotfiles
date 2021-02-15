setopt prompt_subst
export PROMPT='%K{brblack}%~%F{green}$(git_branch)%K{brblack}%k'$'\n''%F{210}> %F{15}'
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/@\1/'
}
