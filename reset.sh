#!/bin/sh
dd if=/dev/urandom of=rando bs=128 count=16 2>/dev/null
hexdump rando >rando.phext
rm -f rando
./run.sh rando.phext 0.1 0.9 1 >/dev/null
./run.sh rando.phext 0.4 0.5 1 >/dev/null
./run.sh rando.phext 0.5 0.9 1 >/dev/null
