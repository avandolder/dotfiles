#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -FG'
alias la='ls -AFG'
alias ll='ls -lFG'

# Enable command not found prompts
source /usr/share/doc/pkgfile/command-not-found.bash

source "$HOME/.cargo/env"
source "$HOME/.bash_completion/alacritty.bash"

# PS1='[\u@\h \W]\$ '
source ~/.git-prompt.sh
PS1='\[\033[01;31m\][\D{%F %T}] \[\033[01;32m\]\u\[\033[02;34m\]@\h \
\[\033[01;36m\]\w \[\033[01;33m\]$(__git_ps1 "(%s)")\[\033[01;32m\]\n\
\$ \[\033[00m\]'

export PATH="$PATH:/usr/lib/smlnj/bin:$HOME/.local/bin:$HOME/.luarocks/bin:$HOME/research/dotty"

export TERM=xterm-24bit
alias ssh="TERM=xterm-256color ssh"

export LANG=en_CA.UTF-8
export LANGUAGE=en_CA.UTF-8

export TERMINAL="emacsclient -c -e '(term \"bash\")' -a \"\""
export EMACS_SERVER_FILE="instance1"
export EMACS_SOCKET_NAME="instance1"
export VISUAL="emacsclient"
export EDITOR="emacsclient -t"
export SUDO_EDITOR="emacsclient -t"
alias e=$EDITOR
alias E=sudoedit

# Java settings
export JAVA_HOME=/usr

# opam configuration
test -r /home/adam/.opam/opam-init/init.sh && . /home/adam/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# dotnet core
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ROOT=/opt/dotnet
export PATH="$PATH:$HOME/.dotnet/tools"
_dotnet_bash_complete()
{
    local word=${COMP_WORDS[COMP_CWORD]}

    local completions
    completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
    if [ $? -ne 0 ]; then
        completions=""
    fi

    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}
complete -f -F _dotnet_bash_complete dotnet

# haskell stack auto-completion
eval "$(stack --bash-completion-script stack)"

source <(kitty + complete setup bash)

# deno autocomplete
source ~/.bash_completion/deno.bash

# neovide
export NeovideMultiGrid="true"

# add ruby gems to path
export PATH="$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:"


##### BASH_IT config

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/home/adam/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
#THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='avandolder@github.com'

# Don't check mail when opening terminal.
unset MAILCHECK


export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
