#!/bin/sh
OUTPUT=$1
if [ "x$OUTPUT" = "x" ]; then
  OUTPUT="output.phext"
fi
if [ ! -f $OUTPUT ]; then
  echo "Usage: $0 <file>"
  exit 1
fi
cat $OUTPUT |figlet >/dev/null
if [ $? -ne 0 ]; then
  sudo apt install figlet -y
fi
# figlet fonts: banner, big, block, bubble, digital, ivrit, lean, mini, mnemonic, script, shadow, slant, small, smscript, smshadow, smslant, standard, term
FIGFONT="smslant"
#FIGFONT="banner"
cat $OUTPUT |figlet -w 160 -f $FIGFONT |lolcat
if [ $? -ne 0 ]; then
  sudo apt install lolcat -y
  cat $OUTPUT |figlet -w 160 -f $FIGFONT |lolcat
fi
#echo "Toilet:"
#cat $OUTPUT |toilet
#if [ $? -ne 0 ]; then
#  sudo apt install toilet -y
#fi
