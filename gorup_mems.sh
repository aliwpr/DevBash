#!/usr/bin/env bash

function findGroupMems {
if [[ $# -eq 0 ]];then
    echo "please provide a group name for continue.."
    exit 1
fi

local groupname="$1"

cat /etc/group | grep "$groupname" &>/dev/null


if [[ $? -eq 0 ]];then
   groupmems=`groupmems -g "$groupname" -l`
   if [[ -z $groupmems ]];then
     echo "no one is in that group except owner"
   else
    echo $groupmems
   fi
else
   echo "the group is not exist on this server..sry"
fi
}
