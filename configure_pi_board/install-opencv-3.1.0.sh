#! /bin/sh
# Install script for OpenCV 3.1.0 for Ubuntu 14.04 LTS
# Written by Min Hoo Lee
# March 14, 2016 (3/14/2016)

echo "\nOpenCV Install Script for OpenCV 3.1.0 for Ubuntu 14.04 LTS\n"

# Activate all the apt-get repositories
echo "\nAdding all apt-get repositories\n"
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo apt-get -y update

# Install OpenCV dependencies
echo "\nInstalling dependencies\n"
sudo apt-get install git vim curl cmake g++ libopencv-dev build-essential libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5 libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip -y

# Install OpenCV 3.1.0
echo "\nPreparing for OpenCV 3.1.0 installation\n"

mkdir -p ~/Vision/src
mkdir ~/Vision/bin
curl -L0k https://github.com/Itseez/opencv/archive/3.1.0.zip > opencv-3.1.0.zip
unzip opencv-3.1.0.zip -d ~/Vision/bin/
rm opencv-3.1.0.zip
cd ~/Vision/bin/opencv-3.1.0
mkdir ~/Vision/bin/opencv-3.1.0/build

# Additional repository for SIFT and SURF patented operators
cd ~/Vision/bin/
curl -L0k https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip > opencv_contrib-3.1.0.zip
unzip opencv_contrib-3.1.0.zip -d ~/Vision/bin/
rm opencv_contrib-3.1.0.zip

echo "\nStarting OpenCV installation\n"
cd ~/Vision/bin/opencv-3.1.0/build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/Vision/bin/opencv_contrib-3.1.0/modules \
    -D WITH_TBB=ON \
    -D WITH_CUDA=ON ~/Vision/bin/opencv-3.1.0
sudo make -j4 install

sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

echo "\nDone installing OpenCV (may or may not have been successful). Please run install-opencv-examples-3.1.0.sh\n"
