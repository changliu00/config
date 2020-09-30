mkdir ~/.ssh # run on local: `cat ~/.ssh/id_ed25519.pub | ssh username@hostname 'cat >> .ssh/authorized_keys'`
sudo apt-get update
sudo apt-get install --upgrade python3 python3-pip git tmux vim
git config --global user.email "changliu@microsoft.com"
git config --global user.name "Chang Liu"

# git clone https://github.com/changliu00/config.git ~/config/
rm ~/.bashrc
ln -s ~/config/bashrc ~/.bashrc
ln -s ~/config/tmux.conf ~/.tmux.conf
ln -s ~/config/vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sodu apt-get install build-essential cmake python3-dev
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer

sudo pip3 install numpy torch matplotlib jupyter tqdm tabulate
sudo pip3 install dalib sklearn

