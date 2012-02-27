user_root="/root"
nfs_mp=$user_root/nfs
nfs_target="10.32.119.225:/home/shawn/share"
target_sw=$user_root/xiang/SW
src_host="root@10.32.119.231"
repo_server="10.5.114.25"

mkdir $nfs_mp
mount -t nfs $nfs_target $nfs_mp

ssh-keygen
ssh-copy-id -i .ssh/id_rsa.pub $src_host

# add repos
echo "Add repos..."
zypper ar -t rpm-md http://$repo_server/kiwi-repos/2.0.0/SLES/SLES11-SP1-Pool/sle-11-x86_64 SLES_11_SP1_Pool
zypper ar -t rpm-md http://$repo_server/kiwi-repos/2.0.0/SLES/SLES11-SP1-Updates/sle-11-x86_64 SLES_11_SP1_Updates
zypper ar -t rpm-md http://$repo_server/kiwi-repos/2.0.0/SLES/SLE11-SDK-SP1-Pool/sle-11-x86_64 SLES11_SP1_SDK_Pool
zypper ar -t rpm-md http://$repo_server/kiwi-repos/2.0.0/SLES/SLE11-SDK-SP1-Updates/sle-11-x86_64 SLES11_SP1_SDK_Updates
zypper ar -t rpm-md http://$repo_server/kiwi-repos/2.0.0/SLES/SLES_HF SLES_HFUpdates_200

# change password to 1
passwd

# install gcc
zypper install gcc

# install make
zypper install make

# install svn
zypper install svn

# download git and install
zypper install git
# configure git
scp -r $src_host:/root/install_dev_env/.gitignore $user_root/

# add a dir to store sw
mkdir -p $target_sw

# copy emacs from src_host and install
scp -r $src_host:/root/install_dev_env/SW/emacs-23.2 $target_sw/
cd $target_sw/emacs-23.2
./configure && make && make install


# create configuration symbol link
cd ~
ln -s  nfs/dev_env/.emacs .emacs
ln -s  nfs/dev_env/.emacs.d .emacs.d
ln -s  nfs/dev_env/.inputrc .inputrc
ln -s  nfs/dev_env/.bashrc .bashrc
ln -s  nfs/dev_env/.gitconfig .gitconfig

# add dnc
echo "nameserver 10.32.97.148" >> /etc/resolv.conf

# install ruby-debug
gem install linecache -v 0.43
gem install ruby-debug

echo -e "\033[1;32mDone!\033[m"



