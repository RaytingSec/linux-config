# Common bash aliases

# ls
alias ll='ls --color -alhF'
alias l='ls --color -ACF'
# exa
# alias ll='exa -alhF'
# alias l='exa -aF'

# grep
# alias grep='grep --color'  # Not sure if this is still needed
# r: recursive
# f: fuzzy, case insensitive search
# c: add context
alias grepr='grep -Rn'
alias greprc='grep -Rn -3'
alias greprf='grep -Rin'
alias greprfc='grep -Rin -3'

# find
findname () { find . ! -readable -prune -o -iname "*$@*" -print; }
# OS X alternative
# findname () { find . -iname "*$@*" -print; }

# diff
# alias diff='colordiff -u'  # useful for directories
alias gdiff='git diff --no-index'  # better output format in general

# vim
alias vi='vim'
alias vim='nvim'

# Other util enhancements
alias tree='tree -C -F'
alias less='less -NRJ'
alias mtr='mtr -o "LSRD NABWV JMX"'

# Coding
alias py='python'
alias py3='python3'
alias ipy='ipython'
alias gpp='g++ -std=c++11'
alias pip-upgradeall="pip list --outdated | cut -d ' ' -f1 | xargs -n1 sudo pip3 install -U"

# Misc
epoch () { date -u --date '@'$@; }  # Convert unix epoch timestamp
alias open='xdg-open'

# Alias from Debian .bashrc
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias hug='fortune hugs'

bash-reload () {
    # Load system-wide bashrc
    # Catches `bashrc` and `bash.bashrc`
    source /etc/*bashrc

    # Load user bashrc
    source ~/.bash_profile
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

# Create a 2x2 grid and run network connectivity tests
alias tmux-conn-test="
    tmux new-window \; \
        split-window -h \; \
        select-pane -t 1 \; \
        split-window -v \; \
        select-pane -t 3 \; \
        split-window -v \; \
        \
        select-pane -t 1 \; \
            send-keys 'ping -c1 8.8.8.8' C-m \; \
            send-keys 'mtr -n -i 2 8.8.8.8' \; \
        select-pane -t 2 \; \
            send-keys 'dig A google.com' C-m \; \
        select-pane -t 3 \; \
            send-keys 'curl -v https://httpbin.org/get' C-m \; \
        select-pane -t 4 \; \
            send-keys 'curl -v https://ifconfig.co/json | jq .' C-m \;
"
# Old conn test alias
# alias tmux-conntest="
#     tmux new-window -n 'connectivity-test' \; \
#             send-keys 'dig google.com' C-m \; \
#         split-window -h \; \
#         select-pane -t 1 \; \
#         split-window -v \; \
#             send-keys 'ping -c1 8.8.8.8' C-m \; \
#             send-keys 'mtr -n -i 2 8.8.8.8' \; \
#         select-pane -t 3 \; \
#             send-keys 'curl -v httpbin.org/get | jq' C-m \; \
#             send-keys 'curl https://ifconfig.co/json | jq' \;
# "

# Notes helpers

# Recursive find substring of notes filename
findnotes () {
    find ~/Documents/notes/ -iname "*$@*.md" -type f
}
# Basically same as findnotes but open the first result with vim
opennotes () {
    note=$(find ~/Documents/notes/ -iname "*$@*.md" -type f | head -1)
    if [ "$note" = "" ]; then
        echo "Note not found with name '$@'"
    else
        vim "$note"
    fi
}

# Project helpers

# Search for project dir by substring matching dir name
findproject () {
    find ~/projects/ -maxdepth 1 -iname "*$@*" -type d
}
# Access a project dir via serial number
cdproject () {
    cd ~/projects/${@}_*
}

# Noisy but has timestamp
tcp-up-while () {
    host=${1}
    port=${2}
    while :
    do
        sleep 1;
        date -Iseconds;
        nc -zv $host $port -w 0.5
    done
}
tcp-up-watch () {
    host=${1}
    port=${2}
    watch -d -n 2 -- "date -Iseconds; nc -zv ${host} ${port} -w 0.5;"
}

alias tcp-up="tcp-up-watch"  # Default to using `watch`
