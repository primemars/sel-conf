nfs_mp="/root/nfs"
nfs_target="10.32.119.225:/home/shawn/share"

mkdir $nfs_mp
mount -t nfs $nfs_target $nfs_mp

src_host="root@10.32.119.231"

ssh-keygen
ssh-copy-id -i $src_host

# change password to 1
passwd


# backup /etc/conaryrc to /etc/conary.bak and copy the file from src_host
cp -f /etc/conaryrc /etc/conaryrc.bak 
scp $src_host:./install_dev_env/conaryrc /etc/

# install gcc
conary update gcc

# add a dir to store sw
mkdir -p ~/xiang/SW

# download git and install
cd ~/xiang/SW
scp -r $src_host:~/install_dev_env/SW/git-1.7.0.5 ~/xiang/SW/
cd git-1.7.0.5
./configure --without-tcltk && make && make install
# configure git
scp $src_host:~/install_dev_env/.gitconfig .

#install subversion
conary update subversion --resolve

# copy emacs from src_host and install
scp -r $src_host:~/install_dev_env/SW/emacs-23.2 ~/xiang/SW/
cd ~/xiang/SW/emacs-23.2
./configure && make && make install
cd ~
scp $src_host:~/install_dev_env/.emacs .
scp -r $src_host:~/install_dev_env/.emacs.d .

mkdir ~/xiang/share

# install .bashrc
scp $src_host:./install_dev_env/.bashrc .
source ~/.bashrc

# install .inputrc
scp $src_host:./install_dev_env/.inputrc .

# install ruby-debug
gem install linecache -v 0.43
gem install ruby-debug

echo -e "\033[1;32mDone!\033[m"



