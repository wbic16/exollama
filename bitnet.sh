#!/bin/sh
# BitNet b1.58 2B-4T inference via bitnet.cpp
# Usage: bitnet.sh "Your prompt here" [num_tokens]

BITNET_DIR="/home/wbic16/BitNet"
MODEL_DIR="$BITNET_DIR/models/BitNet-b1.58-2B-4T"
MODEL_FILE="$MODEL_DIR/ggml-model-i2_s.gguf"
BINARY="$BITNET_DIR/build/bin/llama-cli"

PROMPT="${1:-Hello World}"
NUM_TOKENS="${2:-128}"
THREADS=8

# Check if BitNet is set up
if [ ! -f "$BINARY" ]; then
    echo "Error: BitNet not compiled. Run setup first:"
    echo "  cd $BITNET_DIR && python setup_env.py --hf-repo microsoft/BitNet-b1.58-2B-4T -q i2_s"
    exit 1
fi

if [ ! -f "$MODEL_FILE" ]; then
    echo "Error: Model not found at $MODEL_FILE"
    echo "Run: cd $BITNET_DIR && source .venv/bin/activate && python setup_env.py --hf-repo microsoft/BitNet-b1.58-2B-4T -q i2_s"
    exit 1
fi

exec "$BINARY" \
    -m "$MODEL_FILE" \
    -p "$PROMPT" \
    -n "$NUM_TOKENS" \
    -t "$THREADS" \
    --temp 0.7 \
    -ngl 0 \
    --no-display-prompt
