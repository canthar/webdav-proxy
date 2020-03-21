#!/bin/sh

curl --head -s https://proxy
if [ $? -ne 7 ]; then  # HTTPS shouldn't exist
    echo 'There exists https endoint but it should not'
    exit 1
fi

code=$(curl -s -o /dev/null -w '%{http_code}' http://proxy)
if [ "$code" -ne 502 ]; then
    echo "Invalid HTTP code. Should be 502 is $code"
    exit 2
fi

exit 0
