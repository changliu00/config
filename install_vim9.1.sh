# sudo apt update
# sudo apt install git make ncurses-dev gcc build-essential

git clone https://github.com/vim/vim.git
## If the above does not finish completed, try the followings:
# git config --global http.postBuffer 524288000
# git config --global http.maxRequestBuffer 500M
# git config --global core.compression 0
# git clone --depth=1 git@github.com:vim/vim.git
## and optionally,
# cd vim
# git fetch --depth=50
# git fetch --unshallow
cd vim
git checkout v9.1.1591
# ./configure --with-features=huge \
#             --enable-multibyte \
#             --enable-rubyinterp=yes \
#             --enable-python3interp=yes \
#             --enable-perlinterp=yes \
#             --enable-luainterp=yes \
#             --enable-gui=gtk2 \
#             --enable-cscope \
#             --prefix=/usr/local

./configure --with-features=huge --enable-multibyte --enable-python3interp=yes --enable-perlinterp=yes --prefix=/usr

make -j$(nproc)
sudo make install
