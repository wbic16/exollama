#!/bin/sh
# exollama runner
#
# OUTPUT = output.txt: a simple data collection pipeline
# TEMP = 0.53: Prefer creative outputs, slightly (default: 0.5)
# SAMP = 0.73: Prefer less-random sampling than stock (default: 0.9)
# STEPS = 512: Each step produces about 4 bytes of text, so 512 steps = 2 KB
# SECS = how long we expect the process to run (baselined on an i9-13900HX)

OUTPUT="output.phext"
TEMP=0.53
SAMP=0.73
SECS=15
STEPS=$(($SECS*85))

./setup.sh
file=$1
if [ "x$file" = "x" ]; then
  file="prompt.phext"
fi
if [ ! -f $file ]; then
  echo "You should store your prompt in $file and try again."
  exit 1
fi
#PROMPT_BYTES=`wc --bytes $file |sed 's/ .*$//g'`
#PROMPT_STEPS=$(($PROMPT_BYTES/4))
#STEPS=$(($STEPS + $PROMPT_STEPS))
cd build
if [ ! -f ./llama2_q4 ]; then
  echo "Setup Error - review output above."
else
  MODEL="llama2-7b-awq-q4.bin"
  echo "Running $MODEL with n=$STEPS t=$TEMP p=$SAMP f=$file..."
  ./llama2_q4 $MODEL -n $STEPS -t $TEMP -p $SAMP -f ../$file >../$OUTPUT
fi
cd ../
./render.sh
ls -l $OUTPUT
