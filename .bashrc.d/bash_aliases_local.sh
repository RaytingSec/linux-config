
alias tmux-trader="\
    tmux new-session -t trader \; \
        rename-window 'project' \; \
            split-window -h \; \
            \
            select-pane -t 1 \; \
                send-keys 'cd ~/code/trader' C-m \; \
                send-keys 'tree -L 2' C-m \; \
                send-keys 'git status' C-m \; \
                send-keys 'subl --project trader.sublime-project' \; \
            select-pane -t 2 \; \
                send-keys 'cd ~/code/trader' C-m \; \
                send-keys 'git log-graph --all -10' C-m \; \
        \
        new-window -n 'local-dev' \; \
            split-window -h \; \
            select-pane -t 1 \; \
            split-window -v \; \
            \
            select-pane -t 1 \; \
                send-keys 'cd ~/code/trader' C-m \; \
                send-keys 'tail -fn0 ./logs/traderlib.log' C-m \; \
            select-pane -t 2 \; \
                send-keys 'cd ~/code/trader' C-m \; \
                send-keys 'tail -fn0 ./logs/traderlib_debug.log' C-m \; \
            select-pane -t 3 \; \
                send-keys 'cd ~/code/trader/tests' C-m \; \
                send-keys 'pytest ./unit/' \; \
        \
        new-window -n 'fedora-dev' \; \
            split-window -h \; \
            select-pane -t 1 \; \
            split-window -v \; \
            \
            select-pane -t 1 \; \
                send-keys 'ssh fedora-dev' C-m \; \
                send-keys 'cd ~/code/trader' C-m \; \
                send-keys 'tail -fn0 ./logs/traderlib.log' C-m \; \
            select-pane -t 2 \; \
                send-keys 'ssh fedora-dev' C-m \; \
                send-keys 'cd ~/code/trader' C-m \; \
                send-keys 'tail -fn0 ./logs/traderlib_debug.log' C-m \; \
            select-pane -t 3 \; \
                send-keys 'ssh fedora-dev' C-m \; \
                send-keys 'cd ~/code/trader/tests' C-m \; \
                send-keys 'pytest ./unit/' \; \
        \
        new-window -n 'psql-performance' \; \
            \
            split-window -v -p 40 \; \
            split-window -h \; \
            select-pane -t 1 \; \
            split-window -h \; \
            \
            select-pane -t 1 \; \
                send-keys 'ssh fedora-dev' C-m \; \
                send-keys 'cd ~/code/trader' C-m \; \
            select-pane -t 3 \; \
                send-keys 'ssh -t fedora-dev -- bpytop' C-m \; \
            \
            select-pane -t 2 \; \
                send-keys 'ssh trader-psql' C-m \; \
            select-pane -t 4 \; \
                send-keys 'ssh -t trader-psql -- bpytop' C-m \; \
        \
        select-window -t project \;
"

alias tmux-foxnet="
    tmux new-session -t foxnet \; \
        rename-window 'local' \; \
            send-keys 'cd ~/code/foxnet' C-m \; \
            send-keys 'tree -L 2' C-m \; \
        \
        new-window -n 'substrate' \; \
            split-window -h \; \
            select-pane -t 1 \; \
            split-pane -v \; \
            \
            select-pane -t 1 \; \
                send-keys 'ssh -t truenas -- zpool iostat -v vol1 2' C-m \; \
            select-pane -t 2 \; \
                send-keys 'ssh -t truenas -- iostat -x da{0,1,2,3,4,5,6,7} nvd0 2' C-m \; \
            select-pane -t 3 \; \
                send-keys 'ssh proxmox' C-m \; \
                send-keys 'bpytop' C-m \;
"

subl-trading () {
    subl_project_file=~/Documents/Finance/trading-journal/trading-journal.sublime-project
    # journal_template=~/Documents/Finance/trading-journal/template.md  # need to check if file exists already and avoid overwriting
    today_journal_file=~/Documents/Finance/trading-journal/`date -I`.md
    today_trades_file=~/Documents/Finance/thinkorswim/`date -I`_simulated-trades.txt

    subl \
        --project ${subl_project_file} \
        ${today_journal_file} \
        ${today_trades_file} \
}
