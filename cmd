vi /etc/xdg/user-dirs.defaults             -- to set desktop dirs
vi /home/johnson/.config/gtk-3.0/bookmarks -- to set bookmarks name
vi /home/johnson/.config/terminator/config -- for terminator


#!/bin/bash
sudo su
osname=`uname`
home=home
if [ $osname = "Darwin" ]; then
	echo "This is mac system, home is Users..."
	home=Users
fi

cd
ln -s Desktop dsk
ln -s Documents doc
ln -s Downloads dwn
ln -s Music mus
ln -s Pictures img
ln -s Public sha
ln -s Templates tmp
ln -s Videos mov

mkdir wks vmw sft mnt ins lib com

sudo apt-get update
sudo apt-get install vim axel terminator xfonts-terminus console-terminus subversion openssh-server openssh-client python-setuptools mysql-server

mkdir ~/sft && cd ~/sft && git clone https://github.com/res0nat0r/gitosis.git
cd gitosis && python setup.py install
sudo adduser --system --shell /bin/sh --gecos 'git user' --group --disabled-password --home /$home/git git
sudo chown git.git /$home/git -R
sudo -H -u git gitosis-init < ~/.ssh/id_rsa.pub
sudo chmod 755 /$home/git/repositories/gitosis-admin.git/hooks/post-update
git config --global user.name "Johnson Z."
git config --global user.email "xxxxxxxxxxxxx@163.com"
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto
git config --global core.autocrlf true
mkdir ~/wks && cd ~/wks && git clone git@localhost:gitosis-admin.git
echo 'cd ~/wks/gitosis-admin to set git pls'
echo 'git init'
echo 'git remote add origin ssh://git@localhost/xxx.git'
echo 'git push origin master'

# install flash player
echo 'sudo apt-get install flashplugin-installer'
echo 'sudo cp libflashplayer.so /usr/lib/mozilla/plugins/'
echo 'sudo cp -r ./usr/* /usr/'



sudo apt-get install rar

# install 32bit libs for android adb
sudo apt-get install libc6:i386 libgcc1:i386 gcc-4.6-base:i386 libstdc++5:i386 libstdc++6:i386
sudo apt-get install lib32ncurses5
sudo apt-get install lib32z1
sudo apt-get install lib32bz2-1.0

# install 32bit libs for making android source code
sudo apt-get install bison g++-multilib git gperf libxml2-utils


# install php dev env
sudo apt-get install apache2 php5-mysql libapache2-mod-php5 mysql-server
sudo apt-get install php5-gd php5-curl php5-xdebug
# install php develop tools in eclipse
http://download.eclipse.org/tools/pdt/updates/3.4

# install chinese method for ubuntu
http://www.cnblogs.com/0616--ataozhijia/p/4122124.html

# install KSnapshot
sudo apt-get install ksnapshot

# support exFat(Fat for mac)
sudo add-apt-repository ppa:relan/exfat
sudo apt-get update
apt-get install exfat-fuse
# sudo mount -t exfat from.disk to.disk

# virtual box
https://www.virtualbox.org/wiki/Linux_Downloads


# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
