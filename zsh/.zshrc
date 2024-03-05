# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tanle/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
## Plugins config
## TMUX
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOQUIT=false

plugins=(git zsh-autosuggestions zsh-interactive-cd tmux)

source $ZSH/oh-my-zsh.sh

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
export EDITOR=nvim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
# alias ac="source env/bin/activate"
alias de="deactivate"
alias android-studio='bash /usr/local/android-studio/bin/studio.sh'
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias ..="cd .."
# alias vi-packer="nvim"
alias vi=nvim
alias mosh="export LC_ALL=\"en_US.UTF8\" && mosh"
alias flake8="flake8 --config ~/.config/flake8"
alias :q="exit"

## Android Studio
export PATH=$PATH:~/Android/Sdk/emulator

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=22"
prompt_dir() {
  prompt_segment blue $CURRENT_FG '%2~'
}
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# python env prompt 
export VIRTUAL_ENV_DISABLE_PROMPT=yes
prompt_virtualenv() {
  if [[ -n $VIRTUAL_ENV ]]; then
    envPrompt=$(basename $(dirname $VIRTUAL_ENV));
    if [ "${envPrompt}" = '.envs' ]; then
      envPrompt=$(basename $VIRTUAL_ENV);
    fi
    color=cyan
    prompt_segment $color white
    print -Pn "\UE73C ${envPrompt}"
  fi
}
if test -f ~/.scripts/scripts.sh; then
	source ~/.scripts/scripts.sh
fi

# Fig post block. Keep at the bottom of this file.
export GTK_IM_MODULE=ibus

# cs50
# configure clang
# export CC=clang
# export CFLAGS="-fsanitize=integer -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wshadow -Wno-unused-variable -Wno-unused-parameter"
# export LDLIBS="-lcrypt -lcs50 -lm"
alias make50=CC=clang CFLAGS="-fsanitize=integer -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wshadow -Wno-unused-variable -Wno-unused-parameter" LDLIBS="-lcrypt -lcs50 -lm" make

# Loading more configurations if found
for f in ~/.moredotfiles/zsh/*.zsh(.N); do
# for i in ~/.moredotfiles/zsh/*.zshrc; do
    # [ -f "$i" ] || break
    source "$f"
done
