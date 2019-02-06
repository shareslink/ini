# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# uname on ubuntu is Linux
# uname on mac is Darwin
osname=`uname`

if [ $osname == "Darwin" ]; then
    alias dir='ls'
    export CLICOLOR=1 # enable color style
    export TERM=xterm-color
    alias vi=vim
else
    alias dir='dir'
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'

    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi







################################################################################
# Johnson bin
################################################################################
# sudo apt-get install xfonts-terminus
# ulimit -n 32768
################################################################################
# User specific aliases and functions
################################################################################
# edit a file in 0x mode
# vi -b xxx.file
# :%!xxd
# :%!xxd -r
################################################################################
# scp xxx.tar.gz  baseapp@10.107.123.56:/home/xxx/
# ssh hongtao@10.107.123.48
# mount -o loop -t ext4 path/to/img /mnt/tmp
# mount -o loop path/to/iso /mnt/iso
# iptables -I INPUT -p tcp --dport 1234 -j ACCEPT
# edquota -u woniu
# date +%Y%m%d_%H_%M_%S
# sudo mount -t smbfs -o username=johnson,password=xxxxxx, -l //192.168.1.4/johnson smb
# make_ext4fs -s -l 512M -a system xxx.img xxx.dir
###############################################################################
# decompile odex file to smali file: -a android-version
# java -jar baksmali-2.0.jar -a 15 -x input.odex -d output.dir
#
# pack smali to dex file: -a android-version
# java -jar smali-2.0.jar -a 15 -o output.dex input.dir
#
# MacBook CMD
# defaults write com.apple.desktopservices DSDontWriteNetworkStores true
###############################################################################
# proxy for network
# export http_proxy=http://z00182775:asdf123+@proxy.huawei.com:8080/
# export ftp_proxy=http://z00182775:asdf123+@proxy.huawei.com:8080/
# export no_proxy="email*.huawei.com,imail*.huawei.com"
# alias gct='ctags --fields=+afiKlmnsSzt -L $file -f ./tags'
# alias gct='ctags --fields=+afiKlmnsSzt'
# install flashplugin: http://blog.sina.com.cn/s/blog_458f4a2c01018apo.html
# x11vnc -display :0 -auth /var/run/lightdm/root/:0 -forever -bg -o /var/log/x11vnc.log -rfbauth /home/johnson/.vnc/passwd -rfbport 5900
# z cyicai  | awk -F':' '{print $1}' | sort -u | grep -v html | grep -v css | while read i; do echo "sed $i"; sed -i .bak 's/cyicai/shareslink/g' $i; rm $i.bak; done;
# sed -i s/"Sm2"/"SmTwo"/g `grep "Sm2" -rl --include="*.java" ./`
# log=/var/log/git.log; echo "" > $log; git log --oneline | awk '{print $1}' | while read i; do line >> $log; echo "$i" >> $log; git show $i >> $log; done; vi $log
###############################################################################
# lookup program according to port number: netstat -anpt
################################################################################
ips=(`ifconfig | grep 'inet addr' | awk '{print $2}' | awk -F: '{print $2}' | sort`)
len=${#ips[@]}
IP=
for ip in ${ips[@]}; do
    if [ ! $ip = 127.0.0.1 ]; then
        IP="$ip "
    fi
done

if [ ! $osname == "Darwin" ]; then
    if [ `whoami` = root ]; then
        export PS1="\[\e[31m\][${IP}\u@\H]\[\e[m\]\[\e[33m\]:\w# \[\e[m\]"
    else
        export PS1="\[\e[31m\][${IP}\u@\H]\[\e[m\]\[\e[33m\]:\w\$ \[\e[m\]"
    fi
else
    if [ `whoami` = root ]; then
        export PS1="\[\e[31m\][\u@\H]\[\e[m\]\[\e[33m\]:\w# \[\e[m\]"
    else
        export PS1="\[\e[31m\][\u@\H]\[\e[m\]\[\e[33m\]:\w\$ \[\e[m\]"
    fi
fi

################################################################################
# DIR CMD
################################################################################
# alias for reading all kind of readme file
alias r='if [ -e README ]; then more README; elif [ -e readme ]; then more readme; elif [ -e readme.txt ]; then more readme.txt; elif [ -e README.TXT ]; then more README.TXT; elif [ -e rdm ]; then more rdm; elif [ -e ~/sec/readme ]; then more ~/sec/readme; fi' 
alias r='if [ -e README ]; then cat README; elif [ -e readme ]; then cat readme; elif [ -e readme.txt ]; then cat readme.txt; elif [ -e README.TXT ]; then cat README.TXT; elif [ -e rdm ]; then cat rdm; elif [ -e ~/sec/readme ];     then cat ~/sec/readme; fi'


if [ $osname == "Darwin" ]; then
    alias c='pwd && echo ------------------------------------------------------------  && ls -lh'
    alias xxx='sudo shutdown -h +1'
    alias du='du -m'
    alias XXX='sudo shutdown -h now'
else
    alias c='pwd && echo ------------------------------------------------------------  && ls -lh --color=auto --group-directories-first'
    alias XXX='sudo shutdown -P now'
    alias xxx='gnome-screensaver-command -l'
    alias du='du -BM'
fi

alias c.='cd .. && c'
alias c..='cd - && c'
alias e='clear'
alias t='cd ./tmp'

if [ $osname == "Darwin" ]; then
    alias udb='sudo /usr/libexec/locate.updatedb'
    alias ls='ls'
else
    alias udb='sudo updatedb'
    alias ls="ls -l --time-style='+%Y-%m-%d %H:%M' -h --color=auto"
fi

alias la='ls -lah'
alias lr='ls -ltrh'
alias cls='clear'
alias vit='vi -t'
alias his='history'
alias fdn='find . -name'
alias where='find ./ | grep --color=auto'
################################################################################
# SVN CMD
################################################################################
alias sup='svn up'
alias sdf='svn diff'
alias sif='svn info'
alias sst='svn status'
# svn revert . --depth=infinity
alias srv='svn revert'
# svn export --force http://10.112.128.129:6801/svn/xxx
# svn checkout  http://10.112.128.129:6801/svn/Code/br_Gingerbread_7x27
################################################################################
# Maven CMD
################################################################################
alias mpi='mvn package install -Dmaven.test.skip=true'
alias mci='mvn clean install -Dmaven.test.skip=true'
alias mvn_dev='mvn clean install -P develop -Dmaven.test.skip=true'
alias mvn_tst='mvn clean install -P betatest -Dmaven.test.skip=true'
alias mvn_pre='mvn clean install -P preduction -Dmaven.test.skip=true'
alias mvn_pro='mvn clean install -P production -Dmaven.test.skip=true'
################################################################################
# GIT CMD
################################################################################
# git config --global diff.tool vimdiff
# git config --global difftool.prompt false
# git config --global alias.d difftool
# git config --global core.whitespace cr-at-eol
alias gad='git add'
alias gbr='git branch'
alias gcm='git commit'
alias gcp='git cherry-pick'
alias gdf='git diff'
alias gdt='git difftool'
alias ghp='git help'
alias glg='git log --name-status'
alias gmg='git merge'
alias gmv='git mv'
alias gps='git push'
alias gpl='git pull'
alias grb='git rebase'
alias grm='git rm'
alias grs='git reset'
alias gsh='git show'
alias gst='git status'
alias gtg='git tag'
alias gwc='git whatchanged'
alias gfp='git format-patch'
alias rsc='repo sync -j8 '
alias rss='cwd=`pwd`; gits=`find . | grep ".git$"`; for git in $gits; do dir=`dirname $git`; cd $dir; pwd; repo sync .; cd $cwd;  done'
alias rfa='repo forall'
alias rco='repo checkout'
alias rbr='repo branch'
alias rsa='repo start --all'
alias rst='repo status -j 8'
alias srp='ps a | grep repo'
alias s='git status'
alias S='sta'

################################################################################
# SYSTEM CMD
################################################################################
alias tx='tar xvf'
alias zx='tar zxvf'
alias jx='tar jxvf'
alias uz='unzip'
alias cfg='./configure'
alias cp='cp -r'
alias rm='rm -fr'
alias me='vi ~/.bashrc'
alias use='. ~/.bashrc'
alias loc='locate'
alias evc='evince'

# set time stamp for tag operation
alias sts='timestamp=`date +%Y%m%d%H%M%S` && echo timestamp=$timestamp'
alias smi='sudo make install'
alias sai='sudo apt-get install'
alias sas='sudo apt-cache search'
alias sar='sudo apt-get remove'
alias saa='sudo apt-get autoremove'
alias sau='sudo apt-get update'
alias sauu='sudo apt-get update && sudo apt-get upgrade'
# alias prx='ssh -qTfnN -D 7070 johnsonelizee@216.194.70.6'
alias mp='mplayer'
alias X='exit'
alias E='exit'
alias showip="ifconfig | grep -i mask | grep -i inet"
alias chdirmod755='find . | while read line; do if [ -d "$line" ]; then chmod 755 "$line"; echo "chmod 755 $line"; fi; done;'
###############################################################################
# create all shortcuts for ~/
for i in `dir ~`
do
    if [ -d ~/$i ]
    then
        alias $i="cd ~/$i && c"
    fi
done


###############################################################################
# ANDROID CMD
###############################################################################
alias x="cd \`cat ~/.alias.x\` && c"
alias pkg='x && cd packages/apps && c'
alias app='x && cd out/target/product/generic/system/app && c'
alias sbe='x && . build/envsetup.sh && prebuilts/misc/linux-x86/ccache/ccache -M 50G'
alias fwk='x && cd frameworks/base && c'
alias s='adb shell'
alias aks='adb kill-server && adb start-server'
alias alc='adb logcat'

# android build options
export USE_CCACHE=1

alias proguard='~/ins/adt/sdk/tools/proguard/bin/proguardgui.sh'

###############################################################################
# GOOGLE AGENT
###############################################################################
# https://www.googlesource.com/new-password
alias gas='~/ins/gae/google.agent/local/proxy.sh'
alias gar='~/ins/gae/google.agent/local/proxy.sh restart'
alias gaS='~/ins/gae/google.agent/local/proxy.sh stop'

###############################################################################
# PATH
###############################################################################
alias mdb='mysql -uroot -p18a7e57ea9c0aeb3c0656103762f35bd18dedf88'
###############################################################################
# PATH
###############################################################################
export JAVA_HOME=~/ins/jdk
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/rt.jar:.
export ANDROID_HOME=~/ins/adt/sdk
export USE_CCACHE=1
export MAVEN_HOME=~/ins/mvn
export M2_HOME=~/ins/mvn
export GRADLE_HOME=~/ins/grd
export PATH=/sbin:$PATH
export PATH=~/bin:$PATH
export PATH=~/bin/archive:$PATH
export PATH=~/bin/archive/rar.macos:$PATH
export PATH=~/bin/perforce:$PATH
export PATH=~/bin/webook:$PATH
export PATH=~/bin/android:$PATH
export PATH=~/bin/android/decompiler:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$M2_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=~/ins/rar:$PATH
export PATH=~/ins/adt/sdk/platform-tools:$PATH
export PATH=~/ins/adt/sdk/build-tools/bin:$PATH #you should ln -s xxx bin
export PATH=~/ins/adt/sdk/tools:$PATH
export PATH=~/ins/adt/ndk:$PATH
export PATH=~/ins/bcp/bin:$PATH
export PATH=~/ins/ant/bin:$PATH
export PATH=/Users/johnson/src/dcm4che/dcm4che-assembly/target/dcm4che-3.3.7-SNAPSHOT-bin/dcm4che-3.3.7-SNAPSHOT/bin:$PATH
###############################################################################
# PRE-DO
############################################################################### 
if [ $osname = "Darwin" ]; then
    export LSCOLORS=Eagxbxbxcxbabacbcgebeg
elif [ $osname = 'Linux' ]; then
    if [ -e ~/examples.desktop ]; then rm ~/examples.desktop; fi
    if [ -d ~/Desktop ]; then rm -fr ~/Desktop; fi
fi



###############################################################################
# APPLICATION
###############################################################################
alias yed='java -jar /home/johnson/ins/yed/yed.jar > /dev/null 2>&1 &'
alias ea='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Sparx\ Systems/EA\ Trial/EA.exe > /dev/null 2>&1 &'
alias sis='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Source\ Insight\ 3/Insight3.exe > /dev/null 2>&1 &'

alias jee='~/ins/jee/eclipse/eclipse > /dev/null 2>&1 &'
alias ecs='~/ins/ecs/eclipse/eclipse > /dev/null 2>&1 &'
alias rcp='~/ins/rcp/eclipse/eclipse > /dev/null 2>&1 &'
alias rap='~/ins/rap/eclipse/eclipse > /dev/null 2>&1 &'
if [ $osname = "Darwin" ]; then
    alias jee='open ~/ins/jee/eclipse/Eclipse.app'
    alias ecs='open ~/ins/ecs/eclipse/Eclipse.app'
    alias rcp='open ~/ins/rcp/eclipse/Eclipse.app'
    alias rap='open ~/ins/rap/eclipse/Eclipse.app'

    alias deldss='find . -name ".DS_Store" -depth -exec rm {} \;'
fi

alias adr='~/ins/adt/studio/bin/studio.sh > /dev/null 2>&1 &'
alias adt='~/ins/adt/eclipse/eclipse > /dev/null 2>&1 &'
alias ddms='ddms > /dev/null 2>&1 &'
alias ide='~/ins/ide/bin/idea.sh > /dev/null 2>&1 &'
alias crm='/usr/bin/google-chrome > /dev/null 2>&1 &'
alias ofc='libreoffice'
alias keyname='java -jar ~/bin/NQ.AV.Publickey.Encryptor.jar'
alias tmc='cd && cd ins/tmc && c'
alias mi='mvn install'
alias bai='if [ -d ~/百度云同步盘 ]; then cd ~/百度云同步盘 && c ; else cd ~/Desktop/百度云同步盘 && c ; fi'

alias log='tail -f ~/ins/tmc/logs/catalina.out'
alias taf='tail -f'
alias iml='find . -name *.iml -o -name .idea -o -name target | while read i; do echo "delete $i"; rm $i; done; find . -name *.iml -o -name .idea -o -name target | while read i; do echo "delete $i"; rm $i; done;'
alias psj='ps aux | grep java'
alias pst='ps aux | grep tomcat'
alias ltn='lantern > /dev/null 2>&1 &'
alias wex='~/ins/wex/electronic-wechat & > /dev/null 2>&1'
alias showport='n server.xml | xargs grep Connector | grep HTTP | grep port | grep pro | grep -v "!" | grep -v Define'
alias sdi='sudo dpkg -i'
alias prt='parity --geth'
export PATH="$PATH:$HOME/.rvm/bin:/opt/wkhtmltox/bin" # Add RVM to PATH for scripting

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export ROCKETMQ_HOME='/root/ins/rmq'
export PATH="$ROCKETMQ_HOME/bin:$PATH"


###############################################################################
# HADOOP
###############################################################################

export HADOOP_HOME=~/ins/dfs/hadoop
export PATH=${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${JAVA_HOME}/bin:$PATH
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export HDFS_NAMENODE_USER=root
export HDFS_DATANODE_SECURE_USER=root
export HDFS_DATANODE_USER=root
export HDFS_DATANODE_SECURE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root
export YARN_RESOURCEMANAGER_USER=root
export YARN_NODEMANAGER_USER=root
###############################################################################
# ~/.bash is used for extra ENV
# pls hold this line at the end of this file
if [ -f ~/.bash ]; then
	source ~/.bash
fi
