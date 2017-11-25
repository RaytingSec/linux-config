# Colors
ANSI_NORM="\[\033[0m\]"
ANSI_WHITE="\[\033[37m\]"
ANSI_RED="\[\033[31m\]"
ANSI_DULLRED="\[\033[38;5;124m\]"
ANSI_YELLOW="\[\033[33m\]"
ANSI_NEONGREEN="\[\033[38;5;10m\]"
ANSI_GREEN="\[\033[38;5;34m\]"
ANSI_BLUE="\[\033[38;5;39m\]"
ANSI_DULLBLUE="\[\033[38;5;33m\]"
ANSI_GRAY="\[\033[38;5;246m\]"

ANSI_BOLD="\[\033[1m\]"

# Modules
PS1_STARTBRACKET=$ANSI_BOLD$ANSI_NEONGREEN'[ '
PS1_ENDBRACKET=$ANSI_BOLD$ANSI_NEONGREEN' ]'
PS1_DIVIDER=$ANSI_NORM' '
PS1_USRHOST=$ANSI_BOLD$ANSI_BLUE'\u'$ANSI_NORM$ANSI_BLUE'@'$ANSI_BLUE$ANSI_BOLD'\H'
PS1_TIME=$ANSI_NORM$ANSI_NEONGREEN'\A'
PS1_DIR=$ANSI_NORM$ANSI_GRAY'\w'
PS1_END=$ANSI_NORM'\$ '

# Git stuff
PS1_GIT=$ANSI_NORM$ANSI_DULLRED'$(__git_ps1)'
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
# Explicitly unset color (default anyhow). Use 1 to set it.
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

# Python venv stuff
PS1_VENV=$ANSI_NORM$ANSI_DULLBLUE'$(_venv_ps1)'

# If not running interactively, don't do anything
# Prevents errors with scp
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Default
# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# Simple
# PS1=$PS1_USRHOST$PS1_DIVIDER$PS1_DIR$PS1_DIVIDER$PS1_END
# Detailed
PS1=$PS1_TIME$PS1_DIVIDER$PS1_USRHOST$PS1_DIVIDER$PS1_DIR$PS1_GIT$PS1_DIVIDER$PS1_VENV'\n'$PS1_END

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Explicitly set 256 color
#TERM=xterm-256color

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
# export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command, instead of session close.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Script and executable dirs
if [[ -e "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi

if [[ -e "$HOME/py" ]]; then
    PATH="$HOME/py:$PATH"
fi

# Alias definitions
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

# Welcome text and MOTD
if [[ -f ~/.bash_motd ]]; then
    . ~/.bash_motd
fi

# Python venv helper
if [[ -f ~/.py_autovenv ]]; then
    . ~/.py_autovenv
fi
