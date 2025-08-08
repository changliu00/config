# sudo apt update
# sudo apt install git make ncurses-dev gcc build-essential

git clone https://github.com/vim/vim.git
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

./configure --with-features=huge --enable-multibyte --prefix=/usr/local

make -j$(nproc)
sudo make install


