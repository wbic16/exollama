#!/bin/bash
#
# bitnet-server.sh — Launch BitNet local inference server
#
# Usage: ./bitnet-server.sh [port] [model]
#   port:  Default 8090
#   model: "falcon" (default), "2b", or full path to GGUF
#
# Exposes: /v1/chat/completions, /v1/completions, /v1/models
# Compatible with any OpenAI-API client, including OpenClaw.
#

BITNET_DIR="/home/wbic16/BitNet"
BINARY="$BITNET_DIR/build/bin/llama-server"
PORT="${1:-8090}"
MODEL_ARG="${2:-falcon}"
THREADS=8
CTX_SIZE=4096

# Resolve model path
case "$MODEL_ARG" in
  falcon|falcon3|10b)
    MODEL_FILE="$BITNET_DIR/models/Falcon3-10B-Instruct-1.58bit/ggml-model-i2_s.gguf"
    MODEL_NAME="Falcon3-10B-Instruct-1.58bit"
    ;;
  2b|bitnet|microsoft)
    MODEL_FILE="$BITNET_DIR/models/BitNet-b1.58-2B-4T/ggml-model-i2_s.gguf"
    MODEL_NAME="BitNet-b1.58-2B-4T"
    ;;
  *)
    MODEL_FILE="$MODEL_ARG"
    MODEL_NAME="$(basename "$MODEL_ARG")"
    ;;
esac

if [ ! -f "$BINARY" ]; then
  echo "ERROR: llama-server not found. Build BitNet first:"
  echo "  cd $BITNET_DIR && python setup_env.py --hf-repo tiiuae/Falcon3-10B-Instruct-1.58bit -q i2_s"
  exit 1
fi

if [ ! -f "$MODEL_FILE" ]; then
  echo "ERROR: Model not found at $MODEL_FILE"
  echo ""
  echo "Available models:"
  find "$BITNET_DIR/models" -name "*.gguf" -exec ls -lh {} \; 2>/dev/null
  exit 1
fi

echo "🧠 Starting $MODEL_NAME on port $PORT ..."
echo "   Model: $MODEL_FILE"
echo "   Threads: $THREADS | Context: $CTX_SIZE"
echo "   API: http://localhost:$PORT/v1/chat/completions"
echo ""

exec "$BINARY" \
  -m "$MODEL_FILE" \
  --host 0.0.0.0 \
  --port "$PORT" \
  -t "$THREADS" \
  -c "$CTX_SIZE" \
  -ngl 0 \
  --no-perf
