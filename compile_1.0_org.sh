
cd PyFlex/bindings
rm -rf build
mkdir build
cd build
# Seuss 
if [[ $(hostname) = *"compute-0"* ]] || [[ $(hostname) = *"autobot-"* ]] || [[ $(hostname) = *"yertle"* ]]; then
    # export CUDA_BIN_PATH=/usr/local/cuda-9.1
    export CUDA_BIN_PATH=/usr/local/cuda-11.3
    # export CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.3
fi
# export CUDA_BIN_PATH=/usr/local/cuda-11.3

export PATH=/usr/local/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.3/lib64$LD_LIBRARY_PATH　
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/disk4/yesenmao/home/cudnn5/lib64

# cmake -DPYBIND11_PYTHON_VERSION=3.6 ..
cmake -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.3 -DCMAKE_CUDA_COMPILER=/ -DPYBIND11_PYTHON_VERSION=3.6 ..

make -j
