#!/usr/bin/env bash 
# give me a name of city and it will return the weather

if [[ $# -ne 1 ]];then
    echo "please give me city name"
    exit 1
fi
API_KEY="ab45d51d5ea548e350b741b97c00c959"
location="$1"
URL="https://api.openweathermap.org/data/2.5/weather?q="$location"&units=metric&appid="$API_KEY""
weather=$(curl -s $URL | jq -r '.')
if [[ $( echo $weather | jq -r '.code' ) == "404" ]];then
    echo "location doesnt exist"
else
    echo "location: $location"
    echo "temp: " $(echo $weather | jq -r '.main.temp')
    echo "moreDetail: " $( echo $weather | jq -r '.weather[0].description')
fi
