#!/bin/bash
## usage: chmod +X setup.sh 
##        bash setup.sh
## Author: rsalem
## Purpose: setups the system for Ubuntu 16.04
## Installs: Terminator, Atom, Qtcreator, Virtual env, htop, ROS-Kinetic, docker-ce, git-gui,  

sudo apt update

echo "$(tput setaf 2)Installing terminator(tput sgr0)$"
sudo apt install terminator -y

echo "$(tput setaf 2)Installing qtcreator(tput sgr0)$"
sudo apt install qtcreator -y

echo "$(tput setaf 2)Installing atom (tput sgr0)$"
sudo add-apt-repository ppa:webupd8team/atom -y
sudo apt update; sudo apt install atom -y

echo "$(tput setaf 4) Installing htop (tput sgr0)$"
sudo apt install htop


echo "$(tput setaf 6) Installing virtual env: (tput sgr0)$"
sudo apt install python-virtualenv -y
sudo apt install python-pip -y 

echo "$((tput setaf 2) Installing git-gui: (tput sgr0)$"
sudo apt install git-gui -y

echo "$(tput setaf 3) Installing ROS :(tput sgr0)$"
echo "$(tput setaf 2) Installing ROS : Setting up sources.list(tput sgr0)$"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
echo "$(tput setaf 2) Installing ROS : Setting up the keys (tput sgr0)$"
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
echo "$(tput setaf 2) Installing ROS Kinetic Desktop-full:(tput sgr0)$"
sudo apt-get install ros-kinetic-desktop-full
echo "$(tput setaf 3) Initilizing ros dep: (tput sgr0)$"
sudo rosdep init
rosdep update
echo "$(tput setaf 3)Installing ROS: Setting up enironment$"
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc 
source ~/.bashrc
echo "$(tput setaf 5) Getting ros install (tput sgr0)$"
sudo apt-get install python-rosinstall

echo "$(tput setaf 7) Installing Docker-CE: (tput sgr0)$"
sudo apt-get install -y\
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce -y

sudo apt-get dist-upgrade



