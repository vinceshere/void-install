#!/bin/sh
set -e pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
SEPARATOR="====================================================";

print_message() {
    echo $SEPARATOR
    echo "$1"
    echo $SEPARATOR
}

print_message "Upgrading packages:"
sudo xbps-install -Suy
print_message "Finished upgrading packages!"

print_message "Enabling extra repos:"
sudo xbps-install -Sy void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree
print_message "Finished enabling extra repos!"

print_message "Installing base-devel:"
sudo xbps-install -Sy base-devel
print_message "base-devel installed!"

print_message "Installing packages list:"
sudo xbps-install -Sy $(cat $SCRIPT_DIR/main-packages.txt | cut -d' ' -f1)
print_message "Packages installed!"

print_message "Enabling services:"
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/docker /var/service/
sudo ln -s /etc/sv/cupsd /var/service/
sudo ln -s /etc/sv/bluetoothd /var/service/
sudo ln -s /etc/sv/elogind /var/service/
sudo ln -s /etc/sv/polkitd /var/service/
sudo ln -s /etc/sv/udevd /var/service/
sudo ln -s /etc/sv/NetworkManager /var/service/
print_message "Finished enabling services!"

print_message "Installing antigen:"
curl -L git.io/antigen > ~/antigen.zsh
print_message "Finished adding user to docker group!"

print_message "Installing zscroll:"
cd /tmp && git clone https://github.com/noctuid/zscroll
cd /tmp/zscroll && sudo python3 setup.py install
print_message "Finished installing zscroll!"

print_message "Add user to docker group:"
sudo usermod -aG docker $USER
print_message "Finished adding user to docker group!"

print_message "Setup betterlockscreen background:"
betterlockscreen -u ~/.local/share/wallpapers
print_message "Finished betterlockscreen setup!"

print_message "Update user dirs:"
xdg-user-dirs-update
print_message "Finished updating user dirs!"

print_message "Set zsh as default shell:"
chsh -s $(which zsh)
print_message "Finished setting default shell!"

print_message "Install nvm:"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
print_message "Finished installing nvm!"

print_message "Create screenshots folder:"
mkdir -p ~/Pictures/Screenshots/
print_message "Finished creating screenshots folder!"

print_message "Reboot your machine to start a graphical session :)"
