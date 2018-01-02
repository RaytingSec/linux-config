# ls
alias ll='ls -alhF --group-directories-first'
alias l='ls -ACF'
cl () { cd "$@" && l; }

# Searching
# grep
alias gref='grep -Rin'
alias grefa='grep -Rina'
# File name search
findname () { find . ! -readable -prune -o -iname "*$@*" -print; }

# diff
alias diff='colordiff -u'  # useful for directories
alias gdiff='git diff'     # better output format in general

# Coding
alias py='python'
alias py3='python3'
alias ipy='ipython'
alias gpp='g++ -std=c++11'
alias pip-upgradeall="pip list --outdated | cut -d ' ' -f1 | xargs -n1 sudo -H pip3 install -U"

# Misc
epoch () { date -u --date '@'$@; }  # Convert unix epoch timestamp
alias open='xdg-open'
alias yiff='sudo -E'
alias todaysnotes='py3 ~/py/notes.py'
alias git-signoff='git push && exit'
# alias update='sudo apt update && apt list --upgradable; alert'

# Alias from Debian .bashrc
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias hug='fortune hugs'
