#!/bin/bash
# BitNet b1.58 2B-4T inference via bitnet.cpp
# Usage: bitnet.sh "Your prompt here" [num_tokens] [threads]

PROMPT="${1:-Hello World}"
TOKENS="${2:-128}"
THREADS="${3:-8}"
MODEL="/source/BitNet/models/BitNet-b1.58-2B-4T/ggml-model-i2_s.gguf"

cd /source/BitNet
source .venv/bin/activate
python run_inference.py -m "$MODEL" -p "$PROMPT" -n "$TOKENS" -t "$THREADS"
