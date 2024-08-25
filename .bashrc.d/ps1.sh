# Powerline
# Activate if command exists
if command -v powerline-daemon &> /dev/null; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    # Mac
    # . /Users/rayting/Library/Python/3.10/lib/python/site-packages/powerline/bindings/bash/powerline.sh
    # Ubuntu I think:
    # . /usr/share/powerline/integrations/powerline.sh
    # Fedora:
    . /usr/share/powerline/bash/powerline.sh
# Else use a simple PS1
else
    # Simple PS1
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
