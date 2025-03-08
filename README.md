sudo dnf install waybar dunst waybar hyprland hypridle hyprlock kitty gtk-murrine-engine blueman-manager pavucontrol kvantum ngw-look ngw-displays kvantum

Jetbrain Mono nerd font
FantasqueSansM Nerd Font
[Icons](https://github.com/vinceliuice/Tela-icon-theme) a je to standart
[Kvantum](https://github.com/catppuccin/Kvantum)

[Theme](https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme)

### Applying Themes to Flatpak Apps

- Override flatpak themes to `~/.themes`:

```sh
sudo flatpak override --filesystem=$HOME/.themes
```

- Override flatpak icons to `~/.icons`:

```sh
sudo flatpak override --filesystem=$HOME/.icons
```

- Override flatpak themes to `~/.config/gtk-4.0` locally:

```sh
flatpak override --user --filesystem=xdg-config/gtk-4.0
```

- Override flatpak themes to `~/.config/gtk-4.0` globally:

```sh
sudo flatpak override --filesystem=xdg-config/gtk-4.0
```

**Alternative Flatpak Theming: [stylepak](https://github.com/refi64/stylepak)**

./install.sh

## Flatpak
Application ID
com.github.tchx84.Flatseal                                     
com.valvesoftware.Steam                                        
com.valvesoftware.Steam.CompatibilityTool.Proton-GE            
io.freetubeapp.FreeTube                                        
org.libreoffice.LibreOffice                                    
org.mozilla.firefox                                            
org.prismlauncher.PrismLauncher                                
