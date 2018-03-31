# Color shortcuts
RED=$fg[red]
MAGENTA=$fg[magenta]
YELLOW=$fg[yellow]
GRAY=$fg[gray]
GREEN=$fg[green]
PURPLE=$fg[purple]
WHITE=$fg[white]
WHITE=$fg[gray]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Prompt components
SEP=" %{$GRAY%}■%{$RESET_COLOR%}"
PROMPT_CHAR="%{$GRAY%}❯%{$RESET_COLOR%} "

# Format git info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$WHITE%}$SEP "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}U"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}D"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$RED%}R"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$RED%}M"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}A"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$RED%}??"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Set prompt format
PROMPT='
%*% $SEP %n% $SEP %~% $(git_prompt_info)$(git_prompt_status)%{$RESET_COLOR%}
$PROMPT_CHAR'
