# Dotfiles

## 🔄 Mirror Repository

Tento repozitář je automaticky synchronizovaný mirror. Hlavní repozitář je hostován na [Forgejo](https://git.lynder.dev/Lynder063/dotfiles/).


## Zakladni balicky
```sh 
sudo dnf install 
waybar \
dunst \
waybar \
hyprland \
hypridle \
hyprlock \
kitty \
gtk-murrine-engine \
blueman-manager \
pavucontrol \
kvantum \
ngw-look \
ngw-displays \
kvantum power-profiles-daemon \
zsh \
NetworkManager-wifi \
zsh-syntax-highlighting \
zsh-autosuggestions \
lsd
```
## Fonty
- Jetbrain Mono nerd font
- FantasqueSansM Nerd Font

## Starship shell
Pro instalaci staci nasledovat kroky na officialni strance a zapnout podporu pro `ZSH`
[Odkaz na instalaci](https://starship.rs/guide/#%F0%9F%9A%80-installation)  

## GTK A Qt themes + icons
- [Icons](https://github.com/vinceliuice/Tela-icon-theme) a je to standard
- [Kvantum](https://github.com/catppuccin/Kvantum)
- [Theme](https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme)

## Applying Themes to Flatpak Apps

- Override flatpak themes to `~/.themes`:

```sh
sudo flatpak override --filesystem=$HOME/.themes
```

- Override flatpak icons to `~/.icons`:

```sh sudo flatpak override --filesystem=$HOME/.icons
```

- Override flatpak themes to `~/.config/gtk-4.0` locally:

```sh
flatpak override --user --filesystem=xdg-config/gtk-4.0
```

- Override flatpak themes to `~/.config/gtk-4.0` globally:

```sh
sudo flatpak override --filesystem=xdg-config/gtk-4.0
```
