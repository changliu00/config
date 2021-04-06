sudo add-apt-repository ppa:jonathonf/vim # latest but unofficial package for Vim, in case that the official repository does not have the latest version and Vim source cannot be compiled.
sudo apt update
sudo apt install --upgrade python3 python3-pip git tmux vim

sudo pip3 install numpy torch torchvision matplotlib jupyter
# sudo pip3 install sklearn scipy tqdm tabulate dalib

mkdir ~/.ssh # run on local: `cat ~/.ssh/id_ed25519.pub | ssh username@hostname 'cat >> .ssh/authorized_keys'`

# git clone https://github.com/changliu00/config.git
rm -f ~/.bashrc
ln -s ~/config/bashrc ~/.bashrc
ln -s ~/config/tmux.conf ~/.tmux.conf
ln -s ~/config/vimrc ~/.vimrc
ln -s ~/config/gitconfig ~/.gitconfig

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sudo apt install --upgrade build-essential cmake python3-dev
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer

