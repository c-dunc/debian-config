#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install my common packages
sudo apt install -y git nvim curl zsh wget tmux unzip build-essential

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install plugin zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Install plugin zsh-completions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]; then
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi

# Install plugin F-Sy-H
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/F-Sy-H" ]; then
  git clone https://github.com/z-shell/F-Sy-H.git ~/.oh-my-zsh/custom/plugins/F-Sy-H
fi

# Set Zsh as default shell in Linux
if grep -q "$(which zsh)" /etc/passwd; then
  echo "Zsh is already set as the default shell."
else
  sudo chsh -s "$(which zsh)" "$USER"
  echo "Please restart WSL for changes to take effect."
fi
