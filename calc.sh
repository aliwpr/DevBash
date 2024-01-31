#!/usr/bin/env bash
#USAGE: creating a simple calculator!
function multiplication {
    echo "scale=2; $1 * $2" | bc
}
function sum {
    echo "scale=2; $1 + $2" | bc
}
function subtraction {
    echo "scale=2; $1 - $2" | bc
}
function division {
    if [[ $2 -eq 0 ]];then
        echo "division by zero is not allow"
    else
        echo "scale=2; $1 / $2" | bc
    fi
}



while true;do
    echo "options is  just sum, subtraction, multiplication, division, exit ! "
    read -p "what do you want to do? " choice
    case $choice in
        multiplication)
        read -p "give me first number " n1
        read -p "give me second number " n2
        multiplication $n1 $n2
        ;;
        sum)
        read -p "give me first number " n1
        read -p "give me second number " n2
        sum $n1 $n2
        ;;
        division)
        read -p "give me first number " n1
        read -p "give me second number " n2
        division $n1 $n2
        ;;
        subtraction)
        read -p "give me first number " n1
        read -p "give me second number " n2
        subtraction $n1 $n2
        ;;
        exit)
        echo "thanks for using"
        exit 0
        ;;
        *)
        echo "invalid option"
    esac
done