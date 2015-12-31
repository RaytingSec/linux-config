# ssh
alias ssh-raydar='ssh rayting@raydar.net'
alias ssh-lamp='ssh 192.168.120.130'
alias ssh-dev='ssh 192.168.25.148'

# ls
alias ll='ls -alhF'
alias l='ls -ACF'

# Git
alias git-prettylog='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias git-commit='git add -A && git commit && git push'

# Misc
alias yiff='sudo -E '
alias update='sudo apt-get update && sudo apt-get upgrade; alert'

# Alias from Debian .bashrc
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

