#!/bin/bash

set -e

# Variables
ICON_DIR="$HOME/.local/share/icons"
APPLICATION_DIR="$HOME/.local/share/applications"

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

sudo apt install desktop-file-utils

# Anaconda installation
echo "Downloading Anaconda..."
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh -O ~/Anaconda3.sh
echo "Starting Anaconda installation..."
bash ~/Anaconda3.sh -b -p "$HOME/anaconda3"
rm ~/Anaconda3.sh

# Add Anaconda to PATH if not already added
if ! grep -q "anaconda3/bin" ~/.bashrc; then
  echo "Adding Anaconda to PATH..."
  echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc
fi

# Apply changes
source ~/.bashrc

# Create Anaconda shortcut
echo "Creating Anaconda shortcut..."
mkdir -p "$APPLICATION_DIR"
cat <<EOF > "$APPLICATION_DIR/Anaconda.desktop"
[Desktop Entry]
Name=Anaconda
Comment=Launch Anaconda Navigator
Exec=gnome-terminal -- bash -c "source $HOME/.bashrc; conda activate base; anaconda-navigator; exec bash"
Icon=$HOME/anaconda3/lib/python3.12/site-packages/anaconda_navigator/static/images/common/anaconda-icon-256x256.png
Terminal=false
Type=Application
EOF
cp "$APPLICATION_DIR/Anaconda.desktop" "$DESKTOP_DIR/"

# Stellarium installation
echo "Installing Stellarium..."
sudo apt install -y stellarium

# Stellarium shortcut
echo "Creating Stellarium shortcut..."
cat <<EOF > "$APPLICATION_DIR/Stellarium.desktop"
[Desktop Entry]
Name=Stellarium
Comment=A planetarium software
Exec=/usr/bin/stellarium
Icon=stellarium
Terminal=false
Type=Application
EOF
cp "$APPLICATION_DIR/Stellarium.desktop" "$DESKTOP_DIR/"

# AstroDMX installation
echo "Installing AstroDMX..."
sudo wget https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/linux-x86_64/astrodmx-capture_2.10.1_amd64.deb -O /tmp/astrodmx-capture_amd64.deb
sudo dpkg -i /tmp/astrodmx-capture_amd64.deb || sudo apt-get install -f -y
rm /tmp/astrodmx-capture_amd64.deb

# AstroImageJ installation
echo "Installing AstroImageJ..."
sudo apt install -y openjdk-11-jdk
wget https://www.astro.louisville.edu/software/astroimagej/installation_packages/AstroImageJ_v5.3.3.00-linux-x86_64Bit.tar.gz -O /tmp/AIJ.tar.gz
tar -xvzf /tmp/AIJ.tar.gz -C ~/
rm /tmp/AIJ.tar.gz

# AstroImageJ shortcut
echo "Creating AstroImageJ shortcut..."
cat <<EOF > "$APPLICATION_DIR/AstroImageJ.desktop"
[Desktop Entry]
Name=AstroImageJ
Comment=Image processing software for astronomy
Exec=$HOME/AstroImageJ/AstroImageJ
Icon=$HOME/AstroImageJ/astronomy_icon.png
Terminal=false
Type=Application
EOF
cp "$APPLICATION_DIR/AstroImageJ.desktop" "$DESKTOP_DIR/"

# Octave installation
echo "Installing Octave..."
sudo apt install -y octave

# ASTAP installation
echo "Installing ASTAP..."
sudo apt install -y astap

# Download ASTAP icon
echo "Downloading ASTAP icon..."
mkdir -p "$ICON_DIR"
ICON_PATH="$ICON_DIR/astap.png"
wget -O "$ICON_PATH" "https://example.com/astap.png"

# ASTAP shortcut
echo "Creating ASTAP shortcut..."
cat <<EOF > "$APPLICATION_DIR/ASTAP.desktop"
[Desktop Entry]
Name=ASTAP
Comment=Astrometric software
Exec=/usr/bin/astap
Icon=$ICON_PATH
Terminal=false
Type=Application
EOF
cp "$APPLICATION_DIR/ASTAP.desktop" "$DESKTOP_DIR/"

echo "All installations and shortcuts are complete."
