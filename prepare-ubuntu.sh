sudo add-apt-repository ppa:jonathonf/vim # latest but unofficial package for Vim, in case that the official repository does not have the latest version and Vim source cannot be compiled.
sudo apt update
sudo apt install --upgrade python3 python3-pip git tmux vim ripgrep

sudo python3 -m pip install --upgrade pip numpy torch torchvision matplotlib jupyter
# sudo pip3 install sklearn scipy tqdm tabulate dalib
## Check CUDA version: `nvcc --version`. Check CuDNN version: `cat /usr/include/x86_64-linux-gnu/cudnn_v*.h | grep CUDNN_MAJOR -A 2`
## Install cuda using conda: `conda install cuda -c nvidia`. Install cudnn: `wget https://developer.download.nvidia.cn/compute/cuda/repos/ubuntu1804/x86_64/libcudnn8_8.4.0.27-1+cuda11.6_amd64.deb; sudo dpkg -i libcudnn8_8.4.0.27-1+cuda11.6_amd64.deb`.
sudo python3 -m pip install --upgrade "jax[cuda]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html # or, "jax[cuda10_cudnn83]"
# sudo python3 -m pip install --upgrade jaxlib
sudo python3 -m pip install --upgrade flax

# mkdir ~/.ssh # run on local: `cat ~/.ssh/id_ed25519.pub | ssh username@hostname 'cat >> .ssh/authorized_keys'`

# git clone https://github.com/changliu00/config.git
rm -f ~/.bashrc ~/.tmux.conf ~/.vimrc ~/.gitconfig
ln -s ~/config/bashrc ~/.bashrc
ln -s ~/config/tmux.conf ~/.tmux.conf
ln -s ~/config/vimrc ~/.vimrc
ln -s ~/config/gitconfig ~/.gitconfig

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sudo apt install --upgrade build-essential cmake python3-dev
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer

