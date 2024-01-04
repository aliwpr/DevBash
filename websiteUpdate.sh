#!/usr/bin/env bash
# checked if website update or not with notify-send every 20seconds

websiteUrl=https://x.y

file=/mnt/rebase/ali.html

time=20

while true;do
    checked=`curl -s "$websiteUrl"`
    if [[ -f "$file" ]];then
        previous=`cat $file`
        if [[ "$checked" != "$previous" ]] ; then
        notify-send "website got updated"
        echo "$checked" > "$file"
        fi
    else
        echo "$checked" > "$file"
    fi
    sleep "$time"
done 