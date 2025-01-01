#!/bin/sh
# exollama runner
#
# OUTPUT = output.txt: a simple data collection pipeline
# TEMP = 0.4: Prefer rational outputs, slightly
# STEPS = 1024: Each step produces about 4 bytes of text, so 512 steps = 2 KB

OUTPUT="output.txt"
TEMP=0.4
STEPS=2048

./setup.sh
file=$1
if [ "x$file" = "x" ]; then
  file="prompt.txt"
fi
if [ ! -f $file ]; then
  echo "You should store your prompt in $file and try again."
  exit 1
fi
PROMPT_BYTES=`wc --bytes $file |sed 's/ .*$//g'`
PROMPT_STEPS=$(($PROMPT_BYTES*0.25))
STEPS=$(($STEPS + $PROMPT_STEPS))
cd build
if [ ! -f ./llama2_q4 ]; then
  echo "Setup Error - review output above."
else
  ./llama2_q4 ./llama2-7b-awq-q4.bin -n $STEPS -t $TEMP -f ../$file >../$OUTPUT
fi
cd ../
cat $OUTPUT
ls -l $OUTPUT
