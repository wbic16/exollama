#!/bin/sh
mkdir build
cd build
sudo apt update
sudo apt install cmake -y
sudo apt install nvidia-cuda-toolkit -y
cmake ..
cmake --build . --config Release
cd ..
