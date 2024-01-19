#!/bin/bash

# Function to install and configure xRDP
configure_xrdp() {
    # Update system
    echo "Updating system..."
    sudo pacman -Syu

    # Install xrdp and xorgxrdp-git from AUR
    echo "Installing xrdp and xorgxrdp-git..."
    sudo pacman -Sy yay base-devel xorg-xserver-devel
    yay -S xrdp xorgxrdp

    # Allow any user to start an X session
    echo "Configuring Xwrapper..."
    echo "allowed_users=anybody" | sudo tee -a /etc/X11/Xwrapper.config

    # Configure .xinitrc file for XFCE desktop
    echo "Configuring .xinitrc..."
    sed -i 's/^\(SESSION=${1:-xfce-session}\)$/#\1 # original\nSESSION=${1:-xfce4-session}/' ~/.xinitrc
    sed -i 's/^\s*\(local dbus_args=(--sh-syntax --exit-with-session)\)$/#\1 # original\nlocal dbus_args=(--sh-syntax)/' ~/.xinitrc
    sed -i 's/^\(exec $(get_session "$1")\)$/#\1 # original\nexec $(get_session "$SESSION")/' ~/.xinitrc

    # Enable xrdp
    echo "Enabling xrdp service..."
    sudo systemctl enable --now xrdp.service
}

# Call the function
configure_xrdp
