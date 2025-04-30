#!/bin/bash

# Získat ID defaultního sinku
default_sink=$(pactl info | grep "Default Sink" | awk '{print $3}')

# Získat mute status a hlasitost
mute_status=$(pactl list sinks | grep -A 15 "$default_sink" | grep "Mute:" | awk '{print $2}')
volume=$(pactl list sinks | grep -A 15 "$default_sink" | grep "Volume:" | head -n 1 | awk '{print $5}')

if [[ "$mute_status" == "yes" ]]; then
    echo "Muted"
else
    echo "VOL: $volume"
fi

