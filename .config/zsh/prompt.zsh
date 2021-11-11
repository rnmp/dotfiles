setopt prompt_subst
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=101'
export PROMPT='%~%F{108}$(git_branch)'$'\n''%F{109}> %f'
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/@\1/'
}
