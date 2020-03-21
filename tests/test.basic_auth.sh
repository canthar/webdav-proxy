#!/bin/sh

code=$(curl -s -o /dev/null -w '%{http_code}' --head http://proxy)
if [ "$code" -ne '401' ]; then
    echo "Status code should be 401, is $code"
    exit 1
fi

code=$(curl -s -o /dev/null -w '%{http_code}' --head -u 'test:test' http://proxy)
if [ "$code" -ne '502' ]; then
    echo "Status code should be 502, is $code"
    exit 2
fi

exit 0
