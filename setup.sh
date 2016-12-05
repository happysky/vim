#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old
cd ~/ && git clone git@github.com:happysky/vim.git ./.vim
ln -s ~/.vim/.vimrc ~/.vimrc
cd ~/.vim/
git submodule update --init --recursive
echo "ma6174正在努力为您安装bundle程序" > ma6174
echo "安装完毕将自动退出" >> ma6174
echo "请耐心等待" >> ma6174
vim ma6174 -c "BundleInstall" -c "q" -c "q"
rm ma6174
#cmake需要安装gcc
#sudo yum install gcc-c++

#youCompleteMe 需要先安装 cmake
#wget "https://cmake.org/files/v3.7/cmake-3.7.1-Linux-x86_64.tar.gz" ~/.
#tar zxvf cmake-3.7.1-Linux-x86_64.tar.gz
#mv cmake-3.7.1-Linux-x86_64 cmake
#sudo cp ~/cmake /usr/local/cmake
#sudo echo export PATH="$PATH:/usr/local/cmake" >> /etc/profile
#sudo source /etc/profile

#安装 youCompleteMe
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py

#安装tern_for_vim
cd ~/.vim/bundle/tern_for_vim
npm install

#安装jshint
sudo npm install -g jshint

echo "安装完成"
