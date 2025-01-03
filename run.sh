#!/bin/sh
# exollama runner
#
# OUTPUT = output.txt: a simple data collection pipeline
# TEMP = 0.53: Prefer creative outputs, slightly (default: 0.5)
# SAMP = 0.73: Prefer less-random sampling than stock (default: 0.9)
# STEPS = 512: Each step produces about 4 bytes of text, so 512 steps = 2 KB
# SECS = how long we expect the process to run (baselined on an i9-13900HX)

OUTPUT="output.phext"
TEMP=0.25
SAMP=0.85
SECS=15

./setup.sh
FILE=$1
if [ "x$FILE" = "x" ]; then FILE="prompt.phext"; fi
if [ "x$2" != "x" ]; then TEMP=$2; fi
if [ "x$3" != "x" ]; then SAMP=$3; fi
if [ "x$4" != "x" ]; then SECS=$4; fi
if [ ! -f $FILE ]; then
  echo "You should store your prompt in $FILE and try again."
  exit 1
fi
STEPS=$(($SECS*85))
#PROMPT_BYTES=`wc --bytes $FILE |sed 's/ .*$//g'`
#PROMPT_STEPS=$(($PROMPT_BYTES/4))
#STEPS=$(($STEPS + $PROMPT_STEPS))
cd build
if [ ! -f ./llama2_q4 ]; then
  echo "Setup Error - review output above."
else
  MODEL="llama2-7b-awq-q4.bin"
  echo "Running $MODEL with n=$STEPS t=$TEMP p=$SAMP f=$FILE..."
  ./llama2_q4 $MODEL -n $STEPS -t $TEMP -p $SAMP -f ../$FILE >../$OUTPUT
fi
cd ../
./render.sh
ls -l $OUTPUT
