set -e
set -x

apt update
apt install -y wget vim

mkdir -p ~/miniconda3  && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-$(uname -s)-$(uname -m).sh -O ~/miniconda3/miniconda.sh  && \
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3  && \
    rm -rf ~/miniconda3/miniconda.sh  && \
    ~/miniconda3/bin/conda init bash
echo "export PATH=/root/miniconda3/bin:\$PATH" >> /root/.bashrc

source /root/.bashrc

conda create -y --name instinct-cpp python=3.11
conda activate instinct-cpp
conda install -y -c conda-forge conan cmake gcc=12 gxx=12
echo "conda activate instinct-cpp" >> /root/.bashrc




# # see https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html#package-manager-ubuntu-install for latest cuDNN version
# cudnn_ver="8.9.7.*-1+cuda11.8"
# # update system
# apt update
# apt upgrade -y
# # install Linux tools and Python 3
# apt install -y software-properties-common wget curl python3-dev python3-pip python3-wheel python3-setuptools
# # install Python packages
# python3 -m pip install --upgrade pip
# pip3 install --user -r .devcontainer/requirements.txt
# # update CUDA Linux GPG repository key
# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
# dpkg -i cuda-keyring_1.0-1_all.deb
# rm cuda-keyring_1.0-1_all.deb
# # install cuDNN
# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
# mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
# apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
# add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /" -y
# apt update
# apt install -y libcudnn8=${cudnn_ver} libcudnn8-dev=${cudnn_ver}
# # install additional recommended packages
# apt install -y zlib1g g++ freeglut3-dev libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev libfreeimage-dev