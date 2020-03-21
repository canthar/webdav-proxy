#!/bin/sh

./entrypoint.sh -T | grep "server_name $CORRECT_ANSWER;"
