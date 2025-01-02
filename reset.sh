#!/bin/sh
dd if=/dev/urandom of=rando bs=1024 count=2
hexdump rando >rando.phext
rm -f rando
./run.sh rando.phext
