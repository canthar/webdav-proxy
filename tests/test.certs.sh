#!/bin/sh

code=$(curl -k -w '%{http_code}' -o /dev/null https://proxy)
if [ "$code" -ne '502' ]; then
    echo "HTTP code should be 502, is $code"
    exit 1
fi

exit 0
