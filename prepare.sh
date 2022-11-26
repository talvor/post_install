#!/bin/bash

# Enable Fastest Mirror 
echo "### Enable fastest mirror"
sudo sed -zi '/fastestmirror=true/!s/$/\nfastestmirror=true\n/' /etc/dnf/dnf.conf
sudo sed -zi '/deltarpm=true/!s/$/deltarpm=true\n/' /etc/dnf/dnf.conf
sudo sed -zi '/max_parallel_downloads=10/!s/$/max_parallel_downloads=10\n/' /etc/dnf/dnf.conf

# Run system update
echo "### Update system"
sudo dnf update

# Enable RPM Fusion
echo "### Enable RPM Fusion"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Reduce Battery Usage
echo "### Reduce battery usage"
sudo dnf install tlp tlp-rdw
sudo systemctl enable tlp

# Enable flathub repo
echo "### Enable Flathub"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Ansible
echo "### Install ansible"
sudo dnf install ansible

# Install requirements
ansible-galaxy install -r requirements.yml
