#!/bin/bash
sudo passwd

# install jdk
# http://www.oracle.com/technetwork/java/archive-139210.html

# install vim
sudo apt-get install vim axel
# install cscope, ctags and clipit
sudo apt-get install cscope ctags clipit terminator 
# install terminus font
sudo apt-get install xfonts-terminus console-terminus
# install svn
sudo apt-get install subversion

# install flash-player
sudo apt-get install flashplugin-installer
# or download player and x it and cd to it
# sudo cp libflashplayer.so /usr/lib/mozilla/plugins/
# sudo cp -r ./usr/* /usr/


# install git server
# http://wiki.ubuntu.org.cn/index.php?title=Git%E6%9C%8D%E5%8A%A1%E5%99%A8Gitosis%E5%AE%89%E8%A3%85%E8%AE%BE%E7%BD%AE&variant=zh-hans
sudo apt-get install python-setuptools openssh-server openssh-client apache2
sudo adduser --system --shell /bin/sh --gecos 'git user' --group --disabled-password --home /home/git git 
sudo chown git.git /home/git -R
sudo apt-get install git gitweb
git config --global user.name "Johnson"   
git config --global user.email "xxxxxxxxxxxxx@163.com"
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto
git config --global core.autocrlf false
# install gitosis
# http://wiki.ubuntu.org.cn/Git服务器Gitosis安装设置
cd && git clone https://github.com/res0nat0r/gitosis.git
cd gitosis
sudo apt-get install python-setuptools
sudo python setup.py install
# init gitosis with my pub key. if there is no key, "ssh-keygen -t rsa" to
# generate it.
sudo -H -u git gitosis-init < /home/johnson/.ssh/id_rsa.pub
sudo chmod 755 /home/git/repositories/gitosis-admin.git/hooks/post-update
rm /home/johnson/.ssh/known_hosts
cd && git clone git@localhost:gitosis-admin.git
# create new git project
git init
git remote add origin ssh://git@localhost/xxx.git
git push origin master



# make /home/johnson/www to be www
# replace /var/www/html with /var/www/:
#     cd /etc/apache2/sites-available
#     sudo vi 000-default.conf
#     sudo vi default-ssl.conf


# install ia32-libs for adb and so on.
# http://www.ubuntukylin.com/ukylin/forum.php?mod=viewthread&tid=5107 not works now?
# enable adb/aapt:
sudo apt-get install libc6:i386 libgcc1:i386 gcc-4.6-base:i386 libstdc++5:i386 libstdc++6:i386 g++-multilib libncurses5:i386 lib32z1
# enable bcompare:
sudo apt-get install libgtk2.0-0:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386 libidn11:i386 libasound2:i386 libasound2-plugins:i386 gstreamer0.10-pulseaudio:i386 gstreamer0.10-plugins-base:i386 gstreamer0.10-plugins-good:i386 apt-get install libsm6:i386 


# fix eclipse crash error. set theme to default.
gnome-tweak-tool


# install mysql
sudo apt-get install mysql-server

# install gnome desktop on ubuntu
sudo apt-get install gnome-desktop-environment
# remove ibus
# sudo apt-get remove ibus
# install scim inputmethod
sudo apt-get install scim scim-pinyin scim-gtk-immodule im-switch
sudo im-switch –s scim


# install bypy, a baidu cloud cmd for ubuntu
sudo apt-get install python-pip python-dev build-essential python-setuptools
sudo easy_install pip
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
# sudo pip install mysql-python



# install sft mgr
sudo apt-get install synaptic


# install maven3
# http://stackoverflow.com/questions/15630055/how-to-install-maven-3-on-ubuntu-14-04-lts-13-10-13-04-12-10-12-04-by-using-apt
add following two lines into /etc/apt/sources.list
    deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main
    deb-src http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main
and exe:
sudo apt-get update && sudo apt-get install maven3
sudo ln -s /usr/share/maven3/bin/mvn /usr/bin/mvn



# install axel
# download it from http://axel.alioth.debian.org
# cfg, make and make install

