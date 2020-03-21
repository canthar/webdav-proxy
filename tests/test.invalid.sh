#!/bin/sh

curl --head https://proxy
[ $? -eq 6 ] # proxy shouldn't exist - invalid configuration
