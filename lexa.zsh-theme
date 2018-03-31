# Set prompt format
PROMPT='
$TIME $CONDITIONAL_MACHINE $DIR $(git_prompt_info) $(git_prompt_status)
$PROMPT_SYMBOL'

# Prompt components
SEP="%F{242}•%f"
PROMPT_SYMBOL="%F{242}❯%f "

TIME="%*"
MACHINE="%m"
DIR="%~"

# Use machine name if currently ssh'd into a remote machine
if [[ -n $SSH_CONNECTION ]]; then
  CONDITIONAL_MACHINE="$SEP %F{cyan}$MACHINE%f $SEP"
else
  CONDITIONAL_MACHINE="$SEP"
fi

# Format git info
ZSH_THEME_GIT_PROMPT_PREFIX="$SEP "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Git statuses
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{red}U%f "
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}D%f "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{red}R%f "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{red}M%f "
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}A%f "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{red}??%f "
ZSH_THEME_GIT_PROMPT_AHEAD="%F{red}↑%f "
ZSH_THEME_GIT_PROMPT_BEHIND="%F{red}↓%f "
