#!/bin/sh

code=$(curl -s -o /dev/null -w '%{http_code}' http://proxy)
if [ "$code" -ne '204' ]; then
    echo "Return code should be 204, is $code"
    exit 1
fi

exit 0