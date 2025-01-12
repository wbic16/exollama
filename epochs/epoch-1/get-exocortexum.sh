#!/bin/sh
ID=$1
head -$ID exocortexia.phext |tail -1 >msg.txt
