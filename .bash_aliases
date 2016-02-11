# ssh
alias ssh-raydar='ssh rayting@raydar.net'
alias ssh-lamp='ssh 172.16.159.130'
alias ssh-dev='ssh 172.16.159.129'

# ls
alias ll='ls -alhF'
alias l='ls -ACF'
cl () { cd "$@" && l; }

# grep
alias gref='grep -Rin'

# Git
alias git-prettylog='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias git-commit='git add -A && git commit && git push'

# Misc
alias yiff='sudo -E '
alias update='sudo apt-get update && sudo apt-get -y upgrade; alert'

# Alias from Debian .bashrc
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

