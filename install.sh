#!/bin/bash

# Color codes for styling the menu
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to install yay if it's not found
install_yay() {
  if ! command -v yay &> /dev/null; then
    echo -e "${RED}yay not found! Installing yay...${NC}"
    cd /tmp
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ~
  else
    echo -e "${GREEN}yay is already installed.${NC}"
  fi
}

# Function to install recommended locale
install_locale() {
  echo -e "${GREEN}Setting recommended locale...${NC}"
  cat <<EOL | sudo tee -a /etc/locale.conf
LANG="en_US.UTF-8"
LC_ADDRESS="cs_CZ.UTF-8"
LC_COLLATE="cs_CZ.UTF-8"
LC_CTYPE="cs_CZ.UTF-8"
LC_IDENTIFICATION="cs_CZ.UTF-8"
LC_MEASUREMENT="cs_CZ.UTF-8"
LC_MESSAGES="cs_CZ.UTF-8"
LC_MONETARY="cs_CZ.UTF-8"
LC_NAME="cs_CZ.UTF-8"
LC_NUMERIC="cs_CZ.UTF-8"
LC_PAPER="cs_CZ.UTF-8"
LC_TELEPHONE="cs_CZ.UTF-8"
LC_TIME="cs_CZ.UTF-8"
EOL
  sudo locale-gen
  echo -e "${GREEN}Locale set. Please reboot for changes to take effect.${NC}"
}

# Function to install basic packages
install_basic_packages() {
  echo -e "${GREEN}Installing basic packages...${NC}"
  sudo pacman -S --needed \
    kitty ttf-hack-nerd ttf-jetbrains-mono-nerd hyprland xdg-desktop-portal-hyprland \
    waybar zsh nautilus power-profiles-daemon polkit-gnome sddm fastfetch lsd \
    nwg-look wofi kvantum hyprlock hypridle hyprpaper noto-fonts-emoji pipewire \
    libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard \
    brightnessctl swww python gnome-bluetooth-3.0 pacman-contrib
}

# Function to install AUR packages with yay
install_aur_packages() {
  echo -e "${GREEN}Installing AUR packages...${NC}"
  yay -S bun-bin oh-my-zsh-git zsh-theme-powerlevel10k zsh-syntax-highlighting \
    zsh-autosuggestions catppuccin-gtk-theme-mocha tela-circle-icon-theme-purple \
    hyprshot nautilus-open-any-terminal grimblast-git hyprpicker matugen-bin \
    aylurs-gtk-shell-git
}

# Function to set up ZSH
setup_zsh() {
  echo -e "${GREEN}Setting ZSH as default shell...${NC}"
  chsh -s $(which zsh)
}

# Function to install Nvidia-related packages
install_nvidia() {
  echo -e "${GREEN}Installing Nvidia packages...${NC}"
  yay -S optimus-manager-git optimus-manager-qt nvidia-beta-dkms bbswitch-dkms
  echo -e "${GREEN}Creating optimus-manager config file...${NC}"
  sudo tee /etc/optimus-manager/optimus-manager.conf > /dev/null <<EOL
[optimus]
startup_mode=auto
startup_auto_extpower_mode=nvidia
startup_auto_battery_mode=integrated
startup_auto_nvdisplay_on_mode=nvidia
startup_auto_nvdisplay_off_mode=integrated
switching=bbswitch
pci_power_control=no
pci_remove=no
pci_reset=no
auto_logout=yes

[nvidia]
dynamic_power_management=fine
DPI=96
modeset=yes

[intel]
driver=modesetting
DRI=3
modeset=yes

[amd]
driver=modesetting
DRI=3
EOL
}

# Function to install everything
install_all() {
  install_yay
  install_locale
  install_basic_packages
  install_aur_packages
  setup_zsh
  install_nvidia
}

# Menu for selecting options
menu() {
  echo -e "${GREEN}Welcome to the Arch Linux Dotfiles Installer!${NC}"
  echo "Please choose what to install:"
  echo "1) Install yay"
  echo "2) Set recommended locale"
  echo "3) Install basic packages"
  echo "4) Install AUR packages"
  echo "5) Set up ZSH"
  echo "6) Install Nvidia packages"
  echo "7) Install everything"
  echo "8) Exit"
  
  read -p "Select an option: " choice
  case $choice in
    1) install_yay ;;
    2) install_locale ;;
    3) install_basic_packages ;;
    4) install_aur_packages ;;
    5) setup_zsh ;;
    6) install_nvidia ;;
    7) install_all ;;
    8) exit 0 ;;
    *) echo -e "${RED}Invalid option. Please try again.${NC}" ;;
  esac
}

# Infinite loop for the menu
while true; do
  menu
done
