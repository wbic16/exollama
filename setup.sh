#!/bin/sh
if [ ! -f build/llama2_q4 ]; then
  echo "Building llama2_q4..."
  mkdir build
  cd build
  sudo apt update
  sudo apt install cmake -y
  sudo apt install nvidia-cuda-toolkit -y
  cmake ..
  cmake --build . --config Release
  cd ..
fi
if [ ! -f pytorch_model.bin ]; then
  echo "Downloading 7B weights..."
  wget https://huggingface.co/abhinavkulkarni/meta-llama-Llama-2-7b-chat-hf-w4-g128-awq/resolve/main/pytorch_model.bin
fi
if [ ! -f config.json ]; then
  wget https://huggingface.co/abhinavkulkarni/meta-llama-Llama-2-7b-chat-hf-w4-g128-awq/resolve/main/config.json
fi
echo "Ready."
