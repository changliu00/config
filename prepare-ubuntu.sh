# mkdir ~/.ssh # run on local: `cat ~/.ssh/id_ed25519.pub | ssh username@hostname 'cat >> .ssh/authorized_keys'`
# git clone https://github.com/changliu00/config.git
rm -f ~/.bashrc ~/.tmux.conf ~/.vimrc ~/.gitconfig
ln -s ~/config/bashrc ~/.bashrc
ln -s ~/config/tmux.conf ~/.tmux.conf
ln -s ~/config/vimrc ~/.vimrc
ln -s ~/config/gitconfig ~/.gitconfig

# sudo add-apt-repository ppa:jonathonf/vim # latest but unofficial package for Vim, in case that the official repository does not have the latest version and Vim source cannot be compiled. Built with python3.10
sudo apt update
sudo apt install git tmux vim=2:9.1.0016-1ubuntu7.8 ripgrep build-essential cmake python3.12 python3-pip python3-dev
sudo apt upgrade

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# sudo apt install --upgrade build-essential cmake python3-dev
cd ~/.vim/bundle/YouCompleteMe/
# git checkout b6e8c64d # or, branch legacy-vim-8.2 # for the customized vim built with python3.10
python3 install.py --clangd-completer

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh
~/miniconda3/bin/conda init
source ~/.bashrc

## Check CUDA version: `nvcc --version`. Check CuDNN version: `cat /usr/include/x86_64-linux-gnu/cudnn_v*.h | grep CUDNN_MAJOR -A 2`
## Install cuda using conda: `conda install cuda -c nvidia`. Install cudnn: `wget https://developer.download.nvidia.cn/compute/cuda/repos/ubuntu1804/x86_64/libcudnn8_8.4.0.27-1+cuda11.6_amd64.deb; sudo dpkg -i libcudnn8_8.4.0.27-1+cuda11.6_amd64.deb`.
# Install CUDA from Zun
# 1. Choose driver from <https://www.nvidia.com/download/index.aspx>
# 2. Delete possible existing Nvidia dirvers:
# 	sudo apt-get remove --purge nvidia*
# 3. Disable existing open-source GPU drivers:
# 	sudo vi /etc/modprobe.d/blacklist-nouveau.conf
# 	blacklist nouveau options nouveau modeset=0
# 4. Check if the following does not have outputs:
# 	lsmod | grep nouveau
# 5. sudo ./NVIDIA-Linux-x86_64-xxxxx.run
#	a. Would you like to register the kernel module sources with DKMS? This will allow DKMS to automatically build a new module, if you install a different kernel later
#		No
#	b. Install NVIDIA's 32-bit compatibility libraries?
#		No
#	c. ERROR: You appear to be running an X server; please exit X before installing.  For further details, please see the section INSTALLING THE NVIDIA DRIVER in the README available on the Linux driver download page at www.nvidia.com.
#		sudo service lightdm stop
# 6. Install CUDA from <https://developer.nvidia.com/cuda-downloads>
# 7. Add to PATH:
#	export PATH="/usr/local/cuda-12.1/bin:$PATH"
#	export LD_LIBRARY_PATH="/usr/local/cuda-12.1/lib64:$LD_LIBRARY_PATH"

python3 -m pip install --upgrade pip numpy torch matplotlib jupyter tqdm
# python3 -m pip install torchvision sklearn scipy tabulate
# python3 -m pip install --upgrade "jax[cuda]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html # or, "jax[cuda10_cudnn83]"
# python3 -m pip install --upgrade jaxlib flax
conda deactivate

