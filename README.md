## Arch dotfiles

## Manual installation
### Dependencies from arch repos
```bash
sudo pacman -S hyprland sddm kitty qt5-wayland qt6-wayland xdg-desktop-portal-hyprland hypridle hyprlock hyprpaper kvantum kitty wofi waybar grim nautilus neovim pavucontrol slurp sof-firmware tela-circle-icon-theme-standard dunst zsh power-profiles-daemon hyprcursor
```
### Dependencies from AUR
```bash
yay -S hyprpolkitagent-git catppuccin-gtk-theme-macchiato envycontrol fastfetch nwg-look oh-my-zsh-git zsh-theme-powerlevel10k zsh-syntax-highlighting zsh-autosuggestions hyprshot-git bibata-cursor-theme-bin
```

- Povolení `SDDM`
```bash
sudo systemctl enable sddm
```

### Installing fonts
```bash
sudo pacman -S --needed gnu-free-fonts gsfonts lib32-fontconfig noto-fonts noto-fonts-emoji xorg-font-util xorg-fonts-100dpi xorg-fonts-75dpi xorg-mkfontscale ttf-jetbrains-mono-nerd ttf-font-awesome 
```

```bash
yay -S  ttf-ms-fonts
```

### Adding user to correct groups
```bash
sudo usermod -aG video ${USER}
sudo usermod -aG input ${USER}
```


### Setting up `ZSH`
```bash
zsh
```
- And select option **0**

- Add these lines into your `.zshrc`
```bash
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

ZSH_AUTOSUGGEST_STRATEGY=( history completion )

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
```

### Nautilus addons

[Nautilus thumbnails](https://wiki.archlinux.org/title/GNOME/Files#Thumbnails)
[Nautilus network shares](https://wiki.archlinux.org/title/GNOME/Files#Network_Shares_/_Virtual_Filesystems)


