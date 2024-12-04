#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Anaconda installation
echo "Downloading Anaconda..."
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh -O ~/Anaconda3.sh
echo "Starting Anaconda installation..."
bash ~/Anaconda3.sh

# User instructions
echo ">>> Anaconda installation requires user interaction. <<<"
echo "1. Press Enter to review the license agreement."
echo "2. Type 'y' to agree to the license agreement."
echo "3. Press Enter to accept the default installation path."
echo "4. Type 'yes' to initialize Anaconda."
echo "Restart this script after completing the manual installation if necessary."
read -p "Press any key to continue once the installation is complete."

# Stellarium installation
echo "Installing Stellarium..."
sudo apt install -y stellarium

# Topcat installation
echo "Installing Topcat..."
sudo apt-get install -y topcat

# Aladin installation
echo "Installing Aladin..."
sudo apt install -y aladin

# AstroDMX installation
echo "Installing AstroDMX..."
sudo wget https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/linux-x86_64/astrodmx-capture_2.10.1_amd64.deb -O /tmp/astrodmx-capture_amd64.deb
sudo dpkg -i /tmp/astrodmx-capture_amd64.deb
sudo apt-get install -f -y
sudo rm /tmp/astrodmx-capture_amd64.deb

# AstroImageJ installation
echo "Installing AstroImageJ..."
sudo apt install -y openjdk-11-jdk
sudo wget https://www.astro.louisville.edu/software/astroimagej/installation_packages/AstroImageJ_v5.3.3.00-linux-x86_64Bit.tar.gz -O /tmp/AIJ.tar.gz
tar -xvzf /tmp/AIJ.tar.gz -C ~/
echo "Launching AstroImageJ..."
~/AstroImageJ/AstroImageJ &

# Octave installation
echo "Installing Octave..."
sudo apt install -y octave

# ASTAP installation
echo "Installing ASTAP..."
sudo wget https://sourceforge.net/projects/astap-program/files/linux_installer/astap_i386.deb/download -O /tmp/astap.deb
sudo dpkg -i /tmp/astap.deb

echo "All installations are complete."
