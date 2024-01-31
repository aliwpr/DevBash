#!/usr/bin/env bash
# whenever a file created at a soruce directory it move to destination directory and give us a notify
if [[ $# -ne 2 ]]; then
echo "give me 1: a source directory 2: a destination directory"
echo "usage: $0 /mnt /opt/backupfiles/"
exit 1
fi

sourceDir="$1"

destinationDir="$2"

if [[ ! -d "$sourceDir" || ! -d "$destinationDir" ]];then
echo "no such directory"
exit 1
fi

which inotifywait &> /dev/null

if [[ $? -eq 1 ]];then
    echo "please install intofiywait package with apt-install inotify-tools -y then give it a try again "
    exit 1
fi
inotifywait -m -e create -e moved_to --format '%w%f' "$sourceDir" | while read -r file

do
    if [ -f "$file" ]; then
        mv "$file" "$destinationDir/"
        echo "done!"
    fi
done
