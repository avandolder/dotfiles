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
#source /usr/share/doc/pkgfile/command-not-found.bash

#source "$HOME/.cargo/env"
#source "$HOME/.bash_completion/alacritty.bash"

# PS1='[\u@\h \W]\$ '
source ~/.git-prompt.sh
hg_ps1() { hg prompt "{bookmark} " 2> /dev/null; }
export PS1='\[\033[01;31m\][\D{%F %T}] \[\033[01;32m\]\u\[\033[02;34m\]@\h \
\[\033[01;36m\]\W \[\033[01;33m\]$(__git_ps1 "(%s) ")$(hg_ps1)\[\033[01;32m\]\
\$ \[\033[00m\]'

export LANG=en_CA.UTF-8
export LANGUAGE=en_CA.UTF-8

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
alias e=$EDITOR
alias E=sudoedit
alias vim=nvim
alias vi=nvim
alias moz-mach="$HOME/dev/moz/mach"

export TERMINAL="konsole"

# neovide
export NeovideMultiGrid="true"

# add ruby gems to path
export PATH="$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:"

export XDG_CONFIG_HOME="$HOME/.config"

shopt -s autocd
export PATH="$PATH:$HOME/.local/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
