#!/bin/sh

curl --head http://proxy | grep -F "Access-Control-Allow-Origin: $CORRECT_ANSWER"
