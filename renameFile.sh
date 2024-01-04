#!/usr/bin/env bash
# this script give a directory bname and type of suffix and prefix and then a value and rename all of files in that directory as u wish.
if [[ $# -ne 3 ]];then
 echo "this script is for renaming give me directory and prefix or suffix type and your value in a row"
 exit 1
fi 

directory=$1
prefixOrSuffix=$2
value=$3
if [[ ! -d $directory ]];then
echo "directory $directory nist"
exit 1
fi
cd "$directory" || exit 1
for file in *; do 
    if [[ -f $file ]];then
        if [[ $prefixOrSuffix == "prefix" ]];then
               newname="$value$file"
        elif [[ $prefixOrSuffix == "suffix" ]];then
            extension="${file##*.}" # cut the extension from file
            basename="${file%.*}" # cut the basename
            newname="$basename$value.$extension"
         else
            echo "invalid option please use suffix and prefix just"
            exit 1
        fi
            mv "$file" "$newname"
        fi


    done

