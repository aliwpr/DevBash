#!/usr/bin/env bash
# create a simple filesystem just for demonstrate
fs=()

function created {
    local filename="$1"
    fs+=("$filename")
    echo "filename create: $filename"
}

function deleted {
    local filename="$1"
    if [[ "${fs[@]}"  =~   "$filename" ]];then
    fs=("${fs[@]/$filename}")
    echo "deleted: $filename"
    else
    echo "$filename not exits"
    fi

}
# you can call it replace
function moved {
    local source=$1
    local destination=$2
    if [[  "${fs[@]}" =~ "$source" ]];then
    fs=("${fs[@]/$source}")
    fs+=("$destination")
    echo "file $source moved with $destination"
    else
    echo "$source not found"
    fi
}

function listed {
    echo "items listed shown below: "
    for item in "${fs[@]}";do
    echo $item
    done
}

while true; do
    echo "welcome to fs simulation actions are create delete move list exit "
    read -p "what do you want to do? " option

    case $option in
        create)
        read -p "type a name of your file which you want to create: " c
        created $c
        ;; 
        delete)
        read -p "type a name which u want to delete: " d
        deleted $d
        ;;
        move)
        read -p "type a file which you want to move: " m1
        read -p "type a file which you want to replace by: " m2
        moved $m1 $m2
        ;;
        list)
       
        listed 
        ;;
        exit)
        echo "thanks for using"
        exit 0
        ;;
        *)
        echo "option is invalid"
    esac
done
