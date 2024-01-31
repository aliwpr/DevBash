#!/usr/bin/bash
# easy replace lol!
if [[ $# -ne 3 ]];then
echo "give me 1: a word 2:replaced word 3:a filename"
exit 1 
fi 
word="$1"
replaced="$2"
filename="$3"

if [[ ! -f $filename ]];then
echo "file not exist"
exit 1 
fi

command=`sed -i s/"$word"/"$replaced"/g $filename`

if [[ $? -eq 0 ]];then
echo "you can enjoy the edited file with your desired chang"
exit 0
else 
exit 1
fi