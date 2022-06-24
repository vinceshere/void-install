#!/bin/sh
set -e pipefail

print_message "Add flathub repo:"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
print_message "Finished adding flathub repo!"

print_message "Set wallpaper:"
feh --bg-fill ~/.local/share/wallpapers/image23.png
print_message "Finished setting wallpaper!"

print_message "Installing VSCode extensions:"
code-oss --install-extension arcticicestudio.nord-visual-studio-code
code-oss --install-extension dbaeumer.vscode-eslint
code-oss --install-extension EditorConfig.EditorConfig
code-oss --install-extension naumovs.color-highlight
code-oss --install-extension Tyriar.sort-lines
code-oss --install-extension Vue.volar
print_message "Finished installing VSCode extensions!"