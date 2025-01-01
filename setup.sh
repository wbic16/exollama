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
# Alternative models
# llama7b: https://huggingface.co/abhinavkulkarni/meta-llama-Llama-2-7b-chat-hf-w4-g128-awq
# mixtral: https://huggingface.co/TheBloke/mixtral-8x7b-v0.1-AWQ
# deepseek: https://huggingface.co/deepseek-ai/DeepSeek-V3
LLAMA7B=https://huggingface.co/abhinavkulkarni/meta-llama-Llama-2-7b-chat-hf-w4-g128-awq
MIXTRAL=https://huggingface.co/TheBloke/mixtral-8x7b-v0.1-AWQ
DEEPSEEK=https://huggingface.co/deepseek-ai/DeepSeek-V3
MODEL=$DEEPSEEK
MT="deepseekv3"
if [ ! -d templates ]; then
  mkdir templates
fi
cd templates
if [ ! -f templates/llama7b/pytorch_model.bin ]; then
  echo "Downloading LLAMA7B weights..."
  if [ ! -d ./llama7b ]; then mkdir llama7b; fi
  cd llama7b
  wget $LLAMA7B/resolve/main/pytorch_model.bin
  wget $LLAMA7B/resolve/main/config.json
  cd ../
fi
if [ ! -f templates/mixtral/pytorch_model.bin ]; then
  echo "Downloading MIXTRAL weights..."
  cd templates
  if [ ! -d ./mixtral ]; then mkdir mixtral; fi
  cd mixtral
  wget $MIXTRAL/resolve/main/pytorch_model.bin
  wget $MIXTRAL/resolve/main/config.json
  cd ../
fi
if [ ! -f templates/deepseekv3/pytorch_model.bin ]; then
  echo "Downloading DEEPSEEK v3 weights..."
  cd templates
  if [ ! -d ./deepseekv3 ]; then mkdir deepseekv3; fi
  cd deepseekv3
  wget $DEEPSEEK/resolve/main/pytorch_model.bin
  wget $DEEPSEEK/resolve/main/config.json
  cd ../
fi
cd ../
if [ ! -f ./templates/$MT/pytorch_model.bin ]; then
  echo "ERROR: Your selected model could not be found."
  echo "Review the errors above."
  exit 1
fi
if [ ! -f .pip-numpy-torch-verified ]; then
  /opt/exopy/bin/pip install numpy torch
  touch .pip-numpy-torch-verified
fi
if [ ! -d ./output ]; then
  /opt/exopy/bin/python3 convert_awq_to_bin.py pytorch_model.bin output
fi
if [ ! -f ./build/llama2-7b-awq-q4.bin ]; then
  cd build
  ./weight_packer ../config.json ../output llama2-7b-awq-q4.bin 1
  cd ..
fi
if [ ! -f ./build/tokenizer.bin ]; then
  cp tokenizer.bin build/tokenizer.bin
fi
echo "Ready."
