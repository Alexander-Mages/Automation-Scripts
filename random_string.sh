#!/bin/bash
printf "len(int)?\n>>"
read strlen
tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c $strlen  ; echo
