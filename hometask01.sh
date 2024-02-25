#!/bin/bash

url_web_check=("https://google.com" "https://facebook.com" "https://twitter.com" "https://schutz-shoes.com/" "https://www.reima.com/en" "https://www.nutriadvanced.co.uk" "https://intertp.ua")
check_list="Check list.log"
> "$check_list"

for site in "${url_web_check[@]}"
do
    if curl -s -L --connect-timeout 5 --head --request GET -w "%{http_code}\n" "$site" | grep "200" > /dev/null
    then
        echo "$site is UP" >> "$check_list"
    else
        echo "$site is DOWN" >> "$check_list"
    fi
done

echo "Check results at $check_list"