#!/bin/bash
curl https://ollama.ai/install.sh >install.sh
git status
if [ "$1" = "now" ]; then
  ./install.sh
else
  echo ""
  echo "If no changes have been made to install.sh, then it is likely safe to run."
  echo "Otherwise, review the changes above. Once approved, run the latest installer."
fi
