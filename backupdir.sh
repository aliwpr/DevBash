#!/usr/bin/env bash
#USAGE: give me a directory name and backup it to another directory which exist or you can say yes for creating by me with timestamp.
if [[ $# -ne 3 ]];then
echo "give me a directory as a first item  and name of backup directory as a second item if you want me to create a backup dir as well say yes or no at last"
exit 1
fi

directory=$1
backup=$2
New=$3
if [[ $New == "yes" || $New == "YES" ]]; then
    mkdir -p "$2"
    if [[ $? -eq 1 ]] ;then 
        echo "cant create a directory"
        exit 1
    fi 
fi

if [[ ! -d $directory || ! -d $backup ]];then
echo "$1 directory not exist"
exit 1
fi

#20211212103153
timestamp=`date +%Y%m%d%H%M%S`

which rsync # or use command -v option

if [[ $? -eq 1 ]];then
    echo "please install rsync first"
    exit 1
fi

rsync -av --delete "$directory/" "$backup/backup_$timestamp/"

if [[ $? -eq 0 ]];then
    echo "job done"
else
    echo "we have exceptions and cant backup,consider checking logs"
    exit 1
fi


