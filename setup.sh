#!/bin/sh
mkdir build
cd build
sudo apt update
sudo apt install nvidia-cuda-toolkit
cmake ..
cmake --build . --config Release
cd ..
