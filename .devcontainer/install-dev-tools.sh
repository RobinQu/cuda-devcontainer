set -e
set -x

apt update
apt install -y wget vim ssh bash-completion git build-essential

echo """if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
""" >> /root/.bashrc

mkdir -p ~/miniconda3  && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-$(uname -s)-$(uname -m).sh -O ~/miniconda3/miniconda.sh  && \
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3  && \
    rm -rf ~/miniconda3/miniconda.sh  && \
    ~/miniconda3/bin/conda init bash
echo "export PATH=/root/miniconda3/bin:\$PATH" >> /root/.bashrc

source /root/.bashrc

/root/miniconda3/bin/conda create -y --name system-gcc -c conda-forge python=3.11 conan cmake
echo "conda activate system-gcc" >> /root/.bashrc