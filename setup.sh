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
if [ ! -f .pip-numpy-torch-verified ]; then
  /opt/exopy/bin/pip install numpy torch
  touch .pip-numpy-torch-verified
fi
if [ ! -d ./output ]; then
  /opt/exopy/bin/python3 convert_awq_to_bin.py pytorch_model.bin output
fi
echo "Ready."
