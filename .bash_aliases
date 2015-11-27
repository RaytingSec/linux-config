# ssh
alias ssh-raydar='ssh rayting@raydar.net'
alias ssh-lamp='ssh 192.168.25.140'

# ls
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Git
git log --graph --decorate --pretty=oneline --abbrev-commit

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Misc
alias yiff='sudo -E '

