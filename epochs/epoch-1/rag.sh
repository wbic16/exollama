#!/bin/bash
if [ ! -f /usr/local/exocortical/rag.py ]; then
  echo "Error: You need to install exocortical first."
  exit 1
fi
cd /usr/local/exocortical
source rag.sh
