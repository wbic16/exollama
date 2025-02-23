#!/bin/bash
curl https://ollama.ai/install.sh >install.sh
git status
if [ "$1" = "now" ]; then
  ./install.sh
fi
