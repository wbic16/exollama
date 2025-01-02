#!/bin/sh
dd if=/dev/urandom of=rando.phext bs=1024 count=2
hexdump rando.phext >rando.phext
./run.sh rando.phext
