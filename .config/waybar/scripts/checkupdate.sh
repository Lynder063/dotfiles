#!/bin/bash

updates=$(dnf check-update --refresh -yq | tail -n +2 | grep -E 'x86_64|i686|noarch|aarch64' | awk '{print $1,$2}')
update_count=$(echo "$updates" | grep -v '^$' | wc -l)

alt="has-updates"
if [ $update_count -eq 0 ]; then
    alt="updated"
else
    tooltip=$(echo "$updates" | sed ':a;N;$!ba;s/\n/\\n/g')
fi

echo "{ \"text\": \"$update_count\", \"tooltip\": \"$tooltip\", \"alt\": \"$alt\" }"
