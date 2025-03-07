#!/bin/bash
../../ds.sh "Vibe Farming, Vibe Farmer, Vibe Framer, Vibe Further" >vibe-step.txt
../../ds.sh <vibe-step.txt >vibe.txt
rm -f vibe-step.txt
echo "vibe.txt"
cat vibe.txt
