#!/bin/bash
# Automatically activate and deactivate virtualenv as you change directories

# Print all possible candidates for venv relative to the directory $1. Used in
# venv_find() for every directory starting from the current and up to the root.
# Only .venv will be recognized, but additional names may be added.
function venv_candidates() {
    echo $1/.venv
}

# Finds the closest venv directory, starting from $1, and going up to the root.
# If the target directory is not specified as an argument, current directory is used.
# Prints the venv path found, or nothing otherwise.
function venv_find() {
    local venv_root=${1:-"."}
    local venv_found=""

    # The cycle is just for the case with broken root folder detection - never do more than N iterations.
    for (( i=10; i > 0; i-- )); do
        local venv_real=$(cd $venv_root && pwd -P)
        local venv_name=$(basename "$venv_real")
        for candidate in $( venv_candidates $venv_real ) ; do
            # echo CANDIDATE=$candidate >&2
            if [ -f "$candidate/bin/activate" ]; then
                echo $(cd $candidate && pwd -P)
                return
            fi
        done

        if [ "$venv_real" = "/" ]; then
            break
        fi
        venv_root=$venv_root/".."
    done
}

# Find current venv path using $VIRTUAL_ENV. Active venv will have variable set,
# and deactivate function available.
function venv_curr() {
    if [ -n "$VIRTUAL_ENV" -a "$(type -t deactivate)" = 'function' ]; then
        echo $VIRTUAL_ENV
    fi
}

# Activates the closest venv relative to the working dir, if different from
# current active venv. Deactivates current venv when its directory tree is left.
function venv_auto() {
    venv_new="$(venv_find)"
    venv_old="$(venv_curr)"

    if [ -z "$venv_new" -a -n "$venv_old" ]; then
        echo "Deactivating $(_venv_name $venv_old)..."
        deactivate
    elif [ -n "$venv_new" -a "$venv_new" != "$venv_old" ]; then
        echo "Activating $(_venv_name $venv_new)..."
        # Uncomment if using your own PS1
        VIRTUAL_ENV_DISABLE_PROMPT=1
        source "$venv_new"/bin/activate
    fi
}

# Prints out the venv name for use in bash PS1, for example:
#   PS1="$(_virtualenv_ps1) "$PS1
_venv_ps1() {
    if [[ -z "$VIRTUAL_ENV" ]]; then
        printf ""
    else
        # venv folder name
        # printf "$(basename $(venv_curr))"
        # Project dir's name
        printf "$(basename $(dirname $(venv_curr)))"
    fi
}

_venv_name() {
    printf $(basename $(dirname $1))
}

# venv switching is managed by `uv`
# export PROMPT_COMMAND="venv_auto; $PROMPT_COMMAND"
