sudo add-apt-repository ppa:jonathonf/vim # latest but unofficial package for Vim, in case that the official repository does not have the latest version and Vim source cannot be compiled.
sudo apt update
sudo apt install --upgrade python3 python3-pip git tmux vim

sudo pip3 install numpy torch matplotlib jupyter tqdm tabulate # scipy
sudo pip3 install dalib sklearn

git config --global user.email "changliu@microsoft.com"
git config --global user.name "Chang Liu"

mkdir ~/.ssh # run on local: `cat ~/.ssh/id_ed25519.pub | ssh username@hostname 'cat >> .ssh/authorized_keys'`

# git clone https://github.com/changliu00/config.git
rm ~/.bashrc
ln -s ~/config/bashrc ~/.bashrc
ln -s ~/config/tmux.conf ~/.tmux.conf
ln -s ~/config/vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sudo apt install --upgrade build-essential cmake python3-dev
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer

