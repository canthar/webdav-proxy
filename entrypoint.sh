#!/bin/sh -e

if [ -x ${PROXY_DEST+x} ]; then
    echo "You must set PROXY_DEST environment variable"
    exit 1
fi

if [ -n "$HTPASSWD_CONTENT" ]; then
    echo "${HTPASSWD_CONTENT}" > /etc/nginx/htpasswd
    export BASIC_AUTH_CONFIG='auth_basic "Webdav area";auth_basic_user_file htpasswd;'
fi

if [ -x ${ALLOW_ORIGIN+x} ]; then
    export ALLOW_ORIGIN='*'
fi

if [ -n "$AUTHORIZATION" ]; then
    export AUTHORIZATION_CONFIG="proxy_set_header Authorization \"Basic ${AUTHORIZATION}\";"
fi

if [ -x ${SERVER_NAME+x} ]; then
    export SERVER_NAME='_'
fi

if [ -n "$CERTIFICATE_LOCATION" -a -n "$CERTIFICATE_KEY_LOCATION" ]; then
    export CERTIFICATE_CONFIG="ssl_certificate ${CERTIFICATE_LOCATION};ssl_certificate_key ${CERTIFICATE_KEY_LOCATION};"
    export LISTEN_CONFIG="listen 443 ssl;"
else
    export LISTEN_CONFIG="listen 80;"
fi

SHELL_FORMAT='$PROXY_DEST $BASIC_AUTH_CONFIG $ALLOW_ORIGIN $AUTHORIZATION_CONFIG $SERVER_NAME $CERTIFICATE_CONFIG $LISTEN_CONFIG'
envsubst "$SHELL_FORMAT" < /proxy.conf > /etc/nginx/conf.d/proxy.conf

exec nginx -g 'daemon off;' "$@"
