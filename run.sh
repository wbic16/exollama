#!/bin/sh
# exollama runner
#
# OUTPUT = output.txt: a simple data collection pipeline
# TEMP = 0.9: Prefer creative outputs
# STEPS = 512: Each step produces about 4 bytes of text, so 512 steps = 2 KB

OUTPUT="output.txt"
TEMP=0.9
STEPS=512

./setup.sh
file=$1
if [ "x$file" = "x" ]; then
  file="prompt.txt"
fi
if [ ! -f $file ]; then
  echo "You should store your prompt in $file and try again."
  exit 1
fi
cd build
if [ ! -f ./llama2_q4 ]; then
  echo "Setup Error - review output above."
else
  ./llama2_q4 ./llama2-7b-awq-q4.bin -n $STEPS -t $TEMP -f ../$file >../$OUTPUT
fi
cd ../
cat $OUTPUT
ls -l $OUTPUT
