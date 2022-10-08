#!/bin/sh

echo "Installation: brave started"
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y
echo "Installation: brave complete"

echo "Installation: docker started"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker run hello-world
echo "Installation: docker completed"

echo "Installation: VScode start"
sudo snap refresh
sudo snap install code --classic
echo "Installation: VScode complete"

echo "Installation: Chrome start"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo "Installation: Chrome completed"

echo "Installation: JDK start"
sudo apt install openjdk-11-jdk -y
java --version
echo "Installation: JDK complete"

echo "Installation: Android studio start"
sudo snap install android-studio --classic
echo "Installation: Android studio complete"

echo "Installation: Flutter start"
sudo snap install flutter --classic
flutter sdk-path
echo "Installation: Flutter complete"

echo "Installation: Git start"
sudo apt install git
echo "Installation: Git complete"

echo "Installation: Pip start"
sudo apt install python3-pip -y
sudo apt install python3-venv -y
echo "Installation: Pip complete"

echo "Installation: nodejs start"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm list-remote
nvm install v16.17.1
echo "Installation: nodejs complete"