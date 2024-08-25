#!/bin/bash

# Get user's full name
# Linux
name=$(getent passwd $USER | cut -d ':' -f 5)  # Linux
# Mac
# name=$(id -F)
# name=${name//','}

# Prepare list of greetings according to local time, as flavor text
hour=$(date +%k)
if [[ $hour -lt 6 ]]; then
    greet=(
        "Greetings, ${name}, friend of the night."
    )
elif [[ $hour -lt 12 ]]; then
    greet=(
        "Good morning, ${name}."
        "Top of the morning to you, ${name}."
     )
elif [[ $hour -lt 19 ]]; then
    greet=(
        "Good afternoon, ${name}."
    )
else
    greet=(
        "Good evening, ${name}."
    )
fi
greet+=(
    "Hello, ${name}."
    "Yip hi ${name} :3"
    "H-hewwo? uwu"
    "OwO"
    "uwu"
)

# Randomly choose a greeting
index=$[$RANDOM % ${#greet[@]}]
greeting=${greet[$index]}

# MOTD text
# motd_long="$greeting, ${name}.\n
# \n
# Today's $(date +"%A"),\n
# $(date +"%F %T %z (%Z)")\n
# \n
# $(hostname): up $(uptime | cut -d 'p' -f 2)\n
# "
motd_short="${greeting}\n
\n
${HOSTNAME}: up $(uptime | cut -d 'p' -f 2)\n
"

# Cowfile selection
cow=tux
if [[ -f /usr/share/cowsay/cows/rayting.cow ]] || [[ -f /usr/share/cowsay/rayting.cow ]]; then
    cow=rayting
elif [[ -r ~/code/foxsay/rayting.cow ]]; then
    cow=~/code/foxsay/rayting.cow
fi

(echo -e $motd_short; fortune) | cowsay -nf $cow
# (echo -e $motd_short; fortune -c linux linuxcookie computers miscellaneous hugs) | cowsay -nf $cow
# | lolcat -p 9 -F .3
printf "\n"
