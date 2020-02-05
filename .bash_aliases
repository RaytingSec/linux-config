# Common bash aliases

# ls
alias ll='ls -alhF --group-directories-first'
alias l='ls -ACF'
cl () { cd "$@" && l; }

# grep
alias grep='grep --color'
alias gref='grep -Rin'
alias grefa='grep -Rina'

# find
findname () { find . ! -readable -prune -o -iname "*$@*" -print; }
# OS X alternative
# findname () { find . -iname "*$@*"; }

# diff
# alias diff='colordiff -u'  # useful for directories
alias gdiff='git diff --no-index'  # better output format in general

# vim
alias vi='vim'
alias vim='nvim'

# Other util enhancements
alias tree='tree -C -F'
alias less='less -NRJ'

# Coding
alias py='python'
alias py3='python3'
alias ipy='ipython'
alias gpp='g++ -std=c++11'
alias pip-upgradeall="pip list --outdated | cut -d ' ' -f1 | xargs -n1 sudo pip3 install -U"

# Misc
epoch () { date -u --date '@'$@; }  # Convert unix epoch timestamp
alias open='xdg-open'
# alias update='sudo apt update && apt list --upgradable; alert'

# Alias from Debian .bashrc
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias hug='fortune hugs'

bash-reload () {
    source /etc/bashrc  # also reloads ~/.bashrc
    # source ~/.bash_profile
    # source ~/.bashrc
    # source ...
}

# tmux hacks
tmux-send-right () {
    command="$@"
    tmux split-window -h \; send-keys "cd $(pwd)" C-m \; send-keys "$command" C-m \; select-pane -L \;
}
tmux-send-down () {
    command="$@"
    tmux split-window -v \; send-keys "cd $(pwd)" C-m \; send-keys "$command" C-m \; select-pane -U \;
}
# tmux sessions
alias tmux-main="tmux new-session -t main \;"  # Edit as needed
# Workspace on large monitors
# 25% 50% 25% split
alias tmux-workspace="tmux new-window \; \
    split-window -h -p 75 \; \
    split-window -h -p 33 \; \
    split-window -v -t 1 \; \
    split-window -v -t 4 \; \
    select-pane -t 3 \;"

# Notes helpers
findnotes () {
    find ~/Documents/Notes/ -iname "*$@*.md" -type f
}
opennotes () {
    note=$(find ~/Documents/Notes/ -iname "*$@*.md" -type f | head -1)
    if [ "$note" = "" ]; then
        echo "Note not found with name '$@'"
    else
        vim $note
    fi
}
