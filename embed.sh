#!/bin/sh
# runs your input ($1) through a model ($2) and obtains the relevant embeddings ($3) for it
PROMPT="$1"
MODEL="$2"
OUTPUT="$3"
READY=1
if [ "x$PROMPT" = "x" ]; then READY=0; fi
if [ "x$MODEL" = "x" ]; then READY=0; fi
if [ "x$OUTPUT" = "x" ]; then READY=0; fi
if [ $READY -eq 0 ]; then
  echo "Usage: $0 <request> <model> <output>"
  exit 1
fi
curl http://localhost:11434/api/embeddings -d "{\"model\":\"$MODEL\",\"prompt\":\"$PROMPT\"}" >"$OUTPUT"
