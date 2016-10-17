# Variables
VM_LAMP=172.16.80.129
VM_DEV=172.16.80.130
VM_SEC=172.16.80.139
VM_MAPR=172.16.80.128

# ssh
alias ssh-raydar='ssh raydar.net'
alias ssh-lamp='ssh $VM_LAMP'
alias ssh-dev='ssh $VM_DEV'
alias ssh-sec='ssh samurai@$VM_SEC'
alias ssh-mapr='ssh mapr@$VM_MAPR'

# ls
alias ll='ls -alhF --group-directories-first'
alias l='ls -ACF'
cl () { cd "$@" && l; }

# grep
alias gref='grep -Rina'

# Coding
alias py3='python3'
alias gpp='g++ -std=c++11'

# Git
# Deprecated in favor of .gitconfig aliases
# alias git-prettylog='git log --graph --decorate --pretty=oneline --abbrev-commit'
# alias git-update='git remote -v update && git status'
alias git-commit='git add -A && git commit -m'
alias git-commit-push='git add -A && git commit && git push'

# Misc
alias yiff='sudo -E'
# alias update='sudo apt update && apt list --upgradable; alert'
alias todaysnotes='py3 $HOME/py/notes.py'
alias diff='colordiff -u'
findname () { find $(pwd) ! -readable -prune -o -iname "*$@*" -print; }

# Alias from Debian .bashrc
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

