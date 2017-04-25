local ret_status="%(?:%{$FG[072]%}➜ :%{$FG[124]%}➜ )"
PROMPT='${ret_status} %{$FG[142]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[109]%}git:(%{$FG[167]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[109]%}) %{$FG[214]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[109]%})"
