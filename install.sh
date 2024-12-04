#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Desktop directory
if [ ! -d "$HOME/Desktop" ]; then
    DESKTOP_DIR="$HOME/Desktop"
else
    DESKTOP_DIR="$HOME/Bureau"
fi


# Anaconda installation
echo "Downloading Anaconda..."
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh -O ~/Anaconda3.sh
echo "Starting Anaconda installation..."

# Instructions for user
echo ">>> Anaconda installation requires user interaction. <<<"
echo "1. Press Enter to review the license agreement."
echo "1.2 Press Enter to read or 'q' to quit."
echo "2. Type 'y' to agree to the license agreement."
echo "3. Press Enter to accept the default installation path."
echo "4. Type 'yes' to initialize Anaconda."
echo "Restart this script after completing the manual installation if necessary."
read -p "Press any key to continue once the installation is complete."
bash ~/Anaconda3.sh

# Create Anaconda shortcut
echo "Creating Anaconda shortcut..."
cat <<EOF > "$DESKTOP_DIR/Anaconda.desktop"
[Desktop Entry]
Name=Anaconda
Comment=Launch Anaconda Navigator
Exec=$HOME/anaconda3/bin/anaconda-navigator
Icon=$HOME/anaconda3/pkgs/anaconda-project-*/info/media/anaconda-project-icon-256x256.png
Terminal=false
Type=Application
EOF
chmod +x "$DESKTOP_DIR/Anaconda.desktop"

# Stellarium installation
echo "Installing Stellarium..."
sudo apt install -y stellarium

# Create Stellarium shortcut
echo "Creating Stellarium shortcut..."
cat <<EOF > "$DESKTOP_DIR/Stellarium.desktop"
[Desktop Entry]
Name=Stellarium
Comment=A planetarium software
Exec=/usr/bin/stellarium
Icon=stellarium
Terminal=false
Type=Application
EOF
chmod +x "$DESKTOP_DIR/Stellarium.desktop"

# Topcat installation
echo "Installing Topcat..."
sudo apt-get install -y topcat

# Create Topcat shortcut
echo "Creating Topcat shortcut..."
cat <<EOF > "$DESKTOP_DIR/Topcat.desktop"
[Desktop Entry]
Name=Topcat
Comment=Table operations and plotting
Exec=/usr/bin/topcat
Icon=application-default-icon
Terminal=false
Type=Application
EOF
chmod +x "$DESKTOP_DIR/Topcat.desktop"

# Aladin installation
echo "Installing Aladin..."
sudo apt install -y aladin

# Create Aladin shortcut
echo "Creating Aladin shortcut..."
cat <<EOF > "$DESKTOP_DIR/Aladin.desktop"
[Desktop Entry]
Name=Aladin
Comment=Interactive sky atlas
Exec=/usr/bin/aladin
Icon=application-default-icon
Terminal=false
Type=Application
EOF
chmod +x "$DESKTOP_DIR/Aladin.desktop"

# AstroDMX installation
echo "Installing AstroDMX..."
sudo wget https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/linux-x86_64/astrodmx-capture_2.10.1_amd64.deb -O /tmp/astrodmx-capture_amd64.deb
sudo dpkg -i /tmp/astrodmx-capture_amd64.deb
sudo apt-get install -f -y
sudo rm /tmp/astrodmx-capture_amd64.deb

# Create AstroDMX shortcut
echo "Creating AstroDMX shortcut..."
cat <<EOF > "$DESKTOP_DIR/AstroDMX.desktop"
[Desktop Entry]
Name=AstroDMX
Comment=Astronomical camera software
Exec=/usr/bin/astrodmx-capture
Icon=application-default-icon
Terminal=false
Type=Application
EOF
chmod +x "$DESKTOP_DIR/AstroDMX.desktop"

# AstroImageJ installation
echo "Installing AstroImageJ..."
sudo apt install -y openjdk-11-jdk
sudo wget https://www.astro.louisville.edu/software/astroimagej/installation_packages/AstroImageJ_v5.3.3.00-linux-x86_64Bit.tar.gz -O /tmp/AIJ.tar.gz
tar -xvzf /tmp/AIJ.tar.gz -C ~/

# Create AstroImageJ shortcut
echo "Creating AstroImageJ shortcut..."
cat <<EOF > "$DESKTOP_DIR/AstroImageJ.desktop"
[Desktop Entry]
Name=AstroImageJ
Comment=Image processing software for astronomy
Exec=$HOME/AstroImageJ/AstroImageJ
Icon=application-default-icon
Terminal=false
Type=Application
EOF
chmod +x "$DESKTOP_DIR/AstroImageJ.desktop"

# Octave installation
echo "Installing Octave..."
sudo apt install -y octave

# Create Octave shortcut
echo "Creating Octave shortcut..."
cat <<EOF > "$DESKTOP_DIR/Octave.desktop"
[Desktop Entry]
Name=Octave
Comment=GNU Octave environment
Exec=/usr/bin/octave
Icon=octave
Terminal=false
Type=Application
EOF
chmod +x "$DESKTOP_DIR/Octave.desktop"

# ASTAP installation
echo "Installing ASTAP..."
sudo wget https://sourceforge.net/projects/astap-program/files/linux_installer/astap_i386.deb/download -O /tmp/astap.deb
sudo dpkg -i /tmp/astap.deb

# Create ASTAP shortcut
echo "Creating ASTAP shortcut..."
cat <<EOF > "$DESKTOP_DIR/ASTAP.desktop"
[Desktop Entry]
Name=ASTAP
Comment=Astrometric software
Exec=/usr/bin/astap
Icon=application-default-icon
Terminal=false
Type=Application
EOF
chmod +x "$DESKTOP_DIR/ASTAP.desktop"

echo "All installations and shortcuts are complete."
