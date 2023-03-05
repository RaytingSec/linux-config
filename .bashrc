# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

# Add useful commands to path

# On Linux:
# # User specific environment
# if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
#     PATH="$HOME/.local/bin:$HOME/bin:$PATH"
# fi

# Set PATH, MANPATH, etc., for Homebrew.
# Otherwise you can't run things installed by brew without full path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Sublime
PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Python
# Necessary in order to set up powerline shell
PATH="/Users/rayting/Library/Python/3.10/bin:$PATH"

# Powerline
# Activate if command exists
if command -v powerline-daemon &> /dev/null; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    # Mac
    . /Users/rayting/Library/Python/3.10/lib/python/site-packages/powerline/bindings/bash/powerline.sh
    # Ubuntu I think:
    # . /usr/share/powerline/integrations/powerline.sh
    # Fedora:
    # . /usr/share/powerline/bash/powerline.sh
# Else use a simple PS1
else
    # Simple PS1
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

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
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    # Linux
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion.d ]; then
        . /etc/bash_completion.d
    # Mac
    elif [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]]; then
        . /opt/homebrew/etc/profile.d/bash_completion.sh
    fi
fi

# Script and executable dirs
if [[ -e "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi
if [[ -e "$HOME/py" ]]; then
    PATH="$HOME/py:$PATH"
fi

# Local bash config
if [[ -f ~/.bashrc_local ]]; then
    . ~/.bashrc_local
fi

# Alias definitions
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi
if [[ -f ~/.bash_aliases_local ]]; then
    . ~/.bash_aliases_local
fi

# Welcome text and MOTD
if [[ -f ~/.bash_motd ]]; then
    . ~/.bash_motd
fi

# Python venv helper
if [[ -f ~/.py_autovenv ]]; then
    . ~/.py_autovenv
fi

# User's global definitions

export EDITOR=nvim
# Fucking mac
export BASH_SILENCE_DEPRECATION_WARNING=1
# I'm not sure if this is needed
# export PATH
