# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  zsh-autosuggestions
  colored-man-pages
  zsh-syntax-highlighting
)

export ZSH=~/.oh-my-zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lexa"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# functions and aliases
alias com="ssh lhall@cominor.com -t 'cd Code; zsh'"
alias unix1="ssh unix1"
alias unix2="ssh lhall07@unix2.csc.calpoly.edu"
alias unix3="ssh lhall07@unix3.csc.calpoly.edu"
alias unix4="ssh lhall07@unix4.csc.calpoly.edu"
alias hpm="ssh lhall07@127x10.csc.calpoly.edu"
alias zrc="vim ~/.zshrc"

# Remove gg alias added by git plugin
unalias gg

# Change the color of the tab when using SSH
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

if [[ -n "$SSH_CONNECTION" ]]; then
  tab-color 82 139 220
else
  tab-reset
fi

# iTerm tab title
# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text

#DISABLE_AUTO_TITLE="true"

# setTerminalText () {
#    # echo works in bash & zsh
#    local mode=$1 ; shift
#    echo -ne "\033]title\007"
#}
#stt_both  () { setTerminalText 0 $@; }
#stt_tab   () { setTerminalText 1 $@; }
#stt_title () { setTerminalText 2 $@; }

# use vim keybindings
# bindkey -v

# Allow local overrides
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi
