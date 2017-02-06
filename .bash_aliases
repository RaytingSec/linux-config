# Variables
VM_LAMP=172.16.80.150
VM_DEV=172.16.80.143
VM_SEC=172.16.80.139
VM_MAPR=172.16.80.128

# ssh
alias ssh-raydar='ssh raydar.net'
alias ssh-lamp='ssh $VM_LAMP'
alias ssh-dev='ssh $VM_DEV'
alias ssh-sec='ssh samurai@$VM_SEC'

# ls
alias ll='ls -alhF --group-directories-first'
alias l='ls -ACF'
cl () { cd "$@" && l; }

# Searching
# grep
alias gref='grep -Rina'
# File name search
findname () { find . ! -readable -prune -o -iname "*$@*" -print; }

# diff
alias diff='colordiff -u' # useful for directories
alias gdiff='git diff'    # better output format in general

# Coding
alias py3='python3'
alias gpp='g++ -std=c++11'

# Misc
alias yiff='sudo -E'
alias todaysnotes='py3 $HOME/py/notes.py'
# alias update='sudo apt update && apt list --upgradable; alert'

# Alias from Debian .bashrc
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
