# Installation instructions

## Hyprland

### From copr repo
sudo dnf copr enable solopasha/hyprland
sudo dnf install hyprland

 From source (did not work)
```
GIT_SSL_NO_VERIFY=true git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
meson _build
ninja -C _build
sudo ninja -C _build install
```
If you run into errors look here: https://github.com/hyprwm/Hyprland/discussions/284

Only needs to be done once
sudo mv example/hyprland.desktop /usr/share/wayland-sessions/

## swww (wallpaper)
```
git clone https://github.com/Horus645/swww.git
cd swww
cargo build --release
sudo cp target/release/swww /usr/local/bin
sudo cp target/release/swww-daemon /usr/local/bin
sudo cp completions/_swww /usr/share/zsh/site-functions # Fedora
sudo cp completions/_swww /usr/share/zsh/vendor-completions # Debian
```

## Screensharing
* Using nuclear option from [here](https://wiki.hyprland.org/Useful-Utilities/Hyprland-desktop-portal/) to launch xdg-desktop-portal-hyprland
