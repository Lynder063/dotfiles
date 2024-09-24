# My Arch Linux dotfiles

## Dependencies
- Arch based linux system
- [yay](https://github.com/Jguer/yay) 

### Script
```bash
bash ./install.sh
```

### Manual
### Install all of this in the order as below

```bash
yay -S bun-bin
```

```bash
sudo pacman -S
kitty \
ttf-hack-nerd \
ttf-jetbrains-mono-nerd \
hyprland \
xdg-desktop-portal-hyprland \
waybar \
zsh \
nautilus \
power-profiles-daemon \
polkit-gnome \
sddm \
fastfetch \
lsd \
nwg-look \
wofi \
kvantum \
hyprlock \
hypridle \
hyprpaper \
noto-fonts-emoji \
pipewire \
libgtop \
bluez \
bluez-utils \
btop \
networkmanager \
dart-sass \
wl-clipboard \
brightnessctl \
swww \
python \
gnome-bluetooth-3.0 \
pacman-contrib
```

```bash
yay -S
oh-my-zsh-git \
zsh-theme-powerlevel10k \
zsh-syntax-highlighting \
zsh-autosuggestions \
catppuccin-gtk-theme-mocha \
tela-circle-icon-theme-purple \
hyprshot \
nautilus-open-any-terminal \
grimblast-git  \
hyprpicker \
matugen-bin \
aylurs-gtk-shell-git 
```

## Setting up `ZSH`
All config will import from `.dotfiles` repo. So only thing we need is to set zsh as default

```bash
chsh -s $(which zsh)
```

## Nvidia setting up

- First of all we need to setup `optimus-manager` with some gui frontend.
  
> [!WARNING]  
> As of 24/09/2024 optimus-manager was merge into optimus-manager-git

```bash
yay -S optimus-manager-git optimus-manager-qt
```

- Now we need to create `optimus-manager` config file in `/etc/optimus-manager/optimus-manager.conf`, here is my config:

```conf
[optimus]

startup_mode=auto
# - `nvidia` (high performance, high stability, high ease, high power).
# - `integrated` (average performance, high stability, low power).
# - `hybrid` (manual nvidia offloading, flexible power).
# - `auto` (based on battery state).
# - `auto_nvdisplay` (if the display connects directly to the Nvidia GPU).

startup_auto_extpower_mode=nvidia
startup_auto_battery_mode=integrated
startup_auto_nvdisplay_on_mode=nvidia
startup_auto_nvdisplay_off_mode=integrated

switching=bbswitch
pci_power_control=no
pci_remove=no
pci_reset=no
auto_logout=yes
# HYPRLAND IS NOT SUPPORT WITH THIS AUTOLOG OUT FEATURE


[nvidia]
dynamic_power_management=fine
dynamic_power_management_memory_threshold=
DPI=96
options=
modeset=yes
PAT=yes
ignore_abi=no
allow_external_gpus=no

[intel]
driver=modesetting
DRI=3
modeset=yes

[amd]
driver=modesetting
DRI=3
```

- Now we need to install kernel modules. You can install it your way but I use beta drivers.
```bash
yay -S nvidia-beta-dkms nvidia-beta-dkms bbswitch-dkms
```


