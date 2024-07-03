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

conda create -y --name instinct-cpp -c conda-forge python=3.11 conan cmake gcc=12 gxx=12
echo "conda activate instinct-cpp" >> /root/.bashrc