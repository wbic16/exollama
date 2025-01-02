#!/bin/sh
dd if=/dev/urandom of=rando bs=128 count=16
hexdump rando >rando.phext
rm -f rando
./run.sh rando.phext
