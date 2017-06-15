#!/bin/bash
## usage: chmod +X setup.sh 
##        bash setup.sh
## Author: rsalem
## Purpose: setups the system for Ubuntu 16.04
## Installs: Terminator, Atom, Qtcreator, Virtual env, htop ROS-Kinetic Install, OpenCV3 

sudo apt update

echo "$(tput setaf 2)Installing terminator(tput sgr0)$"
sudo apt install terminator

echo "$(tput setaf 2)Installing qtcreator(tput sgr0)$"
sudo apt install qtcreator

echo "$(tput setaf 2)Installing atom (tput sgr0)$"
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update; sudo apt install atom 

echo "$(tput setaf 4) Installing htop (tput sgr0)$"
sudo apt install htop

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

echo "$(tput setaf 4) Installing OpenCV : (tput sgr0)$"
sudo apt install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
cd ~/
git clone https://github.com/opencv/opencv.git
cd ~/opencv
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make
sudo make install

echo "$(tput setaf 6) Installing virtual env: (tput sgr0)$"
sudo apt instal virtualenv

sudo apt-get dist-upgrade



