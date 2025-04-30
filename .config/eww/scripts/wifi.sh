#!/bin/bash

# zjisti jestli jsme pripojeni na wifi
if nmcli -t -f DEVICE,STATE dev | grep -q "^wlp4s0:connected"; then
    ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    strength=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d':' -f2)
    echo "Wi-Fi: $ssid ($strength%)"
# zjisti jestli jsme pripojeni kabelem
elif nmcli -t -f DEVICE,STATE dev | grep -q "^eno1:connected"; then
    echo "Wired"
# jinak neni pripojeno
else
    echo "Disconnected"
fi

