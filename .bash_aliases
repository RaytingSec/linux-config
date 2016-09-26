# Variables
VM_LAMP=172.16.80.129
VM_DEV=172.16.80.130
VM_SEC=172.16.80.139

# ssh
alias ssh-raydar='ssh raydar.net'
alias ssh-lamp='ssh $VM_LAMP'
alias ssh-dev='ssh $VM_DEV'
alias ssh-sec='ssh samurai@$VM_SEC'

# ls
alias ll='ls -AlhF --group-directories-first'
alias l='ls -ACF'
cl () { cd "$@" && l; }
findname () { find . -name "*$@*"; }

# grep
alias gref='grep -Rina'

# Coding
alias py3='python3'
alias gpp='g++ -std=c++11'

# Git
alias git-prettylog='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias git-commit='git add -A && git commit -m'
alias git-commit-push='git add -A && git commit && git push'
# alias git-update=''

# Misc
alias yiff='sudo -E'
# alias update='sudo apt update && apt list --upgradable; alert'
alias todaysnotes='py3 $HOME/py/notes.py'
alias diff='colordiff -u'

# Alias from Debian .bashrc
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

