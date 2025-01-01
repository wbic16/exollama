#!/bin/sh
./setup.sh
content=$0
cd build
if [ ! -f ./llama2_q4 ]; then
  echo "Setup Error - review output above."
else
  ./llama2_q4 ./llama2-7b-awq-q4.bin -n 256 -i "$content"
fi
cd ../
