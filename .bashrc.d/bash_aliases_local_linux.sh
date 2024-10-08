# Fix for tmux on recent Linux distros
__vte_prompt_command () { true; }

alias tmux-main="\
    tmux new-session -t main \; \
        rename-window 'mon' \; \
            send-keys 'htop' C-m \; \
            split-window -h \; \
            send-keys 'sudo jnettop -i any' C-m \; \
        new-window \; rename-window 'log' \; \
            send-keys 'journalctl -fn 50' C-m \; \
        new-window \;"

alias wg-up='sudo systemctl start wg-quick@wg0.service'
alias wg-status='systemctl status wg-quick@wg0.service'
alias wg-down='sudo systemctl stop wg-quick@wg0.service'
